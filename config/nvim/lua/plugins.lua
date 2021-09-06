-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'norcalli/nvim-colorizer.lua'

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
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

    use {
        'phaazon/hop.nvim',
        as = 'hop'
    }

    use 'b3nj5m1n/kommentary'

    use 'neovim/nvim-lspconfig'

    use {
        'romgrk/barbar.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons'
        }
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use 'jeffkreeftmeijer/vim-numbertoggle'

    use 'NTBBloodbath/doom-one.nvim'

    use {'famiu/feline.nvim', config = function()
        require 'statusline'
    end}
end)
