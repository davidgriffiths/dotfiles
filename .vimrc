" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/./plugged')

Plug 'dag/vim-fish'
Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'junegunn/rainbow_parentheses.vim' "sweet sweet colours
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align' " align with: gaip
Plug 'justinmk/vim-dirvish'    " performant directory viewer
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'      " git wrapper
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'        " dot (.) command that plugins can access
Plug 'janko-m/vim-test'        " run tests
Plug 'tpope/vim-surround'      " surround with ys, remove with ds, change with cs
Plug 'jremmen/vim-ripgrep'

call plug#end()

colo seoul256                        " seoul256 colorscheme
filetype plugin indent on            " load file type plugins + indentation
highlight LineNr ctermfg=darkgrey
syntax enable

let g:seoul256_background=233
let test#strategy = "dispatch"       " use dispatch for vim-test strategy

set background=dark                  " seoul256 dark mode
set backspace=indent,eol,start       " backspace through everything in insert mode
set clipboard=unnamed                " Use the system clipboard as the default register
" set cursorline                     " highlight current line
" set cursorline cursorcolumn        " highlight current column
set diffopt+=iwhite                  " ignore whitespaces when diffing conflicts
set encoding=utf-8
set expandtab                        " use spaces, not tabs
set hlsearch                         " highlight all search matches
set hlsearch                         " highlight matches
set ignorecase                       " searches are case insensitive...
set incsearch                        " incremental searching
set incsearch                        " show search results as I type
set lazyredraw                       " only redraw typed commands
" set list listchars=tab:»·,trail:·  " show extra space characters
set ls=2                             " Show the status bar
set mouse=a                          " enable mouse support
set nocompatible                     " choose no compatibility with legacy vi
set nocompatible                     " don't need to be compatible with old vim
set nowrap                           " don't wrap lines
set number                           " enable line numbers
set numberwidth=1                    " set line number width
set relativenumber                   " enable relative line numbers
set ruler                            " show row and column in footer
set scrolloff=2                      " minimum lines above/below cursor
set showcmd                          " display incomplete commands
set showmatch                        " show bracket matches
set smartcase                        " ... unless they contain at least one capital letter
set smartcase                        " pay attention to case when caps are used
set t_Co=256                         " enable 256 colors
set tabstop=2 shiftwidth=2           " a tab is two spaces
set termguicolors                    " enable true colors support
set ttimeoutlen=100                  " decrease timeout for faster insert with 'O'
set ttyfast                          " render more chars to the screen for smooth scroll
set vb                               " enable visual bell (disable audio bell)
set wildmenu                         " configure tab complete to something sensible
set wildmode=longest:full,full       " configure tab complete to something comfortable
set wrap linebreak nolist            " configure soft wrapping

if !has('nvim')
  set term=xterm
endif

" Make diff colours not terrible
hi DiffAdd     ctermbg=235 ctermfg=108 cterm=reverse
hi DiffChange  ctermbg=235 ctermfg=103 cterm=reverse
hi DiffDelete  ctermbg=235 ctermfg=131 cterm=reverse
hi DiffText    ctermbg=235 ctermfg=208 cterm=reverse

" fzf appearance
let g:fzf_layout = { 'down': '40%' }

" use comma as <Leader> key instead of backslash
let mapleader=","

" close quickfix window ,c
map <Leader>c :ccl<CR>

" open quickfix window with ,o
map <leader>o :copen<CR>

" open fzf buffer search with ;
nmap ; :Buffers<CR>

" open fzf file search with ,f
nmap <Leader>f :Files<CR>

" open fzf tag search with ,r
nmap <Leader>r :Tags<CR>

" open nearest test to current file with ,t
nmap <silent> <leader>t :TestNearest<CR>

" open test to current file with ,T
nmap <silent> <leader>T :TestFile<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Moves selected lines up and down with <c-{j,k}>
" '> is the last line of the visual selection
vnoremap <Down> :m'>+1<cr>gv=gv
vnoremap <Up> :m-2<cr>gv=gv

"search using ripgrep with hidden files
map <leader>a :Rg -. -i<space>

" Run some ruby
map <leader>r :!ruby %<cr>

" Clear the command line and search highlighting
noremap <C-m> :nohlsearch<CR> :call MarkMultipleClean()<CR>

" GB spellcheck with f5
map <F5> :setlocal spell! spelllang=en_gb<CR>

" Select entire buffer
nnoremap vy ggVG

" Arrows map to <c-{h,j,k,l}> for moving window
nmap <Left> <C-w>h
nmap <Right> <C-w>l
nmap <Down> <C-w>j
nmap <Up> <C-w>k

" No arrows
" map <Left> <Nop>
" map <Right> <Nop>
" map <Up> <Nop>
" map <Down> <Nop>

" Navigate splits with control-j/k/h/l (without tmux prefix)
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" Movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-l> <C-o>l
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k

" Escape using jk variants
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>
xmap jk <Esc>

" Move to end/beginning of lines with HL
noremap H ^
noremap L $

" Quick write
nmap <Leader>w :w<CR>

" Quick source
nmap <Leader>s :source %<CR>

" Remap section key to escape
imap § <esc>

" Easier splitting
nmap <C-i> :vsp<CR>
nmap <C-u> :sp<CR>
set splitbelow
set splitright

" Easier close window
nmap <C-x> <C-w>c

" qq to record, Q to replay
nnoremap Q @q

" configure fish plugin
compiler fish

" rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

" Remove blank lines at the end of files
function! RemoveBlankLines()
  :silent! :%s#\($\n\s*\)\+\%$##
endfunction

" set kotlin indentation to 4
autocmd FileType kotlin setlocal expandtab shiftwidth=4 tabstop=4

" trim trailing whitespace in all files, fairly aggressively
autocmd BufWritePre *.* :%s/\s\+$//e
autocmd FileWritePre    * :call RemoveBlankLines()
autocmd FileAppendPre   * :call RemoveBlankLines()
autocmd FilterWritePre  * :call RemoveBlankLines()
autocmd BufWritePre     * :call RemoveBlankLines()

" activate rainbow parentheses based on filetype
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END
