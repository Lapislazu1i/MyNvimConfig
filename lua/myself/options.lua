
vim.opt.backup = false
vim.opt.hlsearch = true
vim.opt.smartcase = true

vim.opt.showtabline = 2
vim.opt.smartindent = false
vim.opt.autoindent = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.fileencoding = "utf-8"
vim.opt.autoread = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.updatetime = 500

vim.opt.termguicolors = true
vim.opt.wrap = false

vim.opt.cursorline = true

vim.opt.mouse = "a"

vim.o.hidden = true
vim.api.nvim_command(':filetype plugin on')

vim.opt.clipboard=autoselect

-- Neovim how to disable autoindent triggered by colon char, such as std::
vim.opt.cinkeys = "0{,0},0),0],0#,!^F,o,O,e"
vim.opt.indentkeys = "0{,0},0),0],0#,!^F,o,O,e"

vim.g.python_path = "D:/Program/Python310/python"
vim.g.lldb_path = "/usr/bin/lldb-vscode-16"
