packadd! dracula_pro

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
set background=dark

lua require('plugins')
lua require('Comment').setup()
lua require('gitsigns').setup()
lua require('plugin.complete')
lua require('plugin.treesitter')
lua require('plugin.null-ls')
lua require('nvim-web-devicons').setup { default = true }
lua require('plugin.scope')
lua require("plugin.dap")
lua require('nvim-autopairs').setup {}
lua require('nvim-tree').setup()
lua require('lsp')

colorscheme dracula_pro_van_helsing

"Plugin keymappings
nnoremap <leader>g :Git
nnoremap <leader>gg :Git<CR>
"nnoremap <leader>d :Dispatch
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

nnoremap <C-t> :NvimTreeFocus<CR>
nnoremap <C-x> :NvimTreeClose<CR>
nnoremap <C-q> :cclose<CR>

nnoremap <leader><leader> :Telescope find_files<CR>
nnoremap <leader>/ :Telescope live_grep<CR>
nnoremap <leader>b :Telescope buffers<CR>
nnoremap <leader>h :Telescope help_tags<CR>
nnoremap <leader>gs :Telescope git_status<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gc :Telescope git_commits<CR>
nnoremap <leader>x :Telescope lsp_document_symbols<CR>
nnoremap <leader>z :Telescope lsp_dynamic_workspace_symbols<CR>
nnoremap <leader>, :Telescope diagnostics<CR>
nnoremap <leader>lr :Telescope lsp_references<CR>
nnoremap <leader>li :Telescope lsp_implementations<CR>
nnoremap <leader>ld :Telescope lsp_definitions<CR>
nnoremap <leader>lt :Telescope lsp_type_definitions<CR>
nnoremap <leader>c :Telescope commands<CR>

nnoremap <leader>dR <cmd>lua require'dap'.run_to_cursor()<cr>
nnoremap <leader>dE <cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>
nnoremap <leader>dC <cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>
nnoremap <leader>dU <cmd>lua require'dapui'.toggle()<cr>
nnoremap <leader>db <cmd>lua require'dap'.step_back()<cr>
nnoremap <leader>dc <cmd>lua require'dap'.continue()<cr>
nnoremap <leader>dd <cmd>lua require'dap'.disconnect()<cr>
nnoremap <leader>de <cmd>lua require'dapui'.eval()<cr>
nnoremap <leader>dg <cmd>lua require'dap'.session()<cr>
nnoremap <leader>dh <cmd>lua require'dap.ui.widgets'.hover()<cr>
nnoremap <leader>dS <cmd>lua require'dap.ui.widgets'.scopes()<cr>
nnoremap <leader>di <cmd>lua require'dap'.step_into()<cr>
nnoremap <leader>do <cmd>lua require'dap'.step_over()<cr>
nnoremap <leader>dp <cmd>lua require'dap'.pause.toggle()<cr>
nnoremap <leader>dq <cmd>lua require'dap'.close()<cr>
nnoremap <leader>dr <cmd>lua require'dap'.repl.toggle()<cr>
nnoremap <leader>ds <cmd>lua require'dap'.continue()<cr>
nnoremap <leader>dt <cmd>lua require'dap'.toggle_breakpoint()<cr>
nnoremap <leader>dx <cmd>lua require'dap'.terminate()<cr>
nnoremap <leader>du <cmd>lua require'dap'.step_out()<cr>

nnoremap <S-Up> <cmd>resize -2<CR>
nnoremap <S-Down> <cmd>resize +2<CR>
nnoremap <S-Left> <cmd>vertical resize -2<CR>
nnoremap <S-right> <cmd>vertical resize +2<CR>

lua << EOF
local hop = require('hop')
hop.setup {
  case_insensitive = true,
  quit_key = "<Esc>",
  char2_fallback_key = "<CR>"
}
local directions = require('hop.hint').HintDirection
vim.keymap.set({'n', 'v', 'o'}, 'f', "", {
  silent = true, noremap = true, 
  callback = function()
    hop.hint_char2()
  end,
  desc = "nvim-hop char2"
}) 
EOF
