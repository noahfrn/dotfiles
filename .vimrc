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

"Plugins
call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-dispatch'
call plug#end()


"Colors
set termguicolors
set background=dark
colorscheme onedark
let g:onedark_termcolors=256
let g:airline_theme='onedark'

"Keymappings
"Remember that <leader>c prefix is used by nerd-commentary plugin
let mapleader=" "
nnoremap <leader>k :noh<CR>
nnoremap <leader><leader> :Files<CR>
nnoremap <leader>g :Git<CR>
nnoremap <leader>t :tab ter++kill=hup<CR>
nnoremap <leader>s :Ag<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>d :Dispatch
nnoremap <leader>f :Focus
nnoremap <leader>q :Copen<CR>
nnoremap H gT
nnoremap L gt
vnoremap > >gv
vnoremap < <gv
tnoremap <S-Tab> <C-W>:tabprevious<CR>
tnoremap <C-N>   <C-W>N

"Cursor shape in Iterm2/Tmux
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
