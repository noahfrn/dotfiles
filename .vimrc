"Leader mappings
let mapleader=" "
let maplocalleader=","

"Settings
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set ruler
set splitbelow
set splitright
set hidden
set encoding=utf-8
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
set mouse=a
set t_vb=
set background=dark

colorscheme industry


"General Keymappings
nnoremap <leader>k :noh<CR>
nnoremap <leader>t :tab ter++kill=hup<CR>
nnoremap H gT
nnoremap L gt
vnoremap > >gv
vnoremap < <gv
tnoremap <S-Tab> <C-W>:tabprevious<CR>

"Cursor shape in Iterm2/Tmux
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
