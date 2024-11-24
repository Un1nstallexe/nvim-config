"All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd  " Show (partial) command in status line.
"set showmatch  " Show matching brackets.
"set ignorecase  " Do case insensitive matching
"set smartcase  " Do smart case matching
"set incsearch  " Incremental search
"set autowrite  " Automaticall#include <iostream>


"set hidden  " Hide buffers when they are abandoned
"set mouse=a  " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"call plug#begin()

" Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
"Plug 'nvim-tree/nvim-tree.lua'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'
"Plug 'neovim/nvim-lspconfig'
"Plug 'hrsh7th/cmp-nvim-lsp'
"Plug 'hrsh7th/cmp-buffer'
"Plug 'hrsh7th/cmp-path'
"Plug 'hrsh7th/cmp-cmdline'
"Plug 'hrsh7th/nvim-cmp'
"Plug 'windwp/nvim-autopairs'
"Plug 'morhetz/gruvbox'
"Plug 'lukas-reineke/indent-blankline.nvim'
"Plug 'ayu-theme/ayu-vim'
"Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" For vsnip users.
"Plug 'hrsh7th/cmp-vsnip'

"Plug 'hrsh7th/vim-vsnip-integ'

"Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
"Plug 'nvim-tree/nvim-web-devicons'
"call plug#end()
set number
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set mouse=a
let mapleader = ","
set nocompatible
filetype off
filetype plugin indent on
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set clipboard=unnamedplus

" C#

autocmd FileType cs map  <F8> :w <CR> :terminal echo Компиляция... && csc % && echo Запуск\! && /home/kir/prj/press-any-btn.out %<.exe <CR>i

" Выключение [Process exited 0] в терминале

au TermClose * call feedkeys("i")

" MESHANINA (V OSNOVNOM C/CPP)

autocmd FileType c map <F8> :w <CR> :terminal echo Компиляция... && clang % -o %<.out && echo Запуск\! && pressanybtn %<.out <CR>i
autocmd FileType cpp map <F8> :w <CR> :terminal echo Компиляция... && clang++ % -o %<.out && pressanybtn %<.out <CR>i
autocmd FileType cpp map <c-j> :w <ENTER> :terminal echo Компиляция... && clang % -o %<.out &&RED='\033[0;31m'&&NC='\033[0m' && printf "Скомпилировано в файл${RED} %<.out${NC}." && bash <ENTER>
" autocmd FileType cpp inoremap for_it for(auto& it: ) {}<ESC>i<ENTER><ENTER><ESC>kk<END>hhi
autocmd FileType c,cpp map <LEADER>run :terminal echo Запуск\! && ~/prj/press-any-btn.out ./%<.out <ENTER>i
nmap <LEADER>tree :NvimTreeToggle<ENTER>

nmap y "*y
" autocmd FileType c,cpp inoremap fori for(int i{0}; i < ; i++) {}<ESC>i<ENTER><ENTER><ESC>kk<END>hhhhhhhhi
" autocmd FileType c,cpp inoremap forj for(int j{0}; j < ; j++) {}<ESC>i<ENTER><ENTER><ESC>kk<END>hhhhhhhhi
" autocmd FileType cpp inoremap CPP_APP #include <iostream><ENTER><ENTER>typedef long long ll;<ENTER><ENTER>using namespace std;<ENTER><ENTER>int main() {}<ESC>i<ENTER><ENTER><ENTER><ESC>ki<TAB>return 0;<ESC>ki<TAB>
" autocmd FileType c inoremap C_APP #include <stdio.h><ENTER><ENTER>typedef long long ll;<ENTER><ENTER>int main() {}<ESC>i<ENTER><ENTER><ENTER><ESC>ki<TAB>return 0;<ESC>ki<TAB>

" PETUHON

autocmd FileType python map <F8> :w <ENTER>:terminal pab %<ENTER>i
" autocmd FileType python inoremap fori for i in range():<ESC>hi
" autocmd FileType python inoremap forj for j in range():<ESC>hi

" VSNIP

" imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


" PRIKOLY

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
autocmd FileType out map <F8> :w <ENTER> :terminal echo Запуск\! && ./%<ENTER>i

lua require("config.lazy")
lua require("plugin_configs")
