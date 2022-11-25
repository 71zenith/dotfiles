local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(path)) > 0 then
  PAQ_BOOTSTRAP = vim.fn.system { "git" , "clone" , "--depth=1" , "https://github.com/savq/paq-nvim" , path }
  vim.cmd [[packadd paq-nvim]]
end

local status_ok, paq = pcall(require, "paq")
if not status_ok then
  return
end

paq {
  "savq/paq-nvim";
  "echasnovski/mini.nvim";
  "lewis6991/gitsigns.nvim";
  "lewis6991/impatient.nvim";
}

if PAQ_BOOTSTRAP then
  require("paq").install()
end

require('impatient').enable_profile()
