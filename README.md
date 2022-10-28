# Neovim-config

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
If on Linux(Flatpak):
```
curl -fLo ~/.var/app/io.neovim.nvim/data/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

If these fail, [go here](https://github.com/junegunn/vim-plug)

5. Add the following to init.vim:
```
set nocompatible            " disable compatibility to old-time vi
set guifont=Inconsolata\ Nerd\ Font\ Mono:h12 " Type the name of whatever Nerd Font you download
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
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
set ttyfast                 " Speed up scrolling in Vim
call plug#begin()
 Plug 'Mofiqul/dracula.nvim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
colorscheme dracula
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
Without quotation marks!!.I set "NameOfBookmark" to "code"

11. Add these to init.vim (at the bottom, don't know if order matters here):
```
autocmd VimEnter * Startify
autocmd VimEnter * NERDTree code
```
where, "code" is "NameOfBookmark".


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
