local opt = vim.opt

vim.g.mapleader = " "

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.smarttab = true

opt.scrolloff = 10
opt.inccommand = "split"
opt.ignorecase = true
opt.breakindent = true
opt.backspace = { "start", "eol", "indent" }

vim.opt.wrap = true

vim.opt.linebreak = true
vim.opt.breakindent = true
