" => General settings
set mouse=a
set nocompatible
filetype on
filetype indent on
filetype plugin on
set nobackup
set nowb
set noswapfile
set cursorline
set number
set smarttab
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:·
set clipboard=unnamedplus
set encoding=UTF-8
set showmode
set showmatch
set showcmd
set hlsearch
set incsearch
set nowrap
set scrolloff=10
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
syntax on

" => Key mappings

let mapleader = "\<space>"

" Quick edit and reload vim config
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Remove all buffers (recent open files)
nmap <leader>Q :bufdo bdelete<cr>

" Remove highlight
noremap <silent> <esc> :noh <CR>

" Allow gf to open/create non exists file
map gf :edit <cfile><cr>

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Make Y behave like other capitals
nnoremap Y y$

" Quicky escape to normal mode
imap ii <esc>

" Save file the traditional way
imap <C-s> <esc> :w <cr>
nmap <C-s> :w <cr>

" Search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" => Plugin list
" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

"themes
Plug 'patstockwell/vim-monokai-tasty'
Plug 'joshdick/onedark.vim',                  " Dark theme
Plug 'ayu-theme/ayu-vim',
Plug 'NLKNguyen/papercolor-theme'


"telescope
Plug 'https://github.com/nvim-telescope/telescope.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-telescope/telescope-fzy-native.nvim'
Plug 'https://github.com/sharkdp/fd'
"Lsp+Treesitter
Plug 'https://github.com/junnplus/nvim-lsp-setup'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/williamboman/nvim-lsp-installer'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/cmp-path'
Plug 'https://github.com/hrsh7th/cmp-cmdline'
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/hrsh7th/cmp-vsnip'
Plug 'https://github.com/hrsh7th/vim-vsnip'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" File browser
Plug 'preservim/nerdTree'                     " File browser  
Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
Plug 'ryanoasis/vim-devicons'                 " Icon
Plug 'tiagofumo'
        \ .'/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file 
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Code syntax highlight
Plug 'yuezk/vim-js'                           " Javascript
Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
Plug 'uiiaoo/java-syntax.vim'                 " Java
Plug 'mattn/emmet-vim' 
"" Debugging
Plug 'puremourning/vimspector'                " Vimspector
" Source code version control 
Plug 'tpope/vim-fugitive'                     " Git infomation 
Plug 'tpope/vim-rhubarb' 
Plug 'airblade/vim-gitgutter'                 " Git show changes 
Plug 'samoshkin/vim-mergetool'                " Git merge
"barbar.nvim
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
"navigate
Plug 'https://github.com/easymotion/vim-easymotion' "navigation
"plug Floaterm
Plug 'voldikss/vim-floaterm'                  " Float terminal
call plug#end()

colorscheme PaperColor
set termguicolors
set background=dark
let g:airline_theme='PaperColor'
highlight LineNr term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=yellow guibg=NONE
highlight CursorLine term=none cterm=underline guibg=none guifg=white guifg=none  ctermfg=none gui=underline




" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor
