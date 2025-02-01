" NOT FUNCTIONAL YET



" Basic Settings
set nocompatible              " Disable compatibility with old versions of Vim
set encoding=utf-8            " Use UTF-8 encoding
set fileencodings=utf-8,latin1 " Default encodings

" Appearance Settings
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set showcmd                   " Show command in bottom bar
set cursorline                " Highlight the current line
set nowrap                    " Don't wrap lines
set hlsearch                  " Highlight search results
set incsearch                 " Show search results as you type
set ignorecase                " Case insensitive searching
set smartcase                 " Case-sensitive if the search contains uppercase
set termguicolors             " Enable 24-bit RGB color support

" Tab and Indentation Settings
set tabstop=4                 " Number of spaces that a <Tab> counts for
set shiftwidth=4              " Number of spaces to use for each step of (auto)indent
set expandtab                 " Use spaces instead of tabs
set smartindent               " Enable smart indentation

" Backup and Undo Settings
set backup                    " Keep a backup file
set undolevels=1000          " Unlimited undo
set undofile                  " Enable persistent undo

" Enable Mouse Support
set mouse=a                   " Enable mouse support in all modes

" Plugin Manager Configuration
"call plug#begin('~/.vim/plugged')

" Add Plugins Here
" For example:
" Plug 'tpope/vim-sensible'
" Plug 'junegunn/fzf.vim'
" Plug 'scrooloose/nerdtree'

"call plug#end()

" Key Mappings
nnoremap <C-n> :NERDTreeToggle<CR> " Toggle NERDTree with Ctrl+n
nnoremap <leader>ff :Files<CR>      " FZF file search
nnoremap <leader>fg :Ag<CR>         " FZF grep search

" Status Line Configuration
set laststatus=2                  " Always show the status line
set statusline=%f                 " Show file name in the status line
set statusline+=%y                " Show file type in the status line
set statusline+=%m                " Show modified flag in the status line

" Autocommands
augroup vimrc_autocommands
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e  " Remove trailing whitespace before saving
augroup END
