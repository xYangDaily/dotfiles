set t_Co=256

set nocompatible
set hidden
set encoding=utf-8
syntax on
		

set cursorline
set hlsearch
"highlight CursorLine cterm=NONE ctermbg=7
"highlight CursorLineNr cterm=NONE ctermbg=15 ctermfg=8 gui=NONE guibg=#ffffff guifg=#d70000

set wildmenu

"set noshowmode
"set mouse=a
"set relativenumber
set fdm=syntax

let mapleader = "\<space>"

cnoremap <c-j> <DOWN>
cnoremap <c-k> <UP>

inoremap <CR> <CR>x<BS>
nnoremap o ox<BS>
nnoremap O Ox<BS>

set splitright
set splitbelow


inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>

nnoremap <c-u> 6<c-y>
nnoremap <c-d> 6<c-e>

call plug#begin()
Plug 'https://github.com.cnpmjs.org/easymotion/vim-easymotion'
Plug 'https://github.com.cnpmjs.org/Yggdroot/indentLine'
Plug 'https://github.com.cnpmjs.org/christoomey/vim-tmux-navigator'
Plug 'https://github.com.cnpmjs.org/roxma/vim-tmux-clipboard'
Plug 'https://github.com.cnpmjs.org/tpope/vim-eunuch'    "plugin for change filename 
Plug 'https://github.com.cnpmjs.org/qpkorr/vim-bufkill'  "plugin for close buffer without closing window
Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline'
Plug 'https://github.com.cnpmjs.org/vim-airline/vim-airline-themes'
Plug 'https://github.com.cnpmjs.org/edkolev/tmuxline.vim'
Plug 'https://github.com.cnpmjs.org/mhinz/vim-startify'
Plug 'https://github.com.cnpmjs.org/ryanoasis/vim-devicons'
Plug 'https://github.com.cnpmjs.org/gitusp/yanked-buffer'
Plug 'https://github.com.cnpmjs.org/vim-ctrlspace/vim-ctrlspace'
Plug 'https://github.com.cnpmjs.org/thezeroalpha/vim-lf'
Plug 'https://github.com.cnpmjs.org/moll/vim-bbye'
Plug 'https://github.com.cnpmjs.org/junegunn/vim-peekaboo'

Plug 'https://github.com.cnpmjs.org/luochen1990/select-and-search'
"Plug 'tenfyzhong/smart-tabline.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

nmap <silent> <tab>j <Plug>(yanked-buffer-p)

" visual mode search related 
let g:select_and_search_active = 3

nnoremap U J
nmap J <Plug>(easymotion-w)
nmap K <Plug>(easymotion-b)
vmap J <Plug>(easymotion-w)
vmap K <Plug>(easymotion-b)
"nmap <silent> <tab>j <Plug>(easymotion-w)
"nmap <silent> <tab>k <Plug>(easymotion-b)

let g:CtrlSpaceDefaultMappingKey = "<C-e> "
nnoremap H :CtrlSpaceGoUp<CR>
nnoremap L :CtrlSpaceGoDown<CR>

nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
"
let g:indentLine_fileTypeExclude = ['coc-explorer']
"let g:indentLine_setColors = 1
let g:indentLine_defaultGroup = 'SpecialKey'
"let g:indentLine_color_term = 200
let g:indentLine_showFirstIndentLevel = 1
  
  
nmap <silent> <tab>i <Plug>LfEdit
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

set backspace=2

"set showtabline=2

let g:airline_theme='bubblegum'
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = '❯'
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = '❮'
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = '❯'
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = '❮'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
let g:airline#extensions#ctrlspace#enabled = 1


"nmap <silent> <TAB>e :CocCommand explorer <CR>

" DEPRECATED CONFIGS
" 
"Plug 'voldikss/vim-floaterm'
"let g:floaterm_height=1.0
"let g:floaterm_width=0.45
"let g:floaterm_position="right"
"nnoremap   <silent> <tab>n :FloatermToggle<CR>
"nnoremap   <silent> <tab>i :FloatermToggle<CR>a
"tnoremap   <c-l>   <C-\><C-n>:FloatermToggle<CR> 
"tnoremap   <c-h> <C-\><C-N><C-w>w
"nnoremap   <silent> <tab>o  :FloatermToggle<CR><c-\><c-n>:FloatermToggle<CR> 

"nnoremap <silent> <TAB>t :tabnew<CR>
"nnoremap <silent> <TAB>l :tabnext<CR>
"nnoremap <silent> <TAB>h :tabprevious<CR>

