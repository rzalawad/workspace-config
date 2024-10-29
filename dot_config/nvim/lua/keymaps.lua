function map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true })
end

function nmap(shortcut, command)
    map('n', shortcut, command)
end

function imap(shortcut, command)
    map('i', shortcut, command)
end

-- Telescope Using Lua functions
nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files({cwd = git_dir})<cr>")
nmap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep({cwd = git_dir})<cr>")
nmap("<leader>fd", "<cmd>lua require('telescope.builtin').find_files({cwd = dotfiles_dir})<cr>")
nmap("<leader>gf", "<cmd>lua require('telescope.builtin').git_files()<cr>")
nmap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nmap("<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
nmap("<leader>gc", "<cmd>lua custom_live_grep()<cr>")
nmap("<leader>fc", "<cmd>lua custom_find_file()<cr>")
nmap("<leader>d", "<cmd>noh<cr>")

-- Move to the next buffer
nmap("<leader>l", "<cmd>tabnext<cr>")
-- Move to the previous buffer
nmap("<leader>h", "<cmd>tabprev<cr>")
-- Close the current buffer and move to the previous one
-- This replicates the idea of closing a tab
nmap("<leader>q", "<cmd>bp <BAR> bd #<cr>")
-- Show all open buffers and their status
nmap("<leader>bl", "<cmd>ls<cr>")
imap("jj", "<Esc>")
vim.api.nvim_set_keymap("n", "<Leader>x", "<Leader>sih/^# %%<CR><CR>", {})

-- markdown preview options
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = "v:false",
    disable_filename = 0
}

-- slime
vim.g.slime_target = "tmux"
vim.g.slime_python_ipython = 1


-- telescope keymaps
vim.keymap.set(
    "n",
    "<S-h>",
    "<cmd>Telescope buffers sort_mru=true sort_lastused=true initial_mode=normal theme=ivy<cr>",
    { desc = "[P]Open telescope buffers" }
)
