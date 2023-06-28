-- Packer Warning
local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed")
    return
end

-- Reloads Neovim after whenever you save plugins.lua
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup END
]])

packer.startup(function(use)
    -- Base
    use('wbthomason/packer.nvim')
    use('nvim-treesitter/nvim-treesitter')
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Syntax
    use("vim-python/python-syntax")
    use("ap/vim-css-color")
    use("nickeb96/fish.vim")

    -- Slightly Modifies Gruv Theme
    local custom_gruvbox = require'lualine.themes.gruvbox_dark'
    custom_gruvbox.normal.a.bg = '#98971a'

    --Status
    use("nvim-lualine/lualine.nvim")

    require('lualine').setup {
        options = {
            theme = custom_gruvbox
        }
    }

    -- Files
    use('kyazdani42/nvim-web-devicons')
    use("scrooloose/nerdtree")
    use("tiagofumo/vim-nerdtree-syntax-highlight")
    use("ryanoasis/vim-devicons")

    -- Color Scheme
    use("ellisonleao/gruvbox.nvim")
end)
