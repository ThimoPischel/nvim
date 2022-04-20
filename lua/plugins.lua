-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'dhruvasagar/vim-table-mode'
  use 'junegunn/vim-easy-align'
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }

  -- fzf -> http://neovimcraft.com/plugin/ibhagwan/fzf-lua/index.html
  use { 'junegunn/fzf', run = './install --bin', }
  use 'junegunn/fzf.vim'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
end)
