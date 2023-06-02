require('nvim-tree').setup({
    --ignore = ['.git', 'node_modules', '.cache', '.idea'],
    renderer = {
        highlight_opened_files = "all"
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    },
})

--let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.idea' ]


local keymap = vim.keymap

keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
keymap.set('n', '<leader>r', ':NvimTreeRefresh<CR>')
