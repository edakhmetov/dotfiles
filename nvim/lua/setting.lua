vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.wo.number = true

vim.api.nvim_exec([[ autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]], false)

