
" Find files using Telescope command-line sugar.
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fp <cmd>Telescope project<cr>

function SetupTelescope()
lua << EOF
require'telescope'.setup({
    defaults = {
        file_ignore_patterns = {
            "^.git/",
            "^./.git/",
            "^node_modules/",
            "^vendor/",
        },
    },
    pickers = {
        find_files = {
            hidden = true
        }
    }
})
require'telescope'.load_extension('zoxide')
require'telescope'.load_extension('project')
require'telescope'.load_extension('fzy_native')
EOF
endfunction

augroup TelescopeOverrides
    autocmd!
    autocmd User PlugLoaded call SetupTelescope()
augroup END
