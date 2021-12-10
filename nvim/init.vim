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
    Plug 'nvim-telescope/telescope.nvim'

    " Lsp
    Plug 'neovim/nvim-lspconfig'

    " Plugins for git
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    
    " Trying out completion
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " Swapping to lua snip
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    " Nice icons
    Plug 'onsails/lspkind-nvim'
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

" Experimenting with nvim-cmp
set completeopt=menu,menuone,noselect
lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      -- { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF
