-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  
  use 'dhruvasagar/vim-table-mode'
  use 'junegunn/vim-easy-align'
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use 'morhetz/gruvbox'
  use 'nvim-treesitter/nvim-treesitter'

  --Lang Support
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'hrsh7th/nvim-compe'

  use { 'kyazdani42/nvim-tree.lua',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
end)
