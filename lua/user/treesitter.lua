
--  Configure nvim-treesitter parsers' install_info.url
require("nvim-treesitter.install").prefer_git = true
local parsers = require("nvim-treesitter.parsers").get_parser_configs()
for _, p in pairs(parsers) do
  p.install_info.url = p.install_info.url:gsub(
    "https://github.com/",
    "git@github.com:"
  )
end

require 'nvim-treesitter.install'.compilers = { "zig", "gcc" }

-- need npm install tree-sitter-cli
local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if(not status) then
  return
end

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "html", "css", "lua", "javascript", "typescript", "tsx","vim", "python", "cpp", "c", "json", "c_sharp", "bash" },
  
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  ignore_install = {  },

  indent = {
    enable = false,
    disable= {}
  },
  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = {  },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
}





-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99


