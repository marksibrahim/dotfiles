
set nocompatible 
"use vim, without old vi settings
"
"pathogen for plugins, all in bundle folder
execute pathogen#infect()

set mouse=a "mouse in iterm
runtime macros/matchit.vim 
"matchit plugin; matches parenthesis etc. 

"remap escape key
imap kj <Esc>
set autochdir "set working directory as that of current file

"speed
set lazyredraw
set ttyfast

"look
syntax on "synatx highlighting
set number "displays line number
set relativenumber "and line number relative to current line
set cursorline "highlight current line
set guifont=Droid_Sans_Mono_for_Powerline:h13

if $TERM_PROGRAM =~ "Terminal"
"if mac terminal, choose light colorscheme
    colorscheme pencil
else
    let g:solarized_termtrans = 1 "iterm fix
    colorscheme solarized
    set background=dark
endif

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
nnoremap <CR> :noh<CR><CR> 
"deletes searches after pressing entering command mode

set wildmenu "visual autocomplete for command menu, like :e filename<TAB>


"====================================NOTES===================================
"vimwiki
let g:vimwiki_list = [{'path': '~/Dropbox/Notes/wiki/', 'path_html': '~/Dropbox/Notes/wiki_html/'}]

"vim notes plugin
let g:notes_directories = ['~/Dropbox/Notes/vim_notes']
function! Notes()
    colorscheme pencil
    let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal
    set background=light
    set spell spelllang=en_us
    :Note Contents
endfunction
nnoremap <silent> <leader>t :call Notes()<cr>

"====================================LATEX===================================
set cole=2 "replaces symbol with latex name: >= instead of \leq
"called conceal
let g:tex_flavor = "latex" "syntax highliting
"command! L execute "silent w | silent !rubber --pdf % && open -a texshop %:r.pdf" | silent redraw!

"cursor jumps to error line
let g:LatexBox_autojump = 1
"cursor doesn't jump to error window
let g:LatexBox_quickfix = 2
"don't show specified warnings
let g:LatexBox_ignore_warnings = ['I moved some lines to the next page.', 'Underfull']

"latex folding
let g:LatexBox_Folding = 1

"stop processing after error
let g:LatexBox_latexmk_options = "-halt-on-error"

command! L execute "call Latexcompile()"
map! <c-l> <Esc> :L <CR>
map <c-l> <Esc> :L <CR>

"latexmk for compliation + clean .aux, .log files
function Latexcompile()
    silent w
    Latexmk
    "clean aux, div files if no compilation error
    if v:shell_error == 0
        LatexmkClean
    endif
endfunction

command! LX execute "silent w | silent !xelatex % && open -a texshop %:r.pdf" | silent redraw!
command! LO execute "silent !open -a texshop %:r.pdf" | silent redraw!
"! after command overrides default command


"latex template
function! LatexTemplate()
    "inserts text of template file
     r ~/Dropbox/Math/Latex/mark_template.tex
endfunction
command! LT call LatexTemplate()

"speed
autocmd FileType tex :NoMatchParen
au FileType tex setlocal norelativenumber
au FileType tex setlocal nocursorline
"===============================================================================


"===============================FILE NAV========================================

"CtrlP (for file navigation) (:Nerdtree)
let g:ctrlp_map = '<c-p>' "map command to ctrl-p
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'bottom,order:ttb' "order top to bottom 
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0 "respect directory changes
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' "for speed

let g:netrw_liststyle=3 " changes Explore style to match Nerdtree
let NERDTreeQuitOnOpen = 1 "close nerdtree after opening file
command! NE NERDTree

"==============================================================================

"airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1 "shows open buffers
let g:airline_powerline_fonts = 1

"sync site
command! S execute "!rsync -r -v ~/Dropbox/Math/Teaching/Calc_II/calc_II/ /Volumes/public_html/calc_II"



"=================================Writing Mode ===================


function! s:goyo_enter()
    set nocursorline "delete cursor line
    "for Quitting
    let b:quitting = 0
    let b:quitting_bang = 0
    autocmd QuitPre <buffer> let b:quitting = 1
    cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
    "end of Quitting
    set spell spelllang=en_us
    colorscheme pencil
    let g:pencil_neutral_code_bg = 1   " 0=gray (def), 1=normal
    set background=light
    map j gj
    map k gk
endfunction

function! s:goyo_leave()
    if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if b:quitting_bang
          qa!
        else
          qa
        endif
      endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <silent> <leader>WT :Goyo<cr>
