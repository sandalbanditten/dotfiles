filetype indent plugin on
syntax on

" vim-plug:
call plug#begin()
Plug 'lifepillar/vim-gruvbox8'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'jez/vim-superman'
Plug 'bfrg/vim-cpp-modern'
Plug 'lervag/vimtex'
Plug 'karb94/neoscroll.nvim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'wfxr/minimap.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" smooth scrolling??
lua require('neoscroll').setup()

" makes space for code diagnostics
set signcolumn=number

set noshowmode

" mapping <leader>
let mapleader = " "

" Colorscheme:
let g:gruvbox_plugin_hi_groups = 0
let g:gruvbox_italicize_strings = 0
colorscheme gruvbox8

-" For lightline:
let g:lightline = {
			\ 'component_function': {
			\   'readonly': 'LightlineReadonly',
			\   'filetype': 'LightlineFiletype',
			\ },
			\ 'colorscheme': 'gruvbox',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified' ] ],
			\   'right': [ [ 'lineinfo' ],
			\              [ 'percent' ],
			\              [ 'filetype' ] ],
			\ },
			\ 'inactive': {
			\ 'left': [ [ 'filename' ] ],
			\ 'right': [ [ 'lineinfo' ], [ 'percent' ] ],
			\ },
			\ }

function! LightlineReadonly()
	return &readonly && &filetype !~# '\v(help|minimap)' ? 'RO' : ''
endfunction

function! LightlineFiletype()
	return winwidth(0) > 70 ? &filetype : ''
endfunction

" Highlight only the current line with the number
highlight CursorLine cterm=none ctermbg=none ctermfg=none
highlight CursorLineNr cterm=none ctermbg=none ctermfg=15
set cursorline

" nice highlight colors
highlight Normal ctermbg=0 ctermfg=15
highlight SpellBad cterm=undercurl
highlight SpellRare cterm=undercurl
highlight SpellCap cterm=undercurl
highlight SpellLocal cterm=undercurl
highlight Todo ctermfg=3 cterm=bold
highlight Number ctermfg=3
highlight Link cterm=underline
highlight Pmenu ctermbg=0 ctermfg=15
highlight Search cterm=none ctermfg=5 ctermbg=15
highlight MatchParen cterm=bold ctermbg=0
highlight texTitleArg cterm=bold ctermfg=15
highlight Sneak ctermfg=5 ctermbg=15
highlight SneakScope ctermfg=5 ctermbg=15
highlight Function ctermfg=12 ctermbg=0

let g:sneak#prompt = '> '

" relative line numbers
set number relativenumber

" opens splits below or to the right
set splitbelow splitright

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

" Start scrolling a couple of lines above the end of the view
set scrolloff=4

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

" set permanent undo
set undodir=~/.config/nvim/undo/
set undofile

" better underline
highlight Underlined cterm=underline

" set C filetype on header files
let c_syntax_for_h=1

" For LaTeX
autocmd filetype tex inoremap \( \left (  \right )<ESC>8hi
autocmd filetype tex inoremap \> \rightarrow && <ESC>a
autocmd filetype tex inoremap \,u \| \text{} \\<ESC>F}i
autocmd filetype tex inoremap \,U  Indsætter værdier:<ESC>
autocmd filetype tex inoremap \,b \textbf{}<Left>
autocmd filetype tex inoremap \,B \underline{\underline{}}<Left><Left>
autocmd filetype tex map <leader>i i\begin{align*}<ESC>o\end{align*}<ESC><<O
autocmd filetype tex map <leader>o i\begin{center}<ESC>o\fbox{\includegraphics[width=0.975\textwidth,keepaspectratio]{pics/}}<ESC>o\end{center}<ESC><<kf/a
autocmd filetype tex map <leader>O o<ESC>o\newpage<ESC>o<ESC>o
autocmd filetype tex map <leader>q :VimtexCountWords<CR>
autocmd filetype tex map <leader>Q :VimtexCountLetters<CR>
autocmd BufWritePre *.tex :%s/\s\+$//e
let g:vimtex_view_method = 'zathura'

""" Mappings

" Open buffers/windows with fzf
nmap <leader>; :Buffers<CR>
nmap <leader>' :Windows<CR>
nmap <leader>[ :Files<CR>
nmap <leader>] :Rg<CR>

" quick save and quit
nmap <leader>w :w<CR>

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy
map Y y$

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-E> :nohl<CR><C-L>

" Split view remapping
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" coc.nvim
set nobackup
set nowritebackup

set updatetime=300
set shortmess+=c

" tab completion
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" scroll windows
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

autocmd filetype rust nnoremap <leader>E :CocCommand rust-analyzer.toggleInlayHints<CR>
autocmd filetype rust nmap <leader>d :call CocActionAsync('jumpDefinition')<CR>
autocmd filetype rust map <leader>e :RustFmt<CR>
autocmd fileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})

" Code minimap
let g:minimap_width = 32
let g:minimap_highlight_range = 1
map <leader>c :MinimapToggle<CR>:MinimapUpdateHighlight<CR>

" needs to be done after the buffer is read, for some reason??
autocmd BufReadPost *
			\ highlight minimapCursor ctermbg=0 ctermfg=15 |
			\ highlight minimapRange  ctermbg=0 ctermfg=8 |
			\ let g:minimap_base_highlight = 'NonText'
