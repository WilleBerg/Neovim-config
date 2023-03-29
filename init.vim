set runtimepath^=~/.vim runtimepath+=~/.vim/after
let g:coc_node_path = '/usr/bin/node'

" ==================== Word wrapping ==================== 
" Not working?
set cc=79
" Indents word-wrapped lines as much as the 'parent' line
set breakindent
" Ensures word-wrap does not split words
set formatoptions=l
set lbr
" =======================================================
set nocompatible            " disable compatibility to old-time vi
"set guifont=Fira\ Mono:h12 " Type the name of whatever Nerd Font you download
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set relativenumber          " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim

set t_Co=256

" Sets tab as autocomplete trigger
let g:UltiSnipsExpandTrigger = '<f5>'

" ================= Key bindings and stuff ==============
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" Stop highlighting after clicking esc
" SPACES MATTER HERE
nnoremap <silent><esc> :noh <cr><esc>
" Toggle nerdtree on F2
nnoremap <F2> :NERDTreeToggle<CR>
" Fix window height (to max)
nnoremap <F7> <C-w>_
" Toggle Startify
nnoremap <F8> :Startify <CR>
" Change window width
nnoremap <F3> <C-w><
nnoremap <F4> <C-w>>
nnoremap <F27> <C-w>5<
nnoremap <F28> <C-w>5>
nnoremap <F26> :source ~/.config/nvim/init.vim <CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" =======================================================

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

call plug#begin()
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'},
 Plug 'github/copilot.vim',
 Plug 'morhetz/gruvbox'
 Plug 'luochen1990/rainbow'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-surround'
 Plug 'MaxMEllon/vim-jsx-pretty'
 Plug 'othree/yajs.vim'
 Plug 'dense-analysis/ale'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
 " Themes
 "Plug 'ellisonleao/gruvbox.nvim'
 Plug 'nordtheme/vim'
 Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
 Plug 'jiangmiao/auto-pairs'
 "Plug 'dracula/vim'
call plug#end()

colorscheme tokyonight-night
let g:airline_theme = 'deus'


"let g:ale_linters = {
"\   'python': ['flake8', 'pylint'],
"\   'javascript': ['eslint'],
"\   'vue': ['eslint']
"\}

" set background=dark
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = 'hard'
" let g:airline_theme = 'base16_gruvbox_dark_hard'

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
autocmd VimEnter * source ~/.config/nvim/init.vim
autocmd InsertEnter * set number
autocmd InsertLeave * set relativenumber

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
