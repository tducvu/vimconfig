"PLUGIN-----{{{
execute pathogen#infect()
syntax on
filetype plugin indent on 
"}}}

"ColorScheme-----{{{
colorscheme gruvbox 
"}}}

"Basic Settings------{{{
set bg=dark "dark background
set ai	"Set auto indentation
set number relativenumber
set wrapmargin=5
"set ruler "show cursor position
set numberwidth=4 "how wide the column contains the number
"}}}

"STATUSLINES-------{{{
set laststatus=2
set statusline=
set statusline+=%#LineNr#
set statusline+=\ %f					  "fileName
set statusline+=%7*\[%n]                                  "buffernr
"set statusline+=%1*\ %<%F\                                "File+path
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot

function! HighlightSearch()
	if &hls
		return 'H'
	else
		return ''
	endif
endfunction
"}}}
	
"MAPPING---------{{{

let mapleader = ","
let maplocalleader = "`" "have effect on Python or html files


"editing vimrc while coding in another file
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
"executing and sourcing the editing
nnoremap <leader>sv :source ~/.vim/vimrc<cr>

"delete a line 
nnoremap . dd

"copy a line
nnoremap cl v$y

"exit insert/visual mode
inoremap jk <Esc>
vnoremap jk <Esc>

"disable/no effects on a key 
inoremap <esc> <nop>

"paste and enter insert mode
noremap p o<Esc>p

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
"}}}

"AUTOCOMMANDING for Python---------{{{
augroup filetype_python
	autocmd!
	autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
	autocmd FileType python iabbrev <buffer> <localleader>r return
	autocmd FileType python iabbrev <buffer> <localleader>p print
augroup END
"}}}

" VimScript file settings(fold)-------{{{
augroup filetype_vim
	autocmd!
	autocmd Filetype vim setlocal foldmethod=marker
augroup END
"}}}

