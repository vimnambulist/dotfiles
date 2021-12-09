
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
nnoremap <leader>/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>g/ <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>* <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>/<Up> <cmd>lua require('telescope.builtin').search_history()<cr>

" File Navigation
nnoremap <leader>e <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>Ex <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>ls <cmd>lua require('telescope.builtin').buffers()<cr>

" Getting help
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>man <cmd>lua require('telescope.builtin').man_pages()<cr>

" Non-linear navigation
nnoremap <leader>marks <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>ju <cmd>lua require('telescope.builtin').jumplist()<cr>

" Getting the command history
nnoremap <leader><Up> <cmd>lua require('telescope.builtin').command_history()<cr>

" Bringing up the quick fix list
nnoremap <leader>cope <cmd>lua require('telescope.builtin').quickfix()<cr>
