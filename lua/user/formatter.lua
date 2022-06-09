-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format and FormatWrite commands
require('formatter').setup {
  -- All formatter configurations are opt-in
  filetype = {
    lua = {
      -- Pick from defaults:
      require('formatter.filetypes.lua').stylua,
    },
    javascript = {
      require('formatter.filetypes.javascript').prettier,
    },
    javascriptreact = {
      require('formatter.filetypes.javascriptreact').prettier,
    },
    typescript = {
        require('formatter.filetypes.typescript').prettier,
    },
    typescriptreact = {
      require('formatter.filetypes.typescriptreact').prettier,
    },
    c = {
      require('formatter.filetypes.c').clangformat,
    },
    cpp = {
        require('formatter.filetypes.cpp').clangformat,
    },
    cs = {
      require('formatter.filetypes.cs').dotnetformat,
    },
    python = {
      require('formatter.filetypes.python').yapf,
    },
    html = {
        require('formatter.filetypes.html').htmlbeautify,
    },
    css = {
        require('formatter.filetypes.html').stylefmt,
    },
    json = {
        require('formatter.filetypes.json').prettier,
    },
  }
}