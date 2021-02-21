set exrc
"tabnine
set rtp+=~/.config/nvim/plugged/tabnine-vim
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set guicursor =
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set clipboard=unnamedplus

set cmdheight=2
set updatetime=50
set shortmess+=c

call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'townk/vim-autoclose'
Plug 'gruvbox-community/gruvbox'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'zchee/deoplete-jedi'
Plug 'trevordmiller/nova-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
" Code formatting (for c++)
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
" Debugger plugins
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'
"Status-line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'


Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'valloric/youcompleteme'

Plug 'ludovicchabant/vim-gutentags'
Plug 'arcticicestudio/nord-vim'

Plug 'rhysd/vim-clang-format'
call plug#end()
"colorscheme gruvbox
"colorscheme nord
colorscheme palenight

highlight Normal guibg=none

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
    " autocmd VimEnter * :VimApm
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END

let mapleader = " "
"fuzzy finder keymap
nmap <C-P> :FZF<CR>
nnoremap <leader>pv :Sex!<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>

let g:ycm_clangd_uses_ycmd_caching = 0
let g:airline_theme='wombat'
let g:gutentags_enabled=0
let g:ale_fixers={'javascript':['prettier','eslint'], 'python':['black','isort']}
let g:ale_fix_on_save=1
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Stroustrup"}
let g:clang_format#auto_format_on_insert_leave=1
let g:AutoClosePreserveDotReg = 0


"Adding C++ complie and Excute
nnoremap <Leader>c :!g++ -g -Wall -Werror -o %:r.out % -std=c++2a<Enter>
nnoremap <Leader>g :!g++ -g -o %:r.out % -std=c++2a<Enter>
nnoremap <Leader>x : :!./%:r.out<Enter>
nnoremap <Leader>p :!python3 % <Enter>
