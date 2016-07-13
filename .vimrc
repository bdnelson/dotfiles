"-------------------------------------------------------------------------------
" My .vimrc file
" Brian D Nelson, <brian@forefrontlabs.com, bdnelson@gmail.com>
" 1998 - present
"
" This file has been developed over many years and has many ideas and configs
" that came from others.  I have tried to keep track of links to those
" sources, but I'm sure I haven't got them all.
"
" Sources:
"   * http://blog.adamlowe.com/2009/12/vim-destroys-all-other-rails-editors.html
"   * https://github.com/jgoulah/dotfiles/blob/master/vimrc#L178
"
" Plugins:
"   * NERDtree - https://github.com/scrooloose/nerdtree
"   * NERDcomenter - https://github.com/scrooloose/nerdcommenter
"   * ack.vim - https://github.com/mileszs/ack.vim
"   * surround.vim - https://github.com/tpope/vim-surround
"   * yankring.vim - http://www.vim.org/scripts/script.php?script_id=1234
"   * fugitive.vim - https://github.com/tpope/vim-fugitive
"   * ctrlp.vim - https://github.com/kien/ctrlp.vim
"   * rails.vim - https://github.com/tpope/vim-rails
"   * rust.vim - https://github.com/rust-lang/rust.vim.git
"
"-------------------------------------------------------------------------------

execute pathogen#infect()

filetype off
syntax on
filetype plugin indent on
let mapLeader="\\"

"-------------------------------------------------------------------------------
" Constraints
"-------------------------------------------------------------------------------
set history=1000
set undolevels=1000
set nobackup
set nowritebackup

"-------------------------------------------------------------------------------
" Display controls
"-------------------------------------------------------------------------------
set nocompatible
set ruler
set visualbell
set number
set cursorline

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
set ts=2
set shiftwidth=2

"-------------------------------------------------------------------------------
" Syntax controls
"-------------------------------------------------------------------------------
set background=dark
syntax on
colorscheme slate2
highlight Comment ctermfg=darkgrey
highlight Comment guifg=darkgrey
highlight ColorColumn ctermbg=245
highlight clear CursorLine
highlight CursorLine ctermbg=236
highlight CursorColumn ctermbg=236

"-------------------------------------------------------------------------------
" Tags
"-------------------------------------------------------------------------------
set tags+=gems.tags

"-------------------------------------------------------------------------------
" File mappings
"-------------------------------------------------------------------------------
au BufRead,BufNewFile *.mkd set filetype=markdown
au BufRead,BufNewFile *.md set filetype=markdown

"-------------------------------------------------------------------------------
" GUI controls (gvim)
"-------------------------------------------------------------------------------
set go-=T
set gfn=Monaco\ Regular:h10
set guioptions-=r

if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif


"-------------------------------------------------------------------------------
" Plugin Setup
"-------------------------------------------------------------------------------

" Setup yankring history
silent execute '!mkdir -p $HOME/.vim/tmp/yankring'
let g:yankring_history_dir =  '$HOME/.vim/tmp/yankring'
let g:yankring_manage_numbered_reg = 1

" Alternate file extensions for Obj-C
let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"

" CtrlP setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
map <leader>p :CtrlP<CR>

"-------------------------------------------------------------------------------
" Key mappings/Additional commands
"-------------------------------------------------------------------------------

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

" Tag navigation
map gi <C-]>
map go <C-t>

" Remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"-------------------------------------------------------------------------------
" Rust
"-------------------------------------------------------------------------------
set hidden

"enable mouse support
"set mouse=a 

"-------------------------------------------------------------------------------
" NERDTree
"-------------------------------------------------------------------------------
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"CTRL-t to toggle tree view with CTRL-t
nmap <silent> <C-t> :NERDTreeToggle<CR> 
"Set F2 to put the cursor to the nerdtree
nmap <silent> <F2> :NERDTreeFind<CR> 
