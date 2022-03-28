local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}


-- Map jk and kj to <esc> in i, o, v mods
keymap('i', 'jk', '<esc>', opts)
keymap('o', 'jk', '<esc>', opts)
keymap('v', 'jk', '<esc>', opts)
keymap('i', 'kj', '<esc>', opts)
keymap('o', 'kj', '<esc>', opts)
keymap('v', 'kj', '<esc>', opts)

keymap('n', 'Y', 'y$', opts) 	-- Yank to end of the line

-- Map ^, $ to H, L
keymap('n', 'H', '^', opts)
keymap('n', 'L', '$', opts)

-- Set Leader and Localleader
keymap('', '<Space>', '<Nop>', {noremap = true, silent = true})
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Remove highlights
keymap('n', '<Leader>n', ':nohl<CR>', opts)

-- Save with <C-s>
keymap('i', '<C-s>', ':wa<CR>', opts)
keymap('n', '<C-s>', ':wa<CR>', opts)

-- Goto the last buffer 
keymap('n', '<Leader><Leader>',':b#<CR>', opts)

-- List all buffers with 'gb' and accept a new buffer argument 
keymap('n', 'gb', ':ls<CR>:b', opts)

-- Move to the previous buffer with 'gp'
keymap('n', 'gp', ':bp<CR>', opts)

-- Move to the next buffer with 'gn'
keymap('n', 'gn', ':bn<CR>', opts)

-- Change a keyword under cursor, then press '.' to repeat
keymap('n', 'cn', '*``cgn', opts)  -- Forword
keymap('n', 'cN', '*``cgN', opts) -- Backword

-- Close buffers with <Leader>
keymap('n', '<Leader>q', ':q<CR>', opts)
keymap('n', '<Leader>!', ':q!<CR>', opts)

-- Visual block mode to <A-v>
keymap('n', '<A-v>', '<CA-v>', opts)

-- Moving Text
keymap('v', 'J', [[:m '>+1<CR>gv=gv]],opts)
keymap('v', 'K', [[:m '<-2<CR>gv=gv]],opts)
keymap('i', '<C-j>', '<ESC>:m .+1<CR>==' ,opts)
keymap('i', '<C-k>', '<ESC>:m .-2<CR>==' ,opts)
keymap('n', '<Leader>k', ':m .-2<CR>==' ,opts)
keymap('n', '<Leader>j', ':m .+1<CR>==' ,opts)

-- Tab and Shift+Tab to indent
keymap('n', '<Tab>', '>>', opts)
keymap('n', '<S-Tab>', '<<', opts)
keymap('v', '<Tab>', '><Esc>gv', opts)
keymap('v', '<S-Tab>', '<<Esc>gv', opts)


-- Telescope
-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>ff", "<cmd>lua require'telescope.builtin'.find_files()<cr>", opts)
keymap("n", "<leader>faf", "<cmd>lua require'telescope.builtin'.find_files({hidden=true,})<cr>", opts)
keymap("n", "<leader>fb", "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<cr>", opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

