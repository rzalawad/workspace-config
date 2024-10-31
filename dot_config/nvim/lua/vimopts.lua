opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.exrc = true    -- local vimrc in local directory where vim was initialized
opt.guicursor = "" -- keep cursor as block
opt.number = true
opt.hidden = true
opt.errorbells = false
opt.undodir = vim.fn.stdpath('config') .. '/undodir'
opt.undofile = true
opt.wrap = true
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.laststatus = 2
opt.colorcolumn = "100"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
if vim.fn.has('termguicolors') then
    opt.termguicolors = true
end
opt.completeopt = "menu,menuone"
opt.ignorecase = true
opt.smartcase = true

vim.g.completion_matching_strategy_list = { 'exact', 'substring', 'fuzzy' }

-- colorscheme
opt.background = "dark"
vim.g.sonokai_better_performance = 1
require("onedarkpro").setup({
    styles = {
        types = "NONE",
        methods = "NONE",
        numbers = "NONE",
        strings = "NONE",
        comments = "italic",
        keywords = "bold,italic",
        constants = "NONE",
        functions = "NONE",
        operators = "NONE",
        variables = "NONE",
        parameters = "italic",
        conditionals = "italic",
        virtual_text = "NONE",
    }
})

vim.cmd("colorscheme onedark_dark")

-- highlight
function highlight_create(name, val)
    vim.api.nvim_set_hl(0, name, val)
end

-- gray
highlight_create("CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#808080" })
-- blue
highlight_create("CmpItemAbbrMatch", { bg = "NONE", fg = "#569CD6" })
highlight_create("CmpItemAbbrMatchFuzzy", { bg = "NONE", fg = "#569CD6" })
-- light blue
highlight_create("CmpItemKindVariable", { bg = "NONE", fg = "#9CDCFE" })
highlight_create("CmpItemKindInterface", { bg = "NONE", fg = "#9CDCFE" })
highlight_create("CmpItemKindText", { bg = "NONE", fg = "#9CDCFE" })
-- pink
highlight_create("CmpItemKindFunction", { bg = "NONE", fg = "#C586C0" })
highlight_create("CmpItemKindMethod", { bg = "NONE", fg = "#C586C0" })
-- front
highlight_create("CmpItemKindKeyword", { bg = "NONE", fg = "#D4D4D4" })
highlight_create("CmpItemKindProperty", { bg = "NONE", fg = "#D4D4D4" })
highlight_create("CmpItemKindUnit", { bg = "NONE", fg = "#D4D4D4" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "cs", "java" },
    callback = function()
        vim.opt_local.commentstring = "// %s"
    end
})

local vcentercursor_group = vim.api.nvim_create_augroup("VCenterCursor", {})
vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter", "WinNew", "VimResized" }, {
    group = vcentercursor_group,
    pattern = { "*", "*.*" },
    callback = function()
        opt.scrolloff = math.floor(vim.fn.winheight(vim.fn.win_getid()) / 3)
    end,
})

-- jupytext
vim.g.jupytext_fmt = 'py'
vim.g.jupytext_style = 'hydrogen'

-- vim table mode
vim.g.table_mode_corner = '|'

-- markdown preview
vim.g.mkdp_port = 10000
vim.g.mkdp_echo_preview_url = 1
