-- Utilities for creating configurations
local util = require "formatter.util"

local forc = function()
  return {
    exe = "astyle",
    args = {
      "--style=bsd",
      "-n",
      util.escape_path(util.get_current_buffer_file_name()),
    },
    stdin = false,
    try_node_modules = true,
  }
end
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
      forc,
    },
    cpp = {
      forc,
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