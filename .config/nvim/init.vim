filetype indent plugin on
syntax on

" vim-plug:
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'jez/vim-superman'
Plug 'arcticicestudio/nord-vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'lervag/vimtex'
Plug 'sudar/vim-arduino-syntax'
Plug 'karb94/neoscroll.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wfxr/minimap.vim'
Plug 'neovimhaskell/haskell-vim'
call plug#end()

" how not to include a script:
source ~/.config/nvim/autoclose.vim

" smooth scrolling??
lua require('neoscroll').setup()

" makes space for code diagnostics
set signcolumn=number

" better looking lightline
set noshowmode

" mapping <leader>
let mapleader = " "

" For lightline:
let g:lightline = {
			\ 'component_function': {
			\   'readonly': 'LightlineReadonly',
			\   'filetype': 'LightlineFiletype',
			\ },
			\ 'colorscheme': 'nord',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified' ] ],
			\   'right': [ [ 'lineinfo' ],
			\              [ 'percent' ],
			\              [ 'filetype' ] ],
			\ },
			\ 'inactive': {
			\ 'left': [ [ 'filename' ] ],
			\ 'right': [ [ 'percent' ], [ 'lineinfo' ] ],
			\ },
			\ }

function! LightlineReadonly()
	return &readonly && &filetype !~# '\v(help|minimap)' ? 'RO' : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? &filetype : ''
endfunction

" Nord vim stuff
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

" Colorscheme:
colorscheme nord

" nice highlight colors
highlight Search ctermfg=white ctermbg=blue
highlight SpellBad cterm=undercurl ctermfg=white
highlight SpellRare cterm=undercurl ctermfg=white
highlight SpellCap cterm=undercurl ctermfg=white
highlight SpellLocal cterm=undercurl ctermfg=white
highlight Function cterm=bold
highlight Identifier ctermfg=7
highlight Todo cterm=bold
highlight Number ctermfg=yellow
highlight Float ctermfg=yellow
highlight Link ctermfg=white cterm=underline

" relative line numbers
set number relativenumber

" opens splits below or to the right
set splitbelow splitright

" sets the current line to be highlighted
set cursorline

" wrapping and showing wrapping
set wrap linebreak
set showbreak=->

" shows tabs, trailing whitespace etc.
set list
set listchars=tab:··,lead:·,trail:·,extends:»,precedes:«,nbsp:*

" spell checking on english and danish:
map <leader>l :setlocal spell! spelllang=en_us<CR>
map <leader>L :setlocal spell! spelllang=da_dk<CR>
set spellsuggest=best,9

" yeahhhh
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-E> to temporarily turn off highlighting; see the
" mapping of <C-E> below)
set hlsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase
set is

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set shiftwidth=4
set tabstop=4
autocmd filetype tex set shiftwidth=2
autocmd filetype tex set tabstop=2
autocmd filetype c set shiftwidth=2
autocmd filetype c set tabstop=2

" Useful mappings

" better underline
highlight Underlined cterm=underline ctermfg=257

" C stuff
" set C filetype on header files
let c_syntax_for_h=1

" automatic curly brackets:
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" For LaTeX
autocmd filetype tex inoremap \( \left (  \right )<Left><Left><Left><Left><Left><Left><Left><Left><Left>
autocmd filetype tex inoremap \\| \left \|  \right \|<Left><Left><Left><Left><Left><Left><Left><Left><Left>
autocmd filetype tex inoremap \> \overrightarrow{}<ESC>i
autocmd filetype tex inoremap \< \rightarrow &&<ESC>a
autocmd filetype tex inoremap \,u \| \text{} \\<ESC>F}i
autocmd filetype tex inoremap \,U  Indsætter værdier:<ESC>
autocmd filetype tex inoremap \,b \textbf{}<Left>
autocmd filetype tex inoremap \,B \underline{\underline{}}<Left><Left>
autocmd filetype tex map <leader>i i\begin{align*}<ESC>o\end{align*}<ESC><<O
autocmd filetype tex map <leader>I i \begin{pmatrix}  \end{pmatrix}<ESC>4bhi
autocmd filetype tex map <leader>o i\begin{center}<ESC>o\fbox{\includegraphics[width=0.975\textwidth,keepaspectratio]{pics/}}<ESC>o\end{center}<ESC><<kf/a
autocmd filetype tex map <leader>O o<ESC>o\newpage<ESC>o<ESC>o
autocmd filetype tex map <leader>p i \overrightarrow{}<ESC>i
autocmd filetype tex map <leader>P i \rightarrow &&<ESC>a
autocmd filetype tex map <leader>b i \textbf{}<ESC>i
autocmd filetype tex map <leader>B i \underline{\underline{}}<ESC>hi
autocmd filetype tex map <leader>w :VimtexCountWords<CR>
autocmd filetype tex map <leader>W :VimtexCountLetters<CR>
autocmd BufWritePre *.tex :%s/\s\+$//e
let g:vimtex_view_method = 'zathura'

""" Mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-E> :nohl<CR><C-L>

" Split view remapping
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Code minimap
highlight minimapCursor ctermbg=0   ctermfg=7
highlight minimapRange  ctermbg=256 ctermfg=7

let g:minimap_width = 32
let g:minimap_highlight_range = 1
map <leader>c :MinimapToggle<CR>:MinimapUpdateHighlight<CR>

" needs to be done after the buffer is read, for some reason??
autocmd BufReadPost *
			\ highlight minimapCursor ctermbg=0   ctermfg=7 |
			\ highlight minimapRange  ctermbg=256 ctermfg=7 |
			\ let g:minimap_base_highlight = 'NonText'
