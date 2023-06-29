
vim.opt.list = true
vim.opt.listchars:append("eol:")

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    char_list = {'|', '¦', '┆', '┊'},
    char_list_blankline = {'|', '¦', '┆', '┊'},
    context_char = '║',
    context_char_blankline = '║',
    show_end_of_line = true,
}
