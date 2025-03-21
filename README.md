# dotfiles-nvim
This repository contains all my configurations for [**Neovim**](https://neovim.io).<br>

This is meant to be a minimal Neovim setup, primarily focused on being a text editor with fancy highlighting.<br>
It does not, and will not, include any code-related features beyond [**LSP**](https://github.com/neovim/nvim-lspconfig) and [**DAP**](https://github.com/mfussenegger/nvim-dap).<br>
However, feel free to modify it to suit your needs.

### Dependencies
#### Python Related
- [**pyright**](https://microsoft.github.io/pyright/#/)
- [**debugpy**](https://github.com/microsoft/debugpy)
<br>
#### C/C++ Related
- [**clangd**](https://clangd.llvm.org/)
<br>
#### Lua
- [**lua-language-server**](https://luals.github.io/)
<br>
#### Optional
- [**ttf-font-awesome**](https://fontawesome.com/) - Their icons are being used on todo-comments.

### Plugins used
- [**catppuccin**](https://github.com/catppuccin/nvim)
- [**markdown-preview**](https://github.com/iamcco/markdown-preview.nvim)
- [**nvim-colorizer**](https://github.com/catgoose/nvim-colorizer.lua)
- [**nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig)
- [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter)
- [**todo-comments**](https://github.com/folke/todo-comments.nvim)
- [**nvim-dap**](https://github.com/mfussenegger/nvim-dap)

### Usage
Just move the files on this repository to `~/.config/nvim/`
> Pro tip: Make sure you have Neovim installed.

Make sure you create a `.venv/` folder inside `~/.config/nvim/`
so that some plugins related to Python can actually work as intended,
**OR** if you don't want to do that, just install the dependencies
along with the system.
```bash
cd ~/.config/nvim
mkdir .venv
cd .venv
python -m venv debugpy
debugpy/bin/python -m pip install debugpy
```
