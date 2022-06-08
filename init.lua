vim.g.mapleader = "'"
vim.g.maplocalleader = ""


require("user.plugins")
require("user.lspconfig")
require("user.cmp")
require("user.telescope")
require("user.treesitter")
require("user.autopairs")
-- require("user.gitsigns")
require("user.tree")
require("user.symbolsoutline")
require("user.lualine")
require("user.bufferline")

require("myself.options")
require("myself.cmake")
require("myself.filetype")

require("keymap")

vim.cmd [[colorscheme gruvbox]]
vim.background = dark