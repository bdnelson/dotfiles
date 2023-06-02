-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- Themes
    use "olimorris/onedarkpro.nvim"
    use 'norcalli/nvim-colorizer.lua'

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function ()
            require"octo".setup()
        end
    }

    -- FileTree/Search/Match
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            {
                'nvim-lua/plenary.nvim'
            }
        }
    }

    -- Movement, Hop around
    use 'karb94/neoscroll.nvim'
    use 'jeffkreeftmeijer/vim-numbertoggle'
    use {
        'phaazon/hop.nvim',
        as = 'hop'
    }

    -- Commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- LSP/Completion
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'neovim/nvim-lspconfig'
    use 'glepnir/lspsaga.nvim' -- LSP UIs
    use 'L3MON4D3/LuaSnip'

    -- Tab Bar
    use {
        'romgrk/barbar.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }

    -- Status Bar
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Parsing
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Diagnostic Feedback
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("trouble").setup { }
        end
    }

    -- Auto Pairing Tags
    use "windwp/nvim-autopairs"
    use "windwp/nvim-ts-autotag"

    -- Test Execution
    use {
        "klen/nvim-test",
        config = function()
            require('nvim-test').setup()
        end
    }

    -- Markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
