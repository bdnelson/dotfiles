"===============================================================================
"-------------------------------------------------------------------------------
" My .vimrc file
" Brian D Nelson, <brian@forefrontlabs.com, bdnelson@gmail.com>
" 1998 - present
" Converted to neovim 4 Sep 2021
"
" This file has been developed over many years and has many ideas and configs
" that came from others.
"
"-------------------------------------------------------------------------------
"===============================================================================

"===============================================================================
"-------------------------------------------------------------------------------
" 			                   Package Manager
"-------------------------------------------------------------------------------
"===============================================================================

" Packer (https://github.com/wbthomason/packer.nvim)
lua require('plugins')

"===============================================================================
"-------------------------------------------------------------------------------
"
"                           General Configuration
"
"-------------------------------------------------------------------------------
"===============================================================================

"-------------------------------------------------------------------------------
" Constraints
"-------------------------------------------------------------------------------
set history=1000
set undolevels=100
set nobackup
set nowritebackup
set updatetime=250

"-------------------------------------------------------------------------------
" Display controls
"-------------------------------------------------------------------------------
set ruler
set visualbell
set number
set cursorline
set relativenumber

"-------------------------------------------------------------------------------
" Searching controls
"-------------------------------------------------------------------------------
set nohlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

"-------------------------------------------------------------------------------
" Indenting controls
"-------------------------------------------------------------------------------
set smarttab
set autoindent
set expandtab
set ts=4
set shiftwidth=4
set softtabstop=4

"-------------------------------------------------------------------------------
" Syntax controls
"-------------------------------------------------------------------------------
syntax on
set background=dark

"-------------------------------------------------------------------------------
" File mappings
"-------------------------------------------------------------------------------
au BufRead,BufNewFile *.mkd set filetype=markdown
au BufRead,BufNewFile *.md set filetype=markdown

"-------------------------------------------------------------------------------
" Visible Yank
"-------------------------------------------------------------------------------
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=250, on_visual=true}

"-------------------------------------------------------------------------------
" Key mappings/Additional commands
"-------------------------------------------------------------------------------

" Leader
let mapLeader="\\"
imap jj <Esc>
imap fj <Esc>

" General Key controls
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Tab navigation and control
map gr gT
map <leader>tn :tabnew<CR>
map <leader>tc :tabclose<CR>
map <leader>te :tabedit
map <leader>tm :tabmove

" Tab navigation and control
map ft <C-W><C-W>

" Tag navigation
map gi <C-]>
map go <C-t>

"===============================================================================
"-------------------------------------------------------------------------------
"
"                               Scripts/Helpers
"
"-------------------------------------------------------------------------------
"===============================================================================


"-------------------------------------------------------------------------------
" trailing whitespace
"-------------------------------------------------------------------------------
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

"-------------------------------------------------------------------------------
" Split navigation
"-------------------------------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"===============================================================================
"-------------------------------------------------------------------------------
"
"                           Plugin Configurations
"
"-------------------------------------------------------------------------------
"===============================================================================

" Colorizer (https://github.com/norcalli/nvim-colorizer.lua)
set termguicolors
lua require('colorizer').setup()

" Gitsigns (https://github.com/lewis6991/gitsigns.nvim)
lua require('gitsigns').setup()

" Telescope (https://github.com/nvim-telescope/telescope.nvim)
lua require('telescope').setup()

nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Hop (https://github.com/phaazon/hop.nvim)
lua require'hop'.setup()

" Kommentary (https://github.com/b3nj5m1n/kommentary)
"   gcc - current line
"   gc - visual selection
"   gc... - in combination with a motion
lua require('kommentary.config').setup()

" nvim-lspconfig (https://github.com/neovim/nvim-lspconfig)
"
"   Requires `rustup component add rust-src`
lua require('lspconfig').rust_analyzer.setup{}
"   Requires `npm install -g @tailwindcss/language-server`
lua require('lspconfig').tailwindcss.setup{}
"   Requires `npm install -g typescript typescript-language-server`
lua require('lspconfig').tsserver.setup{}

" barbar (https://github.com/romgrk/barbar.nvim)
"   Requires https://www.nerdfonts.com/
let bufferline = get(g:, 'bufferline', {})
let bufferline.auto_hide = v:true
let bufferline.closable = v:false
let bufferline.clickable = v:false

" nvim-tree (https://github.com/kyazdani42/nvim-tree.lua)
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache', '.idea' ]
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_git_hl = 1

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

highlight NvimTreeFolderIcon guibg=blue

" doom-one theme (https://github.com/NTBBloodbath/doom-one.nvim)
lua require('doom-one')
