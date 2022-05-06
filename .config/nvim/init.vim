if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
	silent! execute 'sh -c \'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim\''
    autocmd VimEnter * silent! PlugInstall
endif
call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'ghifarit53/daycula-vim', {'branch' : 'main'}
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'lervag/vimtex'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'neoclide/coc.nvim', {'branch' : 'release'}

call plug#end()

set termguicolors

colorscheme catppuccin
let g:lightline = { 'colorscheme' : 'catppuccin' }

set history=500

filetype plugin on
filetype indent on

set autoread
au Focusgained,BufEnter * checktime

let mapleader = "\\"

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

set so=7

set wildmenu

set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

set ruler

set cmdheight=1

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set hlsearch

set incsearch

set lazyredraw

set magic

set mat=2

set noerrorbells
set novisualbell
"set t_vb=
set tm=500

set foldcolumn=1

syntax enable

set encoding=utf8

set nobackup
set nowb

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set lbr
set tw=500

set ai
set si
set wrap

map <space> /
map <C-space> ?

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>ba :bufdo bd<cr>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>tx :tabnext<cr>

let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * legt g:lasttab = tabpagenr()

map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

map <leader>cd :cd %p:h<cr>:pwd<cr>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set laststatus=2

map <leader>ss :setlocal spell!<cr>

try
	set undodir=~/.vim_runtime/temp_dirs/undodir
	set undofile
catch
endtry

let g:NERDTreeWinPos="right"

let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.DS_Store']
let g:NERDTreeWinSize=35

map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NerdTreeFind<cr>



