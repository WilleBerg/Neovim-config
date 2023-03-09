# Neovim-config
# TODO:
* Just upload the config file instead
A readme for when I forget how to do this.

Note:
Make sure you have Python3 and Nodejs installed.
Also download a [Nerd Font](https://www.nerdfonts.com/font-downloads)(for the devicons to work). I chose Inconsolata.


![Result](./nvim1.PNG)


1. Open Neovim
2. Run:
```
:call mkdir(stdpath('config'), 'p')
:exe 'edit '.stdpath('config').'/init.vim'
```
3. If on windows, make sure python3 is installed and can be executed by running python3 in terminal
4. If on Windows run the following:
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
If on Unix/Linux
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
If on Linux(Flatpak(This means you have the flatpak version of Neovim!!!!!)):
```
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

If these fail, [go here](https://github.com/junegunn/vim-plug)

5. Add the following to init.vim:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let g:coc_node_path = '/usr/bin/node'
set cc=79
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
set relativenumber                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline

set t_Co=256

" Sets tab as autocomplete trigger
let g:UltiSnipsExpandTrigger = '<f5>'
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

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

set ttyfast                 " Speed up scrolling in Vim
call plug#begin()
 "Plug 'Mofiqul/dracula.nvim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'},
 Plug 'github/copilot.vim',
 Plug 'morhetz/gruvbox'
 let g:gruvbox_contrast_dark = 'hard'
 Plug 'luochen1990/rainbow'
 let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 let g:airline_theme='solarized'
 let g:airline_solarized_bg='dark'
 Plug 'tpope/vim-fugitive'
call plug#end()
colorscheme gruvbox
```
5.2 (Optional) If you want Atom One Dark theme, replace 
```
colorscheme dracula
```
with
```
let g:onedark_config = {
    \ 'style': 'darker',
\}
colorscheme onedark
```
and add the following under call plug#begin()
```
Plug 'navarasu/onedark.nvim'
```
More info on onedark [here](https://github.com/navarasu/onedark.nvim)

6. Restart Neovim

7. Execute
```
:PlugInstall
```
Then
```
:PlugUpdate
```
for good measure.

8. Restart again

9. Run
```
:checkhealth provider
```
and follow instructions there if errors are occuring.
If on Windows, you probably need to follow the steps in:
```
:h provider-python
```
10. If everything seems to work, run:
```
:NERDTree
```
and navigate to where you want it to default when starting Neovim. Then, run:
```
:Bookmark "NameOfBookmark"
```
Without quotation marks!! I set "NameOfBookmark" to "code"

11. Add these to init.vim (at the bottom, don't know if order matters here):
```
autocmd VimEnter * Startify
autocmd VimEnter * NERDTree code
```
where, "code" is "NameOfBookmark".

Information about terminal inside NVIM can be found [here](https://neovim.io/doc/user/nvim_terminal_emulator.html)

Keybindings: (More on windows and tabs [here](https://neovim.io/doc/user/windows.html))
```
T to open new tab (from NERDTree)
Ctrl+left and Ctrl+right to change tabs
Ctrl+w then H J K L to move windows (Capital HJKL)
Ctrl+w then hjkl or arrow keys to switch window (move cursor)
Ctrl+w = will increase height of current window
Ctrl+w v will split current window vertically
Ctrl+\+n to enter normal mode again when in :terminal(MEGA USEFUL)

While in NERDTree, press m to open NERDTree menu
```
