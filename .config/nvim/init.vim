" neovim settings
"===========================Plugins (via vim-plug)=========================
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
Plug 'https://github.com/scrooloose/nerdtree' " File Navigation Tree
Plug 'https://github.com/sheerun/vim-polyglot' "Syntax and indentation for most languages
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file finder

Plug 'https://github.com/altercation/vim-colors-solarized' " Solarized colors
Plug 'https://github.com/bling/vim-airline' " nice status line at bottom of screen (and buffers)
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

" Use ,, to switch between buffers
nnoremap <leader><leader> :b#<CR>


"===========================Visuals=========================
colorscheme solarized
set background=light

let g:airline#extensions#tabline#enabled = 1 " show buffers top bar
let g:airline_theme='solarized' " sets airline to solarized theme
let g:airline_powerline_fonts = 1 " use symbols for airline
set laststatus=2 " airline appears all the time

set hidden " Leave hidden buffers open  
