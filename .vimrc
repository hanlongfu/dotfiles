set nocompatible              " be iMproved, required
filetype off                  " required

"" Plugins
call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'bling/vim-airline'
  Plug 'tpope/vim-fugitive'
  Plug 'majutsushi/tagbar'
  Plug 'mg979/vim-visual-multi', {'branch':'master'}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'townk/vim-autoclose'
  Plug 'mbbill/undotree'
  Plug 'GlennLeo/cobalt2'
  Plug 'jiangmiao/auto-pairs'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'dense-analysis/ale'
  Plug 'tpope/vim-surround'
  Plug 'mhinz/vim-startify'
  Plug 'airblade/vim-gitgutter'
  Plug 'sillybun/vim-repl'
  Plug 'vim-ruby/vim-ruby'
  Plug 'junegunn/goyo.vim'
  Plug 'tpope/vim-sleuth'
  Plug 'sheerun/vim-polyglot'
call plug#end()


" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Color Scheme
" packadd! dracula
" colorscheme dracula
colorscheme cobalt2

" turn the spell checker off
set nospell

"Set terminal color
set termguicolors

" mode switching delay timeout
set timeoutlen=10

set cursorline
hi clear CursorLine
hi link CursorLine CursorColumn

" Set font
set guifont=Menlo:h17

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Disable the swapfile setting
set noswapfile

" ignore case in search
set ignorecase

" show research results as you type
set incsearch 

" set spell checking on
set spell spelllang=en_us

" show matching brackets
set showmatch

" This enables relative line numbering mode.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" This configuration makes backspace behave more reasonably. 
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" copy and paste from system clipboard
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" Skip over matching bracket using tab
inoremap <expr> <Tab> stridx('])}', getline('.')[col('.')-1])==-1 ? "\t" : "\<Right>"


" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

set splitbelow
set splitright

" remove delay in exiting visual mode
set timeoutlen=10

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Mimic the arrow key inside vim
inoremap h<Tab> <Left>
inoremap j<Tab> <Down>
inoremap k<Tab> <Up>
inoremap l<Tab> <Right>

" Map key for undotree
nnoremap <F5> :UndotreeToggle<CR>

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" enable shift + tab to insert tab in insert mode
inoremap <S-Tab> <C-V><Tab>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" use tab to escape 
nnoremap <Tab> <Esc>
vnoremap <Tab> <Esc>gV
onoremap <Tab> <Esc>
cnoremap <Tab> <C-C><Esc>
inoremap <Tab> <Esc>`^
inoremap <Leader><Tab> <Tab>
