set nocompatible            " disable compatibility to old-time vi
filetype on
filetype plugin on
filetype indent on
syntax on                   " syntax highlighting
set number                  " add line numbers
set cursorline              " highlight current cursorline
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set incsearch               " incremental search
set smartcase
set showcmd
set showmode
set showmatch               " show matching
set hlsearch                " highlight search
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set smartindent
set wildmode=longest,list,full   " get bash-like tab completions
set wildmenu
set cc=130                  " set an 80 column border for good coding style
" set clipboard=unnamedplus   " using system clipboard
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set encoding=utf-8
set fileencodings=utf-8

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
    Plug 'ziglang/zig.vim'
    Plug 'rust-lang/rust.vim'
    Plug 'arrufat/vala.vim'
    Plug 'vim-scripts/c.vim'
    Plug 'gabrielelana/vim-markdown'
    Plug 'sickill/vim-pasta'
    Plug 'arcticicestudio/nord-vim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'rust-lang/rust.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'TimUntersberger/neogit'
    Plug 'c9s/vim-makefile'
call plug#end()

:lua << EOF
    local lspconfig = require('lspconfig')

    local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        require('completion').on_attach()
    end

    local servers = {'zls'}
    for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
            on_attach = on_attach,
        }
    end
EOF

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Enable completions as you type
let g:completion_enable_auto_popup = 1
