" neovim settings

" link to Python
" strangely you need to install neovim via pip2, pip3, and brew!
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"===========================Plugins (via vim-plug)=========================
" Plugins will be downloaded under the specified directory.
call plug#begin('~/nvim-plugins-plug/')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree' " File Navigation Tree
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plug 'mileszs/ack.vim' " Text search across files (grep-like). First $brew install ack

Plug 'sheerun/vim-polyglot' " Syntax and indentation for most languages 
Plug 'altercation/vim-colors-solarized' " Solarized colors
Plug 'bling/vim-airline' " nice status line at bottom of screen (and buffers)
Plug 'vim-airline/vim-airline-themes' " color themes for airline status line
Plug 'gregsexton/MatchTag' " html highlight matching tags

Plug 'Shougo/deoplete.nvim' " async autocompletion
Plug 'ervandew/supertab' " activate autocompletion with <Tab>
Plug 'w0rp/ale' " async linter supporting most languages (be sure to install linters!)

Plug 'xolox/vim-notes' " wiki-style markdown notes
Plug 'xolox/vim-misc' " required for vim-notes

" List ends here. Plugins become visible to Vim after this call.
" Brief help
	"  PlugInstall - install plugins listed above
	"  PlugClean - delete plugins not listed above (reopen init.vim to updated)
call plug#end()

"===========================Editing=========================
" Tabs handled by tpope/vim-sleuth plugin
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.
" tab width 2 for css, html, javascript
autocmd FileType html,css,javascript setlocal shiftwidth=2 tabstop=2

" Enable mouse mode
set mouse=a

" Display both absolute and relative line numbers
set number relativenumber

" Remap espace to kj
inoremap kj <esc>

" Search is case sensitive only if it contains a capital letter
set ignorecase
set smartcase

" Spell-check Markdown files
autocmd FileType markdown setlocal spell

"===========================Multiple Files=========================
" Search text across files <command-shift-f>, equivalent to :Ack 'word' 
nmap <C-f> :Ack<space>

" Switch buffers using Tab (and Shift Tab)
	" Remember Ctrl-P also can search buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Split screen navigation
    " Switch Windows (which are a view into a buffer)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Visual autocomplete for command menu, like :e filename<TAB>
set wildmenu

"===========================Visuals=========================
colorscheme solarized
set background=dark

let g:airline#extensions#tabline#enabled = 1 " show buffers top bar
let g:airline#extensions#ale#enabled = 1 " linter uses airline to display errors
let g:airline_theme='solarized' " sets airline to solarized theme
let g:airline_powerline_fonts = 1 " use symbols for airline
set laststatus=2 " airline appears all the time

set hidden " Leave hidden buffers open  

"===========================LaTex=========================
" compile
" explanation: 
"       latexmk: tool for compilation (as many times as necessary to resolve
"       bib tex conflicts)
command! L execute "w | !latexmk -xelatex -bibtex %" | execute "!latexmk -c %"
" Shortcut to compile
nnoremap <C-T> :L<CR>

"===========================Notes=========================
let g:notes_directories = ['~/Dropbox/Notes/vim_notes']
function! Notes()
    set laststatus=0 " get rid of bottom airline bar
    set background=light
    set spell spelllang=en_us
    " j, k move up/down visual lines
    map j gj
    map k gk
    :Note Contents
endfunction
nnoremap <silent> <leader>t :call Notes()<cr>
