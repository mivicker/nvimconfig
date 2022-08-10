require("michael")

-- BASICS
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = false
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 4
vim.opt.hidden = true

-- KEYMAPS
-- Template:
-- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})

vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>q', ':wq<CR>', opts)
keymap('n', '<leader>b', ':q!<CR>', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
keymap('n', '<C-s>v', ':vsplit .<CR>', opts)
keymap('n', '<C-s>h', ':split .<CR>', opts)
keymap('n', '<leader>m', ':make<CR>', opts)

-- PACKER

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer .nvim'
end

vim.cmd('packadd packer.nvim')

local packer = require('packer')
local util = require('packer.util')

packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

-- startup and add configure plugins
packer.startup(function()
    local use = use
    -- add plugins here like
    -- use 'neovim/nvim-lspconfig'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-orgmode/orgmode'
    use 'neovim/nvim-lspconfig'
    use 'tpope/vim-fugitive'
    use 'morhetz/gruvbox'
    use 'nvim-telescope/telescope.nvim'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    end
)

require('lualine').setup {
    options = { theme = 'dracula' }
}