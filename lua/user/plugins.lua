local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    

    -- Lazy loading:
    -- Load on specific commands
    use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

    -- Load on an autocommand event
    use { 'andymass/vim-matchup', event = 'VimEnter' }

    -- install without yarn or npm
    use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
    })
    
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


    use { 'nvim-treesitter/nvim-treesitter' }

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    use { 'tjdevries/colorbuddy.vim', { 'nvim-treesitter/nvim-treesitter', opt = true } }

    -- custom

    use 'ggandor/leap.nvim'
    use 'ggandor/flit.nvim'
    
    -- colorschemes
    use {'morhetz/gruvbox', as = 'gruvbox'}
    use { 'dracula/vim', as = 'dracula' }

    -- lspconfig
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
    })

    -- clangd extension
    use 'p00f/clangd_extensions.nvim'

    use { "windwp/nvim-autopairs" }

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

    use {"akinsho/toggleterm.nvim", tag = 'v1.*'}

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

    -- comment
    use 'numToStr/Comment.nvim'
      
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

