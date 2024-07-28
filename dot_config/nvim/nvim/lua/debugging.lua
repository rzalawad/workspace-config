

require('dapui').setup()
require('dap-python').setup()

vim.api.nvim_set_keymap("n", "<Leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>db", ":DapToggleBreakpoint<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>dc", ":DapContinue<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>dr", ":lua require('dapui').open({reset = true})<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>ds", ":DapStepOver<CR>", { noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>di", ":DapStepInto<CR>", { noremap = true})
