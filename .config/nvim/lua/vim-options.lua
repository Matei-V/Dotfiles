vim.cmd("set tabstop=2 shiftwidth=2 expandtab")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>t", ":botright split term://%:p:h//bash <BAR> wincmd j <BAR> horizontal resize -3 <CR>")
vim.keymap.set("n", "<C-y>", ":%y+<CR>")
vim.keymap.set("n", "<leader>g", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
