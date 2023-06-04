"----------------------------------------------------------------------
" Settings
"----------------------------------------------------------------------

" General settings
syntax on           " Enable filetype detection
set number          " Show line numbers
set ruler           " Show cursor's line and column number
set hidden          " Background buffers
set splitbelow      " Vertical splits appear below by default
set splitright      " Vertical splits appear to the right by default
set list            " Show invisible characters
set listchars=tab:›\ ,eol:¬,trail:⋅ "Set the characters for the invisibles
set visualbell
set showmatch       " Show matching brace
set showmode        " Show current mode
set colorcolumn=80  " Enable 80 character column limit
set encoding=utf-8
set sessionoptions="curdir,folds,help,options,tabpages,winsize"
set cmdheight=2
set updatetime=300


"set t_vb=

" Search settings
set hlsearch    " Highlight results
set incsearch   " Start showing results as you type
set smartcase   " Smarter case sensitivity
set ignorecase  " Ignore casing

" Tab settings
set expandtab     " Expand tabs automagically
set tabstop=4     " Tab width in spaces
set shiftwidth=4  " Amount of spaces when shifting
set softtabstop=4 " Soft tab width in spaces

" Tab completion settings
set wildmode=list:longest     " Match on longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc         " Ignore Python compiled files
set wildignore+=*.swp         " Ignore vim backups

" Backup settings
set nobackup
set nowritebackup

" Color settings
set termguicolors
set background=dark

"----------------------------------------------------------------------
" Key mappings
"----------------------------------------------------------------------

"Leader mappings
let mapleader=" "
let maplocalleader=","

" Mode switching
inoremap jj <esc>
inoremap jJ <esc>
inoremap Jj <esc>
inoremap JJ <esc>
inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

" Visual up and down instead of whole lines
map j gj
map k gk

" Cd to the directory containing the file in the buffer
nmap <leader>cd :cd %:h<CR>
nmap <leader>lcd :lcd %:h<CR>

" Better split navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
if has('nvim')
  nnoremap <BS> <C-W>h
endif

" Yanking to the system clipboard
map <leader>y "+y
map <leader>p "+p

" Get rid of search highlights
noremap <silent><leader>k :nohlsearch<cr>

" Terminal mode
if has("nvim")
    tnoremap <esc> <C-\><C-n>
    tnoremap jj <C-\><C-n>
    tnoremap jJ <C-\><C-n>
    tnoremap Jj <C-\><C-n>
    tnoremap JJ <C-\><C-n>
    tnoremap jk <C-\><C-n>
    tnoremap jK <C-\><C-n>
    tnoremap Jk <C-\><C-n>
    tnoremap JK <C-\><C-n>
    nnoremap <leader>t :terminal <CR>
endif

" Tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <C-c> :tabclose<CR>
nnoremap <C-[> :tabprevious<CR>
nnoremap <C-]> :tabnext<CR>

" Writing as root
cmap w!! %!sudo tee > /dev/null %

" Easier indenting
vnoremap > >gv
vnoremap < <gv

" Tab navigation
map <D-S-{> :tabprevious
map <D-S-}> :tabprevious

" Quick resizing
nnoremap <S-Up> <cmd>resize -2<CR>
nnoremap <S-Down> <cmd>resize +2<CR>
nnoremap <S-Left> <cmd>vertical resize -2<CR>
nnoremap <S-right> <cmd>vertical resize +2<CR>

nnoremap <leader>o :Copen<CR>
nnoremap <C-q> :cclose<CR>

"----------------------------------------------------------------------
" Autocommands
"----------------------------------------------------------------------
" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e

" Don't fold anything.
autocmd BufWinEnter * set foldlevel=999999

"----------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------
if has("nvim")

  lua require('plugins')


  lua require('Comment').setup()
  lua require('gitsigns').setup()
  lua require('plugin.treesitter')
  lua require('nvim-web-devicons').setup { default = true }
  lua require('plugin.scope')
  lua require('nvim-autopairs').setup {}
  lua require('lsp')

  packadd! dracula_pro
  colorscheme dracula_pro

  " Git
  nnoremap <leader>g :Git

  " Dispatch
  nnoremap <leader>d :Dispatch
  nnoremap <leader>m :Make
  nnoremap <leader>e :Focus

  nnoremap <leader><leader> :Telescope find_files<CR>
  nnoremap <leader>/ :Telescope live_grep<CR>
  nnoremap <leader>b :Telescope buffers<CR>
  nnoremap <leader>h :Telescope help_tags<CR>
  nnoremap <leader>gb :Telescope git_branches<CR>
  nnoremap <leader>gc :Telescope git_commits<CR>
  nnoremap <leader>x :Telescope lsp_document_symbols<CR>
  nnoremap <leader>z :Telescope lsp_dynamic_workspace_symbols<CR>
  nnoremap <leader>, :Telescope diagnostics<CR>
  nnoremap <leader>cc :Telescope commands<CR>
endif
