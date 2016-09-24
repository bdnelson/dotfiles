"===============================================================================
"-------------------------------------------------------------------------------
" My .vimrc file
" Brian D Nelson, <brian@forefrontlabs.com, bdnelson@gmail.com>
" 1998 - present
"
" This file has been developed over many years and has many ideas and configs
" that came from others.  
"
"-------------------------------------------------------------------------------
"===============================================================================


"===============================================================================
"-------------------------------------------------------------------------------
"
"                                Vundle Setup
"
"-------------------------------------------------------------------------------
"===============================================================================


filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"-------------------------------------------------------------------------------
" Define plugins
"-------------------------------------------------------------------------------
" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'mbbill/undotree'
Plugin 'xolox/vim-misc'
Plugin 'altercation/vim-colors-solarized'
Plugin 'plasticboy/vim-markdown'
Plugin 'tsaleh/vim-align'
Plugin 'tpope/vim-endwise'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rizzatti/dash.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin '907th/vim-auto-save'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


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
set undolevels=1000
set nobackup
set nowritebackup
set updatetime=250

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
set ts=4
set shiftwidth=4
set softtabstop=4

"-------------------------------------------------------------------------------
" Syntax controls
"-------------------------------------------------------------------------------
syntax on
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

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
" Key mappings/Additional commands
"-------------------------------------------------------------------------------

" Leader
let mapLeader="\\"

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
" Auto reload .vimrc on save
"-------------------------------------------------------------------------------
if has ('autocmd') " Remain compatible with earlier versions
  augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | 
                \ echom "Reloaded " .  $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | 
                \ echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd


"===============================================================================
"-------------------------------------------------------------------------------
"
"                           Plugin Configurations
"
"-------------------------------------------------------------------------------
"===============================================================================


"-------------------------------------------------------------------------------
" Syntastic
"-------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

let g:syntastic_ruby_checkers = ['mri', 'reek']
let g:syntastic_aggregate_errors = 0

"-------------------------------------------------------------------------------
" Ctrl-P
"-------------------------------------------------------------------------------
map <leader>p :CtrlP<CR>
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

"-------------------------------------------------------------------------------
" Tagbar
"-------------------------------------------------------------------------------
nmap <leader>m :TagbarToggle<CR>

"-------------------------------------------------------------------------------
" vim-ruby
"-------------------------------------------------------------------------------
autocmd filetype ruby set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

"-------------------------------------------------------------------------------
" vim-airline
"-------------------------------------------------------------------------------
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

"-------------------------------------------------------------------------------
" vim-gitgutter
"-------------------------------------------------------------------------------
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

"-------------------------------------------------------------------------------
" undotree
"-------------------------------------------------------------------------------
nmap <leader>u :UndotreeToggle<CR>

"-------------------------------------------------------------------------------
" auto completion
"-------------------------------------------------------------------------------
inoremap <C-@> <C-x><C-o>
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set completeopt=menu,noselect,preview,noinsert

"-------------------------------------------------------------------------------
" tags
"-------------------------------------------------------------------------------
set tags+=./gems.tags

"-------------------------------------------------------------------------------
" Dash
"-------------------------------------------------------------------------------
nmap <leader>d :Dash<CR>

"-------------------------------------------------------------------------------
" Indent guides
"-------------------------------------------------------------------------------
nmap <leader>g :IndentGuidesToggle<CR>
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=237
hi IndentGuidesEven  ctermbg=236

"-------------------------------------------------------------------------------
" AutoSave
"-------------------------------------------------------------------------------
"autocmd FileType ruby,eruby let g:auto_save = 1
let g:auto_save_silent = 1
