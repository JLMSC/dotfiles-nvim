-- HACK: fix $XDG_CONFIG_HOME missing.
vim.opt.runtimepath = "~/vimruntime,/mygroup/vim,$VIMRUNTIME,~/.config/nvim/"

require("options")
require("bootstrap").bootstrap_pckr()