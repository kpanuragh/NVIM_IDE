# NVIM_IDE

**A Neovim Configuration for Rust, PHP, JavaScript, HTML, and CSS Development**

**Features:**

-   Enhanced code editing experience with LSP support for Rust, PHP, JavaScript, HTML, and CSS.
-   Efficient file management with Telescope for fuzzy finding and NvimTree for file explorer.
-   Integrated Git features with Neogit and Gitsigns.
-   Code formatting for multiple languages with Conform and LSP fallback.
-   Customizable keybindings for efficient workflows.

**Installation:**

1.  Install Neovim (0.7 or newer recommended).
2.  Clone this repository into your Neovim configuration directory (usually `~/.config/nvim`).
3.  Open nvim

**Keybindings:**

Leader key is set to space (`<space>`).

**File Actions:**

-   `<space>f`: Find file
-   `<space>s`: Live grep
-   `<space>e`: Toggle file explorer

**Git Actions:**

-   `<space>g`: Open Neogit
-   `<space>b`: Toggle line blame
-   `<space>c`: Show commit history

**Code Actions:**

-   `<space>d`: Go to definition
-   `<space>r`: Find references
-   `<space>f`: Format code
-   `<space>a`: Code actions
-   `<space>s`: Signature help
-   `<space>h`: Hover
-   `<space>p`: Document symbols
-   `<space>P`: Workspace symbols
-   `<space>R`: References
-   `<space>S`: Dynamic workspace symbols

**Customization:**

-   Modify keybindings in `lua/config/whichkey.lua` for personal preferences.
-   Adjust language-specific settings and plugins as needed.

**Plugins:**

-   See `lua/plugins` for the full list of plugins and configurations.

**Additional Information:**

-   For more detailed setup instructions and plugin documentation, refer to the respective plugin repositories and Neovim documentation.
-   Feel free to contribute to this configuration by creating issues or pull requests.

