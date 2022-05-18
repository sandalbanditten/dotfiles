" vim-plug:
call plug#begin()
Plug 'luukvbaal/stabilize.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'jez/vim-superman'
Plug 'lervag/vimtex'
Plug 'karb94/neoscroll.nvim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'preservim/nerdtree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'ryanoasis/vim-devicons'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax on
filetype indent plugin on

lua <<EOF
-- smooth scrolling??
require('neoscroll').setup()

-- listchars
vim.opt.list = true
vim.opt.listchars:append("trail:·")
vim.opt.listchars:append("extends:»")
vim.opt.listchars:append("precedes:«")
vim.opt.listchars:append("nbsp:+")

-- blankline indentation showing
require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = false,
    show_current_context_start = false,
}

-- stabilizes buffer if a new one is opened
require("stabilize").setup()
EOF

" makes space for code diagnostics
set signcolumn=number

set noshowmode

set laststatus=3

" mapping <leader>
let mapleader = " "

" Colorscheme:
let g:gruvbox_plugin_hi_groups = 0
let g:gruvbox_italicize_strings = 0
colorscheme gruvbox8

" For lightline:
let g:lightline = {
			\ 'colorscheme': 'gruvbox',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'readonly', 'filename', 'modified' ] ],
			\   'right': [ [ 'lineinfo' ],
			\              [ 'percent' ],
			\              [ 'filetype' ] ],
			\ },
			\ }

" Highlight only the current line with the number
highlight CursorLine cterm=none ctermbg=none ctermfg=none
highlight CursorLineNr cterm=none ctermbg=none ctermfg=15
set cursorline

" nice highlight colors
highlight Normal ctermbg=0 ctermfg=15
highlight SignColumn ctermbg=0 ctermfg=15
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
" four characters wide.
set shiftwidth=4
set tabstop=4

autocmd filetype javascript set shiftwidth=2
autocmd filetype javascript set tabstop=2
autocmd filetype javascript set expandtab

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
autocmd filetype tex map <leader>c :VimtexCountWords<CR>
autocmd filetype tex map <leader>C :VimtexCountLetters<CR>
autocmd filetype tex map <leader>r :VimtexCompileSS<CR>
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

nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>N :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" Map <C-L> (redraw screen) to also turn off search highlighting until the next search
nnoremap <C-E> :nohl<CR><C-L>

" Split view remapping
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" rust remap
autocmd filetype rust map <leader>e :RustFmt<CR>
autocmd fileType rust let b:AutoPairs = AutoPairsDefine({'\w\zs<': '>'})

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

inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

" mapping gotos
" autocmd filetype rust nmap <leader>d :call CocActionAsync('jumpDefinition')<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> <leader>a :CocAction<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
