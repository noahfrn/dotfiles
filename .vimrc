let skip_defaults_vim=1
let mapleader = " "
set nocompatible

set autoindent
set autowrite
set ruler
set nonumber
set showmode
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set smarttab
if v:version >= 800
	set nofixendofline
	set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
	set foldmethod=manual
endif

set norelativenumber

set expandtab
set textwidth=72

match ErrorMsg '\s\+$'
highlight NonText guifg=bg

set nobackup
set noswapfile
set nowritebackup

set icon

set hlsearch
set incsearch
set linebreak
map <silent> <leader><cr> :noh<cr>:redraw!<cr>

set shortmess=aoOtI

set viminfo='20,<1000,s1000

let g:loaded_matchparen=1
set noshowmatch

set formatoptions-=t   " don't auto-wrap text using text width
set formatoptions+=c   " autowrap comments using textwidth with leader
set formatoptions-=r   " don't auto-insert comment leader on enter in insert
set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
set formatoptions+=q   " allow formatting of comments with gq
set formatoptions-=w   " don't use trailing whitespace for paragraphs
set formatoptions-=a   " disable auto-formatting of paragraph changes
set formatoptions-=n   " don't recognized numbered lists
set formatoptions+=j   " delete comment prefix when joining
set formatoptions-=2   " don't use the indent of second paragraph line
set formatoptions-=v   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions-=b   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions+=l   " long lines not broken in insert mode
set formatoptions+=m   " multi-byte character line break support
set formatoptions+=M   " don't add space before or after multi-byte char
set formatoptions-=B   " don't add space between two multi-byte chars in join
set formatoptions+=1   " don't break a line after a one-letter word

set hidden
set history=100
syntax enable

set ttyfast

filetype plugin on

if v:version >= 800 && executable('curl') && empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

set background=dark

if filereadable(expand("~/.vim/autoload/plug.vim"))

  call plug#begin('~/.vimplugins')

    Plug 'z0mbix/vim-shfmt'
    Plug 'vim-pandoc/vim-pandoc'
    Plug 'sheerun/vim-polyglot'
    Plug 'cespare/vim-toml'
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'pangloss/vim-javascript'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'rwxrob/vim-pandoc-syntax-simple'
    Plug 'lervag/vimtex'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'elixir-editors/vim-elixir'
    Plug 'preservim/nerdtree'

  call plug#end()

  hi Normal ctermbg=NONE guibg=NONE
  hi SignColumn ctermbg=darkgrey
  hi SpellBad ctermbg=red
  hi SpellRare ctermbg=red
  hi Special ctermfg=cyan

  au FileType pandoc hi pandocAtxHeader ctermfg=yellow cterm=bold
  au FileType pandoc hi pandocAtxHeaderMark ctermfg=yellow cterm=bold
  au FileType pandoc hi pandocAtxStart ctermfg=yellow cterm=bold

  set noruler
  set laststatus=2
  set statusline=
  set statusline+=%*\ %<%.60F%*
  set statusline+=\ [%{strlen(&ft)?&ft:'none'}]
  set statusline+=%*\ %l:%c%*
  set statusline+=%*\ %p%%%*
  set cmdheight=1

  let g:shfmt_fmt_on_save = 1
  let g:shfmt_extra_args = '-i 2'

  let g:go_fmt_fail_silently = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
	let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1
  let g:go_auto_type_info = 1
  let g:go_auto_sameids = 0

  nnoremap <silent> <leader><leader> :Files<CR>
  nnoremap <silent> <leader>F :Files ~<CR>
  nnoremap <silent> <leader>F :Files ~<CR>
  nnoremap <silent> <leader>o :Commands<CR>
  nnoremap <silent> <leader><Tab> :Buffers<CR>

  nnoremap <silent> <leader>e :NERDTreeToggle<CR>
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

  set updatetime=100

  au FileType go nmap <leader>t :GoTest!<CR>
  au FileType go nmap <leader>v :GoVet!<CR>
  au FileType go nmap <leader>b :GoBuild!<CR>
  au FileType go nmap <leader>c :GoCoverageToggle<CR>
  au FileType go nmap <leader>i :GoInfo<CR>
  au FileType go nmap <leader>l :GoMetaLinter!<CR>
  au FileType go nmap <leader>r :GoRun<CR>

  au FileType tex nmap <leader>c :VimtexCompile<CR>
  au FileType tex nmap <leader>w :VimtexCountWords<CR>
  au FileType tex nmap <leader>r :VimtexErrors<CR>

  let g:vimtex_view_method = 'zathura'

else

  autocmd vimleavepre *.go !gofmt -w %

endif

vmap < <gv
vmap > >gv

map Y y$

set wildmenu

noremap <C-L> :nohl<CR><C-L>

set omnifunc=syntaxcomplete#Complete
inoremap <C-Space> <C-x><C-o>

au bufnewfile,bufRead *.bash* set ft=sh
au bufnewfile,bufRead *.pegn set ft=config
au bufnewfile,bufRead *.profile set filetype=sh
au bufnewfile,bufRead *.crontab set filetype=crontab
au bufnewfile,bufRead *ssh/config set filetype=sshconfig
au bufnewfile,bufRead .dockerignore set filetype=gitignore
au bufnewfile,bufRead *gitconfig set filetype=gitconfig
au bufnewfile,bufRead /tmp/psql.edit.* set syntax=sql
au bufnewfile,bufRead doc.go set spell

map <F1> :set number!<CR> :set relativenumber!<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
map <F12> :set fdm=indent<CR>

nmap <leader>2 :set paste<CR>i

inoremap jj <Esc>
cnoremap jj <Esc>
inoremap kk <Esc>
cnoremap kk <Esc>
inoremap kj <Esc>
cnoremap kj <Esc>

noremap <C-n> <C-d>
noremap <C-p> <C-b>

hi StatusLineNC term=bold cterm=bold gui=bold
hi StatusLine term=bold cterm=bold gui=bold

au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
