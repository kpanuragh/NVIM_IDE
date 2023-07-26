local M = {}
M.host = "127.0.0.1"       --vim.fn.input("Enter mysql host:")
M.port = "3306"            --vim.fn.input("Enter mysql port:")
M.username = "root"        --vim.fn.input("Enter mysql username:")
M.password = "dev"         --vim.fn.input("Enter mysql password:")
M.connectionName = "oelms" --vim.fn.input("Enter Connection Name:")
local buf, win
local position = 0
local api = vim.api
local pagination = 0;
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local function display_result(command)
    -- Execute MySQL command and capture the output
    local handle = io.popen(command)
    local output = handle:read("*a")
    handle:close()

    -- Split the output into lines
    local lines = {}
    for line in output:gmatch("[^\r\n]+") do
        table.insert(lines, line)
    end

    -- Extract the table header and data
    local header = {}
    local data = {}
    for i, line in ipairs(lines) do
        local row = vim.fn.split(line, "\t")
        table.insert(data, row)
    end
    M.open_window();
    -- Format the output as a table
    M.createTableView(data);
end
local function get_selected_text()
    local bufnr = vim.api.nvim_get_current_buf()
    local start_line, start_col = unpack(vim.api.nvim_buf_get_mark(bufnr, "<"))
    local end_line, end_col = unpack(vim.api.nvim_buf_get_mark(bufnr, ">"))

    local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)

    if #lines == 0 then
        return ""
    elseif #lines == 1 then
        return lines[1]:sub(start_col + 1, end_col)
    else
        lines[1] = lines[1]:sub(start_col + 1)
        lines[#lines] = lines[#lines]:sub(1, end_col)
        return table.concat(lines, " ")
    end
end
local function parse_mysql_result(result)
    local lines = {}
    local header = true

    for line in result:gmatch("[^\r\n]+") do
        if header then
            lines.header = line
            header = false
        else
            local row = {}
            for value in line:gmatch("[^%s]+") do
                table.insert(row, value)
            end
            table.insert(lines, row)
        end
    end

    return lines
end
-- Function to render the MySQL result as a table
local function render_mysql_table(lines)
    local bufnr = api.nvim_create_buf(false, true)
    api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")
    api.nvim_buf_set_option(bufnr, "filetype", "mysql_viewer")

    local max_lengths = {}
    local content = {}

    -- Calculate the maximum length of each column
    for _, row in ipairs(lines) do
        for i, value in ipairs(row) do
            if not max_lengths[i] or #value > max_lengths[i] then
                max_lengths[i] = #value
            end
        end
    end

    -- Generate the table content
    for _, row in ipairs(lines) do
        local row_content = {}
        for i, value in ipairs(row) do
            table.insert(row_content, string.format("%-" .. max_lengths[i] .. "s", value))
        end
        table.insert(content, table.concat(row_content, "  "))
    end

    api.nvim_buf_set_lines(bufnr, 0, -1, false, content)

    return bufnr
end
local function execute(query)
    local cmd = string.format("mysql -h %s -P %s -u %s -p%s -e 'use %s;%s'", M.host, M.port, M.username, M.password,
        M.selectedDB, query)
    display_result(cmd)
end
function M.addDBConnection()
    M.host = vim.fn.input("Enter mysql host:")
    M.port = vim.fn.input("Enter mysql port:")
    M.username = vim.fn.input("Enter mysql username:")
    M.password = vim.fn.input("Enter mysql password:")
    M.connectionName = vim.fn.input("Enter Connection Name:")
    M.getDatabases();
end

function M.getDatabases()
    local cmd = string.format("mysql -h %s -P %s -u %s -p%s -e 'show databases'", M.host, M.port, M.username, M.password)
    local result = vim.fn.system(cmd)
    local lines = parse_mysql_result(result);
    local db = {}
    for _, row in ipairs(lines) do
        for i, value in ipairs(row) do
            table.insert(db, value)
        end
    end
    pickers.new({}, {
        prompt_title = string.format("%s Databases", M.connectionName),
        finder = finders.new_table {
            results = db
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                M.selectedDB = selection[1];
            end)
            return true
        end,
    }):find()
end

function M.getTables()
    local cmd = string.format("mysql -h %s -P %s -u %s -p%s -e 'use %s;show tables;'", M.host, M.port, M.username,
        M.password, M.selectedDB)
    local result = vim.fn.system(cmd)
    local lines = parse_mysql_result(result);
    local db = {}
    for _, row in ipairs(lines) do
        for i, value in ipairs(row) do
            table.insert(db, value)
        end
    end
    pickers.new({}, {
        prompt_title = string.format("%s Tables", M.selectedDB),
        finder = finders.new_table {
            results = db
        },
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                M.selectedTable = selection[1];
                pagination = 0
                local start = pagination 
                pagination  = pagination  + 10
                local query = string.format("SELECT * from %s limit %d,%d;", M.selectedTable, start,10)
                execute(query)
            end)
            return true
        end,
    }):find()
end
local function close_window()
  api.nvim_win_close(win, true)
end

function M.nextData()
    close_window()
    local start = pagination 
    pagination  = pagination  + 10;
    local query = string.format("SELECT * from %s limit %d,%d;", M.selectedTable, start, 10)
    execute(query)
end

function M.prevData()
    close_window()
    if (pagination  > 10) then
        pagination  = pagination  - 10
    else
        pagination  = 0
    end


    local query = string.format("SELECT * from %s limit %d,%d;", M.selectedTable, pagination , 10)
    execute(query)
end

function M.executSelected()
    local query = get_selected_text()
    execute(query);
end

local function center(str)
    local width = api.nvim_win_get_width(0)
    local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
    return string.rep(' ', shift) .. str
end
function M.open_window()
    buf = api.nvim_create_buf(false, true)
    local border_buf = api.nvim_create_buf(false, true)

    api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
    api.nvim_buf_set_option(buf, 'filetype', 'whid')

    local width = api.nvim_get_option("columns")
    local height = api.nvim_get_option("lines")

    local win_height = math.ceil(height * 0.8 - 4)
    local win_width = math.ceil(width * 0.8)
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    local border_opts = {
        style = "minimal",
        relative = "editor",
        width = win_width + 2,
        height = win_height + 2,
        row = row - 1,
        col = col - 1
    }

    local opts = {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col
    }

    local border_lines = { '╔' .. string.rep('═', win_width) .. '╗' }
    local middle_line = '║' .. string.rep(' ', win_width) .. '║'
    for i = 1, win_height do
        table.insert(border_lines, middle_line)
    end
    table.insert(border_lines, '╚' .. string.rep('═', win_width) .. '╝')
    api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

    local border_win = api.nvim_open_win(border_buf, true, border_opts)
    win = api.nvim_open_win(buf, true, opts)
    api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "' .. border_buf)

    api.nvim_win_set_option(win, 'cursorline', true) -- it highlight line with the cursor on it

    -- we can add title already here, because first line will never change
    api.nvim_buf_set_lines(buf, 0, -1, false, { center('What have i done?'), '', '' })
    api.nvim_buf_add_highlight(buf, -1, 'WhidHeader', 0, 0, -1)
end

function M.update_view(direction)
    api.nvim_buf_set_option(buf, 'modifiable', true)
    position = position + direction
    if position < 0 then position = 0 end

    local result = vim.fn.systemlist('git diff-tree --no-commit-id --name-only -r  HEAD~' .. position)
    if #result == 0 then table.insert(result, '') end -- add  an empty line to preserve layout if there is no results
    for k, v in pairs(result) do
        result[k] = '  ' .. result[k]
    end

    api.nvim_buf_set_lines(buf, 1, 2, false, { center('HEAD~' .. position) })
    api.nvim_buf_set_lines(buf, 3, -1, false, result)

    api.nvim_buf_add_highlight(buf, -1, 'whidSubHeader', 1, 0, -1)
    api.nvim_buf_set_option(buf, 'modifiable', false)
end

function M.createTableView(data)
    -- Calculate the maximum width of each column
    local maxColumnWidths = {}
    for _, row in ipairs(data) do
        for colIndex, value in ipairs(row) do
            maxColumnWidths[colIndex] = math.max(maxColumnWidths[colIndex] or 0, #tostring(value))
        end
    end

    -- Create the table view
    local lines = {}
    for _, row in ipairs(data) do
        local line = ""
        for colIndex, value in ipairs(row) do
            line = line .. value .. string.rep(" ", maxColumnWidths[colIndex] - #tostring(value) + 2)
        end
        table.insert(lines, line)
    end

    -- Open a new buffer and set its content
    local bufnr = buf;
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

    -- Set buffer options
    vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
    vim.api.nvim_buf_set_option(bufnr, "buftype", "nofile")
    vim.api.nvim_buf_set_option(bufnr, "bufhidden", "wipe")

    -- Set window options
    local winnr = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_option(winnr, "wrap", false)
    vim.api.nvim_win_set_option(winnr, "cursorline", false)
end

return M
