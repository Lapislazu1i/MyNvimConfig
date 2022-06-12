local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require("keymap.config")

local plug_map = {
	-- Bufferline
	["n|gb"] = map_cr("BufferLinePick"):with_noremap():with_silent(),
	["n|<A-j>"] = map_cr("BufferLineCycleNext"):with_noremap():with_silent(),
	["n|<A-k>"] = map_cr("BufferLineCyclePrev"):with_noremap():with_silent(),
	["n|<A-S-j>"] = map_cr("BufferLineMoveNext"):with_noremap():with_silent(),
	["n|<A-S-k>"] = map_cr("BufferLineMovePrev"):with_noremap():with_silent(),
	["n|<leader>be"] = map_cr("BufferLineSortByExtension"):with_noremap(),
	["n|<leader>bd"] = map_cr("BufferLineSortByDirectory"):with_noremap(),
	["n|<A-1>"] = map_cr("BufferLineGoToBuffer 1"):with_noremap():with_silent(),
	["n|<A-2>"] = map_cr("BufferLineGoToBuffer 2"):with_noremap():with_silent(),
	["n|<A-3>"] = map_cr("BufferLineGoToBuffer 3"):with_noremap():with_silent(),
	["n|<A-4>"] = map_cr("BufferLineGoToBuffer 4"):with_noremap():with_silent(),
	["n|<A-5>"] = map_cr("BufferLineGoToBuffer 5"):with_noremap():with_silent(),
	["n|<A-6>"] = map_cr("BufferLineGoToBuffer 6"):with_noremap():with_silent(),
	["n|<A-7>"] = map_cr("BufferLineGoToBuffer 7"):with_noremap():with_silent(),
	["n|<A-8>"] = map_cr("BufferLineGoToBuffer 8"):with_noremap():with_silent(),
	["n|<A-9>"] = map_cr("BufferLineGoToBuffer 9"):with_noremap():with_silent(),
	-- Packer
	["n|<leader>ps"] = map_cr("PackerSync"):with_silent():with_noremap():with_nowait(),
	["n|<leader>pu"] = map_cr("PackerUpdate"):with_silent():with_noremap():with_nowait(),
	["n|<leader>pi"] = map_cr("PackerInstall"):with_silent():with_noremap():with_nowait(),
	["n|<leader>pc"] = map_cr("PackerClean"):with_silent():with_noremap():with_nowait(),

	-- Plugin nvim-tree
	["n|<C-n>"] = map_cr("NvimTreeToggle"):with_noremap():with_silent(),
	["n|<Leader>nf"] = map_cr("NvimTreeFindFile"):with_noremap():with_silent(),
	["n|<Leader>nr"] = map_cr("NvimTreeRefresh"):with_noremap():with_silent(),

	-- Plugin Telescope
	--["n|<Leader>fp"] = map_cu("lua require('telescope').extensions.project.project{}"):with_noremap():with_silent(),
	--["n|<Leader>fr"] = map_cu("lua require('telescope').extensions.frecency.frecency{}"):with_noremap():with_silent(),
	["n|<Leader>fe"] = map_cu("Telescope oldfiles"):with_noremap():with_silent(),
	["n|<Leader>fb"] = map_cu("Telescope buffers"):with_noremap():with_silent(),
	["n|<Leader>ff"] = map_cu("Telescope find_files"):with_noremap():with_silent(),
	["n|<Leader>sc"] = map_cu("Telescope colorscheme"):with_noremap():with_silent(),
	["n|<Leader>fn"] = map_cu(":enew"):with_noremap():with_silent(),
	["n|<Leader>fw"] = map_cu("Telescope live_grep"):with_noremap():with_silent(),
	["n|<Leader>fg"] = map_cu("Telescope git_files"):with_noremap():with_silent(),
	["n|<Leader>fz"] = map_cu("Telescope zoxide list"):with_noremap():with_silent(),
	-- Plugin accelerate-jk
	-- Plugin EasyAlign
	["n|ga"] = map_cmd("v:lua.enhance_align('nga')"):with_expr(),
	["x|ga"] = map_cmd("v:lua.enhance_align('xga')"):with_expr(),
	-- Plugin split-term
	
	["n|<C-w>t"] = map_cr("VTerm"):with_noremap():with_silent(),




}

bind.nvim_load_mapping(plug_map)

vim.keymap.set('n', '<C-s>', '<Cmd>w<CR>')
-- terminal
vim.keymap.set({'n', 't'}, '<C-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.keymap.set({'n', 't'}, '<Leader>2', '<Cmd>exe 2 . "ToggleTerm"<CR>')
vim.keymap.set({'n', 't'}, '<Leader>2', '<Cmd>exe 3 . "ToggleTerm"<CR>')
vim.keymap.set({'n', 't'}, '<C-t-a>', '<Cmd>ToggleTermToggleAll<CR>')

vim.keymap.set({'n'}, '<F12>', '<Cmd>MarkdownPreviewToggle<CR>')

-- close buffer
vim.keymap.set({'n'}, '<Leader>w', '<Cmd>bd<CR>')
-- tasks
vim.keymap.set('n', '<Leader>t', require('telescope').extensions.toggletasks.spawn,
    { desc = 'toggletasks: spawn' })

-- format
vim.keymap.set('n', '<Leader><A-f>', '<Cmd>Format<CR>')
vim.keymap.set('n', '<Leader><A-F>', '<Cmd>FormatWrite<CR>')

-- split screen
vim.keymap.set('n', 'sv', "<Cmd>vsp<CR>")
vim.keymap.set('n', 'sh', "<Cmd>sp<CR>")
vim.keymap.set('n', 'sc', "<C-w>c")
vim.keymap.set('n', 'so', "<C-w>o")

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- dap
-- 显示或隐藏调试界面
vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>")