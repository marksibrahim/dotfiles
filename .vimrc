
set nocompatible 
"use vim, without old vi settings
"pathogen for plugins, all in bundle folder
execute pathogen#infect('bundle/{}', '~/.vim/bundle/{}')

set mouse=a "mouse in iterm
runtime macros/matchit.vim 
"matchit plugin; matches parenthesis etc. 

"remap escape key
imap kj <Esc>
set autochdir "set working directory as that of current file

"look
syntax on "synatx highlighting
set number "displays line number
set cursorline "highlight current line

let g:solarized_termtrans = 1 "iterm fix
colorscheme solarized
set background=dark
set guifont=Monaco:h13

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

"indenting
set tabstop=4
set shiftwidth=4 
set expandtab "tabs are spaces
set softtabstop=4 "backspace deltes 4 spaces
set autoindent "copies indentation from previous line in new line

filetype plugin on
"searching
set ignorecase
set smartcase "search becomes case sensitive if it contains capital letter
set incsearch "show search matches as you type
set hlsearch "highlights search matches
nnoremap <CR> :noh<CR><CR> "deletes searches after pressing entering command mode

"vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/Notes/wiki/', 'path_html': '~/Dropbox/Notes/wiki_html/'}]

"latex
set cole=2 "replaces symbol with latex name: >= instead of \leq
"called conceal
let g:tex_flavor = "latex" "syntax highliting
command! L execute "silent w | silent !rubber --pdf % && open -a texshop %:r.pdf" | silent redraw!
command! LO execute "silent !open -a texshop %:r.pdf" | silent redraw!
"! after command overrides default command

"latex macros
let @b = 'i\fbox{\parbox{0.8\textwidth}{'

"vimroom, for writing
"
"ctrl p (for file navigation) (:Nerdtree)
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>' "map command to ctrl-p
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'c' "changes to directory of file

let g:netrw_liststyle=3 " changes Explore style to match Nerdtree

let NERDTreeQuitOnOpen = 1 "close nerdtree after opening file
command! NE NERDTree

"airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 "shows open buffers
let g:airline_powerline_fonts = 1

"sync site
command! S execute "!rsync -r -v ~/Dropbox/Math/Teaching/Calc_II/calc_II/ /Volumes/public_html/calc_II"
