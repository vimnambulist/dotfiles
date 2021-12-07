
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

" Non-linear navigation
nnoremap <Home>marks <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <Home>ju <cmd>lua require('telescope.builtin').jumplist()<cr>

" Getting the command history
nnoremap <Home><Up> <cmd>lua require('telescope.builtin').command_history()<cr>

" Bringing up the quick fix list
nnoremap <Home>cope <cmd>lua require('telescope.builtin').quickfix()<cr>
