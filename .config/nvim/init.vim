" indent options
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set exrc " local vimrc in local directory where vim was initialized
set guicursor= " keep cursor as block
set relativenumber number
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
Plug 'vim-airline/vim-airline'
Plug 'jaredgorski/spacecamp'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'jacoborus/tender.vim'
Plug 'lervag/vimtex'
Plug 'tomasiser/vim-code-dark'
Plug 'nvim-lua/plenary.nvim'
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/edge'
Plug 'morhetz/gruvbox'
Plug 'dhruvasagar/vim-table-mode'

Plug 'chrisbra/csv.vim'

Plug 'dense-analysis/ale'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'tpope/vim-fugitive'
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

call plug#end()
" let g:airline_powerline_fonts=1
set background=dark
syntax on
" colorscheme codedark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
" colorscheme OceanicNext
" colorscheme zephyr
" colorscheme edge
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material

" let g:airline_theme = 'codedark'

let g:ale_linters = {}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'isort'],
\   'json': ['jq'],
\}

let g:ale_python_flake8_options = '--max-line-length 100'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_pydocstyle_options = '--ignore=D203,D400,D401'
let g:ale_python_black_options= '--line-length 100'
let g:ale_python_isort_options= '--line-length 100'

let g:ale_fix_on_save = 1

" My leader
let mapleader=" "

lua << EOF
    -- TELESCOPE
    git_dir = require('lspconfig').util.find_git_ancestor(vim.fn.getcwd())
    if git_dir == nil then
        git_dir = vim.fn.getcwd()
    end
EOF

" Telescope Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep({cwd = git_dir})<cr>
nnoremap <leader>gf <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>h :noh<cr>

inoremap jj <Esc>

augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/3
augroup END


set completeopt=menu,menuone
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
    require('init')
EOF

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
