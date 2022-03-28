local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- Global options
o.mouse = 'a'
o.scrolloff = 8
o.sidescrolloff = 10
o.updatetime = 300

-- Buffer-local options
bo.expandtab = true
bo.shiftwidth = 2
bo.softtabstop = 2

-- Window-local options
wo.number = true
wo.relativenumber = true
wo.numberwidth = 3
wo.wrap = false


-- Stop comments on newline
vim.cmd([[autocmd BufWinEnter * :set formatoptions-=c formatoptions-=r formatoptions-=o]])
