syntax on

let mapleader = "\<Delete>" 
nnoremap <Delete> <nop>
inoremap <Delete> <nop>
vnoremap <Delete> <nop>
xnoremap <Delete> <nop>
snoremap <Delete> <nop>
cnoremap <Delete> <nop>
onoremap <Delete> <nop>
tnoremap <Delete> <nop>

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

set spell spelllang=en_us

set timeout timeoutlen=2000 ttimeoutlen=100

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.local/share/nvim/site/plugged')
    " Color schemes
    Plug 'gruvbox-community/gruvbox'

    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Lsp
    Plug 'neovim/nvim-lspconfig'

    " Plugins for git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    
    " Trying out completion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'f3fora/cmp-spell'

    " Swapping to lua snip
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'nvim-treesitter/playground'
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'ray-x/cmp-treesitter'

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

" Toggle Treesitter playground
nnoremap <leader>ts :TSPlaygroundToggle<cr>
nnoremap <leader>th :TSHighlightCapturesUnderCursor<cr>

lua << EOF
require('nvim-treesitter.configs').setup {
  ensure_installed = {"python"},
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  playground = {
    enable = true,
  },
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>v",
        node_incremental = "<up>n",
        node_decremental = "<down>n",
      },
    },
    textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",

        ["ak"] = "@conditional.outer",
        ["ik"] = "@conditional.inner",

        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
    },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["<down>f"] = "@function.outer",
        ["<down>c"] = "@class.outer",
        ["<down>b"] = "@block.outer",
        ["<down>k"] = "@conditional.outer",
        ["<down>l"] = "@loop.outer",
      },
      goto_next_end = {
        ["<down>F"] = "@function.outer",
        ["<down>C"] = "@class.outer",
        ["<down>B"] = "@block.outer",
        ["<down>K"] = "@conditional.outer",
        ["<down>L"] = "@loop.outer",
      },
      goto_previous_start = {
        ["<up>f"] = "@function.outer",
        ["<up>c"] = "@class.outer",
        ["<up>b"] = "@block.outer",
        ["<up>k"] = "@conditional.outer",
        ["<up>l"] = "@loop.outer",
      },
      goto_previous_end = {
        ["<up>F"] = "@function.outer",
        ["<up>C"] = "@class.outer",
        ["<up>B"] = "@block.outer",
        ["<up>K"] = "@conditional.outer",
        ["<up>l"] = "@loop.outer",
      },
    },
  },
}
EOF
