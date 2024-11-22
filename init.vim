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

call plug#begin()

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'windwp/nvim-autopairs'
Plug 'morhetz/gruvbox'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'manzeloth/live-server'
Plug 'ayu-theme/ayu-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'

Plug 'hrsh7th/vim-vsnip-integ'

Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

let ayucolor="dark"
colorscheme ayu
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

imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'


" PRIKOLY

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
autocmd FileType out map <F8> :w <ENTER> :terminal echo Запуск\! && ./%<ENTER>i

lua << EOF_EOF_EOF

require('lualine').setup()

require("nvim-autopairs").setup{}
local lspconfig = require('lspconfig')
lspconfig.clangd.setup{}
lspconfig.pyright.setup{}
lspconfig.emmet_ls.setup{'languages'}
lspconfig.eslint.setup{}
lspconfig.tsserver.setup{}
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For vsnip users.
        -- require('luasnip').lsp_expand(args.body) -- For luasnip users.
        -- require('snippy').expand_snippet(args.body) -- For snippy users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For ultisnips users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set select to false to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the cmp_git source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for / and ? (if you enabled native_menu, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled native_menu, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
