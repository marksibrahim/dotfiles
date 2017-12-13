" neovim settings
"===========================Plugins (via vim-plug)=========================
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree' " File Navigation Tree
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder
Plug 'mileszs/ack.vim' " Text search across files (grep-like). First $brew install ack
Plug 'sheerun/vim-polyglot' "Syntax and indentation for most languages

Plug 'altercation/vim-colors-solarized' " Solarized colors
Plug 'bling/vim-airline' " nice status line at bottom of screen (and buffers)
Plug 'vim-airline/vim-airline-themes' " color themes for airline status line

" List ends here. Plugins become visible to Vim after this call.
" Brief help
    "  PlugInstall - install plugins listed above
    "  PlugClean - delete plugins not listed above (reopen init.vim to updated)
call plug#end()

"===========================Editing=========================
" Tabs are handled by polyglot plugin

" Enable mouse mode
set mouse=a

" Display both absolute and relative line numbers
set number relativenumber

" Remap espace to kj
inoremap kj <esc>

" Search is case sensitive only if it contains a capital letter
set ignorecase
set smartcase

"===========================Multiple Files=========================
" Search text across files using :Ack 'word'

" Switch buffers using Tab (and Shift Tab)
    " Remember Ctrl-P also can search buffers
nnoremap <Tab> :bnext<CR>
nnoremap <Tab> :bprevious<CR>

" Split screen navigation
    " Switch Windows (which are a view into a buffer)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Switch buffers using Tab (and Shift Tab)
    " Remember Ctrl-P also can search buffers
nnoremap <Tab> :bnext<CR>
nnoremap <Tab> :bprevious<CR>

" Visual autocomplete for command menu, like :e filename<TAB>
set wildmenu

"===========================Visuals=========================
colorscheme solarized
set background=light

let g:airline#extensions#tabline#enabled = 1 " show buffers top bar
let g:airline_theme='solarized' " sets airline to solarized theme
let g:airline_powerline_fonts = 1 " use symbols for airline
set laststatus=2 " airline appears all the time

set hidden " Leave hidden buffers open  
