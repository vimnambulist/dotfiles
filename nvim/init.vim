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
set undodir=~/.vim/undodir
set undofile

set wildmenu

set colorcolumn=80

set timeout timeoutlen=3000 ttimeoutlen=100

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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

" Making Home a defacto leader key
inoremap <Home> <nop>

" Remapping word completion
inoremap <PageUp> <c-p>
inoremap <PageDown> <c-n>
inoremap <Home><PageUp> <c-x><c-p>
inoremap <Home><PageDown> <c-x><c-n>

" shotcut to source vim config
nnoremap <Home>sc :source ~/.config/nvim/init.vim<cr>
nnoremap <Home>c :vsplit ~/.config/nvim/init.vim<cr>

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

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF

" Some fugitive magic
nnoremap <Home>s :Git<cr>
nnoremap <Home>w :Gwrite<cr>
nnoremap <Home>r :Gread<cr>
nnoremap <Home>b<cr> :Git blame<cr>
nnoremap <Home>d :Gdiffsplit<cr>
nnoremap <Home>bh :GcLog %<cr>
nnoremap <Home>p :Git push<cr>

" Let's make <End> be an escape in the terminal as well
tnoremap <End> <c-\><c-n>