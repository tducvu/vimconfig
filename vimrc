"==================================================================
"==================================================================
" _    ________  _______  ______
" | |  / /  _/  |/  / __ \/ ____/
" | | / // // /|_/ / /_/ / /     
" | |/ // // /  / / _, _/ /___   
" |___/___/_/  /_/_/ |_|\____/   
"
"==================================================================
"==================================================================


"PLUGIN-----{{{
call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
  let g:tex_flavor='latex'
  let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
  set conceallevel=1
  let g:tex_conceal='abdmg'

Plug 'sirver/ultisnips'
  let g:UltiSnipsExpandTrigger = '<tab>'
  let g:UltiSnipsJumpForwardTrigger = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'dylanaraps/wal'

Plug '907th/vim-auto-save'
  let g:auto_save_silent = 1

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'junegunn/fzf.vim'
  let g:fzf_preview_window = 'right:50%'

Plug 'alvan/vim-closetag'
  let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
  let g:closetag_filetypes = 'html,xhtml,phtml'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme = 'minimalist'

call plug#end()
"}}}

"ColorScheme-----{{{
colorscheme wal
set background=dark 
"}}}

"Basic Settings------{{{
filetype plugin indent on  "determine the filetype extensions
syntax enable 	           "turn syntax highlighting on
set ai                     "Set auto indentation
set number relativenumber  "relative number at current line
set wrapmargin=5           "set margin
set numberwidth=4          "how wide the column contains the number
set nocompatible
set spell                  "enable spell check
set spelllang=en_us        "the language of checking is English
hi Conceal ctermbg=none
set encoding=utf-8         "show files as utf-8
set showcmd                "show current keybinding being executed
set hlsearch incsearch     "automatically move to text as searching
set mouse=v                "enable mouse support in all modes
set tabstop=4              "show existing tab with 4 spaces width
set shiftwidth=4           "use 4 spaces width when indenting with '>'
set expandtab              "press tab would insert 4 spaces
set pastetoggle=<F2>       "toggle paste mode(to avoid indentation when pasting)
set showmode               "show mode
"}}}
	
"MAPPING---------{{{

let mapleader = ","
let maplocalleader = "`" "have effect on Python or HTML files


"editing vimrc while coding in another file
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
"executing and sourcing the editing
nnoremap <leader>sv :source ~/.vim/vimrc<cr>

"editing vim-tex ultisnips
nnoremap <leader>eu :vsplit ~/.vim/UltiSnips/tex.snippets<cr>

"save file
nnoremap <leader>w :w<cr>

"quit without saving
nnoremap <leader>q :q!<cr>

"open the previous buffer in a horizontal split
nnoremap <leader>opb :execute "leftabove split " . bufname("#")<cr>

"delete a line 
nnoremap . dd

"copy a line
nnoremap yy 0v$y

"exit insert/visual mode
inoremap jk <Esc>
vnoremap jk <Esc>

"disable/no effects on a key 
inoremap <esc> <nop>

"paste and enter insert mode
"nnoremap p o<Esc>p

"go to the end of a line
noremap q $

"go to the beginning of a line
nnoremap <space> 0

"delete before cursor
inoremap <C-d> <BS>

"put a double quote around a sentence
nnoremap <leader>" 0i"<esc>$a"<esc>  

"save an edited file
noremap <leader>sf :wq<CR>

"do 'whatever' inside next parentheses
onoremap in( :<c-u>normal! f(vi(<cr>

"folding
nnoremap ff za

"check and fix spelling
inoremap `` <c-g>u<Esc>[s1z=`]a<c-g>u

"fzf mapping
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fs :Snippets<cr>
nnoremap <leader>fh :History<cr>
"}}}

"AUTOCOMMANDING for Python---------{{{
augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType python iabbrev <buffer> <localleader>r return
	autocmd FileType python iabbrev <buffer> <localleader>p print
augroup END
"}}}

"AUTOCOMMAND & Templates for C++----------{{{
augroup filetype_cpp
	autocmd!
	autocmd Filetype cpp nnoremap <buffer> <localleader>s mqA;<esc>`q
augroup END

autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
"}}}

"AUTOSAVE FOR TEX-FILE-----------{{{
augroup filetype_tex
	au!
    au FileType tex let b:auto_save = 1
	au FileType tex let b:auto_save_in_insert_mode = 0
augroup END
"}}}

" VimScript file settings(fold)-------{{{
augroup filetype_vim
	autocmd!
	autocmd Filetype vim setlocal foldmethod=marker
augroup END
"}}}

"Search------------{{{
highlight Search ctermbg=240 ctermfg=255
highlight IncSearch ctermbg=255 ctermfg=240
function! HighlightSearch()
	if &hls
		return 'H'
	else
		return ''
	endif
endfunction
"}}}
