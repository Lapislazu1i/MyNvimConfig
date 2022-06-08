
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
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

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)
    -- use {
    --     'w0rp/ale',
    --     ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
    --     cmd = 'ALEEnable',
    --     config = 'vim.cmd[[ALEEnable]]'
    -- }



    -- Plugins can have post-install/update hooks
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }



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
    use "williamboman/nvim-lsp-installer"
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
    use 'hrsh7th/cmp-buffer'
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin


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

    -- symbols outline
    use 'simrat39/symbols-outline.nvim'

    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

    -- lua line 
    use  'nvim-lualine/lualine.nvim'
      
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end

end
)

