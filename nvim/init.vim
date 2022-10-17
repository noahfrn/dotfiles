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
set completeopt=menu,menuone,noselect
set termguicolors

colorscheme dracula

lua require('plugins')
lua require('plugin.scope')
lua require('plugin.complete')
lua require('plugin.treesitter')
lua require('plugin.icons')
lua require('lsp')

"Plugin keymappings
"Remember that <leader>c prefix is used by nerd-commentary plugin
nnoremap <leader>g :Git
nnoremap <leader>gg :Git<CR>
nnoremap <leader>d :Dispatch
nnoremap <leader>m :Make
nnoremap <leader>o :Copen<CR>
nnoremap <leader>e :Focus

"General Keymappings
nnoremap <leader>k :noh<CR>
nnoremap H gT
nnoremap L gt
nnoremap k gk
nnoremap j gj
vnoremap > >gv
vnoremap < <gv
tnoremap <S-Tab> <C-W>:tabprevious<CR>

nnoremap <leader><leader> :Telescope find_files<CR>
nnoremap <leader>/ :Telescope live_grep<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>h :Telescope help_tags<CR>
nnoremap <leader>gs :Telescope git_status<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>x :Telescope lsp_document_symbols<CR>
nnoremap <leader>l :Telescope diagnostics<CR>

"Cursor shape in Iterm2/Tmux
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
