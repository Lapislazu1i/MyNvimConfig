
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup({function(use)
    -- My plugins here
    -- use 'foo1/bar1.nvim'
    -- use 'foo2/bar2.nvim'

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- Lazy loading:
    -- Load on specific commands
    use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

    -- Load on an autocommand event
    use { 'andymass/vim-matchup', event = 'VimEnter' }



    -- install without yarn or npm


    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter' }



    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    -- You can specify multiple plugins in a single call
    use { 'tjdevries/colorbuddy.vim', { 'nvim-treesitter/nvim-treesitter', opt = true } }

    -- You can alias plugin names
    use { 'dracula/vim', as = 'dracula' }



    -- custom

    -- colorschemes
    use 'morhetz/gruvbox'

    -- lspconfig
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
  }
    use { "williamboman/mason.nvim" }
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          local saga = require("lspsaga")
  
          saga.init_lsp_saga({
              -- your configuration
          })
      end,
  })


    -- clangd extension
    use 'p00f/clangd_extensions.nvim'



    -- highlight and symbols
    use {
        "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup {}
        end
    }
    use 'kyazdani42/nvim-web-devicons'
    -- file exporer
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
      }

    use {"akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
        require("toggleterm").setup()
    end}

    use {
        'jedrzejboczar/toggletasks.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'akinsho/toggleterm.nvim',
            'nvim-telescope/telescope.nvim/',
        },
        -- To enable YAML config support
        rocks = 'lyaml',
    }


    -- symbols outline
    use 'simrat39/symbols-outline.nvim'

    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    -- lua line 
    use  'nvim-lualine/lualine.nvim'

    -- formatting
    use { 'mhartington/formatter.nvim' }
    -- debug
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
    use 'rcarriga/nvim-dap-ui'
    use 'mfussenegger/nvim-dap-python'

    -- auto tag
    use 'windwp/nvim-ts-autotag'
    use 'norcalli/nvim-colorizer.lua'
      
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

end,
config = {
    git = {
      default_url_format = "git@github.com:%s",
    },
  },
})

