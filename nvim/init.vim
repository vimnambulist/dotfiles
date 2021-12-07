syntax on

set noerrorbells

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent

set nu
set relativenumber

set nowrap

set smartcase
set incsearch
set showmatch

set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile

set wildmenu

set colorcolumn=80

set timeout timeoutlen=3000 ttimeoutlen=100

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.local/share/nvim/site/plugged')
    " Color schemes
    Plug 'gruvbox-community/gruvbox'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Lsp
    Plug 'neovim/nvim-lspconfig'

    " Plugins for git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
call plug#end()

colorscheme gruvbox
set background=dark

" Centering a lot of the worflow around the thumb cluster
" Remapping escape
nnoremap <End> <Esc>
inoremap <End> <Esc>
vnoremap <End> <Esc>
xnoremap <End> <Esc>
snoremap <End> <Esc>
cnoremap <End> <Esc>
onoremap <End> <Esc>

" Remapping escape in telescope as well
lua << EOF
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            n = {
                ["<end>"] = actions.close,
            },
        },
    },
})
EOF

" Let's make <End> be an escape in the terminal as well
tnoremap <End> <c-\><c-n>

" Making Home a defacto leader key
" For some reason, not able to do this with mapleader
inoremap <Home> <nop>

" Remapping word completion
inoremap <PageUp> <c-p>
inoremap <PageDown> <c-n>
inoremap <Home><PageUp> <c-x><c-p>
inoremap <Home><PageDown> <c-x><c-n>

" shotcut to source vim config
nnoremap <Home>sc :source ~/dotfiles/nvim/init.vim<cr>
nnoremap <Home>c :vsplit ~/dotfiles/nvim/init.vim<cr>

" Greping stuff
nnoremap <Home>/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <Home>g/ <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <Home>* <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <Home>/<Up> <cmd>lua require('telescope.builtin').search_history()<cr>

" File Navigation
nnoremap <Home>e <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <Home>Ex <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <Home>ls <cmd>lua require('telescope.builtin').buffers()<cr>

" Getting help
nnoremap <Home>h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <Home>man <cmd>lua require('telescope.builtin').man_pages()<cr>

" LSP remaps
nnoremap <Home>gd <cmd>lua require('telescope.builtin').lsp_definitions()<cr>
nnoremap <Home>gr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <Home>ds <cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>
nnoremap <Home>cb <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<cr>

" Omni complete is the most important thing in my workflow :)
inoremap <Home><Space> <c-x><c-o>

" Navigating the quickfix list
nnoremap <Home>cope <cmd>lua require('telescope.builtin').quickfix()<cr>
nnoremap <Home>N :cfirst<cr>
nnoremap <Home>n :cnext<cr>
nnoremap <Home>b :cprevious<cr>
nnoremap <Home>B :clast<cr>

" Non-linear navigation
nnoremap <Home>marks <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap M `
nnoremap <Home>ju <cmd>lua require('telescope.builtin').jumplist()<cr>

" Getting the command history
nnoremap <Home><Up> <cmd>lua require('telescope.builtin').command_history()<cr>


" Some fugitive magic
nnoremap <Home>s :Git<cr>
nnoremap <Home>w :Gwrite<cr>
nnoremap <Home>r :Gread<cr>
nnoremap <Home>b<cr> :Git blame<cr>
nnoremap <Home>d :Gdiffsplit<cr>
nnoremap <Home>bh :GcLog %<cr>
nnoremap <Home>p :Git push<cr>

