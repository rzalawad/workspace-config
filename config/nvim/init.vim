" indent options
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set exrc " local vimrc in local directory where vim was initialized
set guicursor= " keep cursor as block
set number
set hidden
set noerrorbells
set undodir=~/.vim/undodir
set undofile
set nowrap
set scrolloff=10
set signcolumn=yes
set laststatus=2
set t_Co=256
set t_ut=
set clipboard=unnamed
set colorcolumn=100
if has('termguicolors')
    set termguicolors
endif

let g:python3_host_prog="/opt/homebrew/bin/python3"

call plug#begin('~/.vim/plugged')
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'vim-airline/vim-airline'
Plug 'jaredgorski/spacecamp'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'jacoborus/tender.vim'
Plug 'lervag/vimtex'
Plug 'tomasiser/vim-code-dark'
Plug 'Mofiqul/vscode.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/edge'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'
Plug 'tjdevries/colorbuddy.vim'
Plug 'sainnhe/edge'
Plug 'vigoux/oak'

Plug 'dhruvasagar/vim-table-mode'

Plug 'chrisbra/csv.vim'

Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-unimpaired'
Plug 'ThePrimeagen/refactoring.nvim'

Plug 'neovim/nvim-lspconfig' " Collection of configurations for built-in LSP client
Plug 'hrsh7th/nvim-cmp' " Autocompletion plugin
Plug 'hrsh7th/cmp-nvim-lsp' " LSP source for nvim-cmp
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip' " Snippets source for nvim-cmp
Plug 'L3MON4D3/LuaSnip' " Snippets plugin
Plug 'onsails/lspkind-nvim'
Plug 'p00f/clangd_extensions.nvim'

Plug 'jpalardy/vim-slime'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }


" Language server registry
Plug 'lspcontainers/lspcontainers.nvim'

" Rust Tools
Plug 'simrat39/rust-tools.nvim'
" Debugging
Plug 'mfussenegger/nvim-dap'

Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

Plug 'tweekmonster/startuptime.vim'

Plug 'nvim-neorg/neorg' | Plug 'nvim-lua/plenary.nvim'

Plug 'TimUntersberger/neogit'
Plug 'sindrets/diffview.nvim'

call plug#end()

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
" let vim_markdown_preview_github=1
" let vim_markdown_preview_browser='Brave Browser'


" let g:airline_powerline_fonts=1
set background=dark
" colorscheme codedark
let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
" colorscheme OceanicNext
" colorscheme zephyr
" colorscheme edge
" let g:sonokai_style = 'maia'
let g:sonokai_better_performance = 1
colorscheme sonokai
" And then somewhere in your init.vim, to set the colorscheme
" lua require('colorbuddy').colorscheme('nvim-rdark')
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material

" let g:airline_theme = 'codedark'

let g:ale_linters = {}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'rust': ['rustfmt'],
\   'json': ['jq'],
\}

let g:ale_python_flake8_options = '--max-line-length 100'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_pydocstyle_options = '--ignore=D203,D400,D401'
let g:ale_python_black_options= '--line-length 100'
let g:ale_python_isort_options= '--line-length 100'

let g:ale_fix_on_save = 1
let g:ale_disable_lsp = 1

let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" My leader
let mapleader=" "

lua << EOF
    -- TELESCOPE
    git_dir = require('lspconfig').util.find_git_ancestor(vim.fn.getcwd())
    if git_dir == nil then
        git_dir = vim.fn.getcwd()
    end
    dotfiles_dir = "~/.config/nvim/"
EOF

lua << EOF
    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            mappings = {
                i = {
                    ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
                }
            }
        }
    }
EOF

lua << EOF
    function custom_live_grep()
        local dir = vim.fn.input("Enter directory to grep: ", "", "file")
        require('telescope.builtin').live_grep({cwd = dir})
    end
    function custom_find_file()
        local dir = vim.fn.input("Enter directory to search: ", "", "file")
        require('telescope.builtin').find_files({cwd = dir})
    end
EOF

" Telescope Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({cwd = git_dir})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({cwd = git_dir})<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').find_files({cwd = dotfiles_dir})<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gc <cmd>lua custom_live_grep()<cr>
nnoremap <leader>fc <cmd>lua custom_find_file()<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>d :noh<cr>

" Move to the next buffer
nnoremap <leader>l :tabnext<CR>

" Move to the previous buffer
nnoremap <leader>h :tabprev<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nnoremap <leader>bl :ls<CR>

inoremap jj <Esc>

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/3
augroup END


set completeopt=menu,menuone
set ignorecase
set smartcase

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
    require('init')
EOF

autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
