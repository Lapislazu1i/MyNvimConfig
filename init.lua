vim.g.mapleader = "'"
vim.g.maplocalleader = ""


require("myself.options")
require("myself.cmake")
require("myself.filetype")



require("user")

require("keymap")



vim.cmd [[colorscheme gruvbox]]
vim.cmd[[highlight Normal guibg=NONE ctermbg=None]]
vim.cmd [[set spell]]
vim.background = dark
