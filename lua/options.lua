local g = vim.g
local opt = vim.opt
local api = vim.api

g.mapleader = " "
g.maplocalleader = " "

opt.clipboard = "unnamedplus"
opt.cmdheight = 2
opt.colorcolumn = "100"
opt.confirm = true
opt.cursorline = true
opt.ignorecase = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 999
opt.shiftwidth = 4
opt.shortmess = "lmrtT"
opt.showmatch = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.title = true
opt.wrap = false

api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        opt.formatoptions:remove({ "c", "r", "o" })
    end
})