vim.g.mapleader = "'"
vim.g.maplocalleader = ""


require("myself.options")
require("myself.cmake")
require("myself.filetype")

require("user.plugins")
require("user.lspconfig")

require("user.cmp")

require("user.telescope")
require("user.toggleterm")
require("user.toggletasks")

require("user.treesitter")
require("user.autopairs")

require("user.tree")
require("user.symbolsoutline")
require("user.lualine")
require("user.bufferline")


require("keymap")



vim.cmd [[colorscheme dracula]]
vim.background = dark