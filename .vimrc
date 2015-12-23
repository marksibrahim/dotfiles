set nocompatible " Use more modern Vim settings instead of vi
filetype off " required for Vundle plugin manager


"===========================Vundle=========================
set rtp+=~/.vim/bundle/Vundle.vim " set the runtime path to include Vundle and initialize
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " Vundle manages updates for Vundle

Plugin 'https://github.com/rking/ag.vim' " Program for fast file searching; powers Ctrl-P
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plugin 'https://github.com/scrooloose/nerdtree' " File Navigation Tree
Plugin 'https://github.com/tpope/vim-fugitive' " git interface

Plugin 'https://github.com/ervandew/supertab' " autocompletion with tab
Plugin 'https://github.com/tpope/vim-surround' " surround tags, parenthesis etc.
Plugin 'https://github.com/scrooloose/syntastic' " syntax checker
Plugin 'https://github.com/tpope/vim-repeat' " extends what . repeats 

Plugin 'https://github.com/altercation/vim-colors-solarized' " Solarized colors
Plugin 'https://github.com/bling/vim-airline' " nice status line at bottom of screen
Plugin 'https://github.com/jszakmeister/vim-togglecursor' " change cursor shape in insert mode

Plugin 'https://github.com/xolox/vim-misc' " Required by Vim Notes (below)
Plugin 'https://github.com/xolox/vim-notes' " Note Taking

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

set number "displays line number
set relativenumber "and line number relative to current line
set cursorline "highlight current line

let g:airline#extensions#tabline#enabled = 1 " show buffers top bar
let g:airline_powerline_fonts = 1 " use symbols for airline
set laststatus=2 " airline appears all the time

set showmatch " highlight matching [{()}]

set hidden " Leave hidden buffers open  
set lazyredraw " Redraw screen only when necessary for performance

"===========================Editing=========================
set showcmd "shows last command in bottom of screen

"spaces and tabs
set tabstop=4
set shiftwidth=4 
set expandtab " tabs are spaces
set softtabstop=4 " backspace deletes 4 spaces
set autoindent " copies indentation from previous line in new line

"searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase " search becomes case sensitive if it contains capital letter

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
map! <c-l> :L <CR> 
 " normal mode mapping
map <c-l>  :L <CR>
" open file
command! LO execute "silent !open -a texshop %:r.pdf" | silent redraw!


"===========================Writing in Vim=========================
let g:notes_directories = ['~/Dropbox/Notes/vim_notes']
function! Notes()
    set spell spelllang=en_us
    :Note Contents
endfunction
nnoremap <silent> <leader>t :call Notes()<cr>

"===========================Other=========================
set mouse=a " Use mouse in iTerm
set history=100 " save last 100 commands

inoremap kj <esc>
