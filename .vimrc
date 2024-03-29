" to load vimrc: 
    " don't use source ~/.vimrc, because bash can't parse a vimrc   
    " instead use :source ~/.vimrc within vim
    
set nocompatible " Use more modern Vim settings instead of vi
filetype off " required for Vundle plugin manager
set autochdir " set working to directory according to current file

"===========================Vundle=========================
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin('~/vim-plugins-vundle/') " set directory where plugins are installed
Plugin 'VundleVim/Vundle.vim' " Vundle manages updates for Vundle

Plugin 'mileszs/ack.vim' " Text search across files
Plugin 'qpkorr/vim-bufkill' " Keeps split window when deleting buffer; use BD
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plugin 'https://github.com/scrooloose/nerdtree' " File Navigation Tree
Plugin 'https://github.com/tpope/vim-fugitive' " git interface
Plugin 'https://github.com/sjl/gundo.vim/' " Undo Tree, usage :UndotreeToggle

Plugin 'https://github.com/ervandew/supertab' " initiate autocompletion with tab
Plugin 'https://github.com/davidhalter/jedi-vim.git' " jedi autocompletion for Python
Plugin 'https://github.com/tpope/vim-surround' " surround tags, parenthesis etc.
Plugin 'https://github.com/scrooloose/syntastic' " syntax checker
Plugin 'https://github.com/tpope/vim-repeat' " extends what . repeats 

Plugin 'https://github.com/reedes/vim-colors-pencil' " pencil color theme
Plugin 'https://github.com/altercation/vim-colors-solarized' " Solarized colors
Plugin 'derekwyatt/vim-scala' " for scala syntax highlighting
Plugin 'https://github.com/bling/vim-airline' " nice status line at bottom of screen
Plugin 'vim-airline/vim-airline-themes' " color themes for airline status line
Plugin 'https://github.com/jszakmeister/vim-togglecursor' " change cursor shape in insert mode
Plugin 'https://github.com/LaTeX-Box-Team/LaTeX-Box' " Latex 


" Brief help
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins:w

" Enter Plugins Above Here
call vundle#end()            " required
filetype plugin indent on    " required

"===========================Visuals=========================
syntax enable "Turn on syntax highlighting  
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
set guifont=Cousine\ for\ Powerline:h14 "nice font
set encoding=utf8

set number " displays line number
set relativenumber " and line number relative to current line
set cursorline " highlight current line
set linebreak " displays words on the same line (no wrapping in middle of a word)  

let g:airline#extensions#tabline#enabled = 1 " show buffers top bar
let g:airline_theme='solarized' " sets airline to solarized theme
let g:airline_powerline_fonts = 1 " use symbols for airline
set laststatus=2 " airline appears all the time

set showmatch " highlight matching [{()}]

set hidden " Leave hidden buffers open  
set lazyredraw " Redraw screen only when necessary for performance

"===========================Editing=========================
set showcmd "shows last command in bottom of screen

" spaces and tabs
set tabstop=4
set shiftwidth=4 
set expandtab " tabs are spaces
set softtabstop=4 " backspace deletes 4 spaces
set autoindent " copies indentation from previous line in new line

" set tabs to 2 spaces for yaml files
    " only do this is VIM is compiled with autocmd feature
if has("autocmd")
    filetype on
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
endif


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Persistent Undo History
    " even if you close the file!
set undodir=~/.vim/undo/
set undofile

" Switch buffers using Tab (and Shift Tab)
    " Remember Ctrl-P also can search buffers
nnoremap <Tab> :bnext<CR>
nnoremap <Tab> :bprevious<CR>

" Split screen navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase " search becomes case sensitive if it contains capital letter

" Search text across files <command-shift-f>, equivalent to :Ack 'word' 
nmap <C-f> :Ack<space>

" Syntax Errors (Syntastic Settings)
" defaults recommended by plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
" Disable automatic syntax checking. Run using :SyntasticCheck
let g:syntastic_mode_map = {"mode": "passive"}

"===========================Finding Files=========================
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' " Finds closest directory to current file
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' "for speed

set wildmenu "visual autocomplete for command menu, like :e filename<TAB>

"===========================Latex=========================
" compile
" explanation: 
"       silent: prevents need to hit enter
"       redraw! : redraws screen (must be outside of quotes to work)
"       latexmk: tool for compilation (as many times as necessary to resolve
"       bib tex conflicts
command! L execute "silent w | silent !latexmk -xelatex %" | execute "silent !latexmk -c %" | redraw!

" insert mode mapping
map! <C-X> <esc> :L <CR> 
 " normal mode mapping
map <C-X>  :L <CR>

" open file
command! LO execute "silent !open -a texshop %:r.pdf" | silent redraw!

" insert latex template
function! LatexTemplate()
    "inserts text of template file
     r ~/Dropbox/Math/Latex/mark_template.tex
endfunction
command! LT call LatexTemplate()

" turn on Latex-Box folding
let g:LatexBox_Folding = 1


"===========================Writing in Vim=========================
let g:notes_directories = ['~/Dropbox/Notes/vim_notes']
function! Notes()
    colorscheme pencil
    let g:airline_theme = 'pencil' 
    set laststatus=0 " get rid of bottom airline bar
    set guifont=Source\ Code\ Pro\ Light:h14 "nice font
    set background=light
    set spell spelllang=en_us
    " j, k move up/down visual lines
    map j gj
    map k gk
    :Note Contents
endfunction
nnoremap <silent> <leader>t :call Notes()<cr>

"===========================Other=========================
set mouse=a " Use mouse in iTerm
set history=100 " save last 100 commands

inoremap kj <esc>
