call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Theme
Plug 'chriskempson/base16-vim'
Plug 'Blevs/vim-dzo'
Plug 'ryanoasis/vim-devicons'


" ZFZ
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Javascript
Plug 'othree/yajs.vim'

" Code Completition
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'

" Neomake
Plug 'neomake/neomake'

"EditorConfig
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Theme
let base16colorspace=256
colorscheme base16-default-dark
let g:airline_theme='base16'

" Config
set autoindent

set encoding=utf8
set number
set expandtab
set mouse=a
set tabstop=4
set shiftwidth=4
set noswapfile
set guifont=RobotoMono\ Nerd\ Font\ Regular:h12

let mapleader = ","

" ZFZ
" This is the default extra key bindings
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map <leader>p :Files <CR>
map <C-p> :Files <CR>

" Dev Icons
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

" Airline Config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
set laststatus=2
set ttimeoutlen=50

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>" 
set completeopt-=preview 

" bind K to grep word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Vim-JSX
"let g:jsx_ext_required = 0
"


" Neomake and eslint
autocmd! BufWritePost * Neomake
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint']

nmap <Leader><Space>o :lopen<CR>      " open location window
nmap <Leader><Space>c :lclose<CR>     " close location window
nmap <Leader><Space>, :ll<CR>         " go to current error/warning
nmap <Leader><Space>n :lnext<CR>      " next error/warning
nmap <Leader><Space>p :lprev<CR>      " previous error/warning

" Buffers mode

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>


nmap <leader>q :bd<CR>

nmap <leader>w :w<CR>
nmap <leader>wq :w <BAR> :bp <BAR> bd #<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Remove trailling spaces
autocmd FileType c,cpp,java,php,javascript,html,css,less autocmd BufWritePre <buffer> %s/\s\+$//e
