syntax on
let mapleader = "\<Delete>" 
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

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
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

" Let's make <End> be an escape in the terminal as well
tnoremap <End> <c-\><c-n>

" shotcut to source vim config
nnoremap <leader>sc :source ~/dotfiles/nvim/init.vim<cr>
nnoremap <leader>c :vsplit ~/dotfiles/nvim/init.vim<cr>

" Navigating the quickfix list
nnoremap <leader>N :cfirst<cr>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>b :cprevious<cr>
nnoremap <leader>B :clast<cr>

" Playing around with making marks easier to use
nnoremap M `

