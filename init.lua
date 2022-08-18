vim.g.mapleader = "'"
vim.g.maplocalleader = ""


require("myself.options")
require("myself.cmake")
require("myself.filetype")



require("user")

require("keymap")



vim.cmd [[colorscheme gruvbox]]
vim.background = dark