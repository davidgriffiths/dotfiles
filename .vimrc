let g:ale_completion_enabled=1  " set ale completion before any plugins are loaded

call plug#begin('~/.vim/plugged')

Plug 'adinapoli/vim-markmultiple'
Plug 'ayu-theme/ayu-vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'dag/vim-fish'
Plug 'dense-analysis/ale'
Plug 'dhruvasagar/vim-table-mode'
Plug 'elixir-lang/vim-elixir'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'janko-m/vim-test'
Plug 'jelera/vim-javascript-syntax'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'kovisoft/slimv'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ngmy/vim-rubocop'
Plug 'puremourning/vimspector'
Plug 'rizzatti/dash.vim'
Plug 'rking/ag.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-surround'
Plug 'udalov/kotlin-vim'
Plug 'vim-ruby/vim-ruby'
call plug#end()

let g:ag_working_path_mode="r"       " ag search from the root of the project
set nocompatible                     " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set clipboard=unnamed                " Use the system clipboard as the default register
set showcmd                          " display incomplete commands
filetype plugin indent on            " load file type plugins + indentation
set ttyfast                          " render more chars to the screen for smooth scroll
set lazyredraw                       " only redraw typed commands
set wildmenu                         " configure tab complete to something sensible
set wildmode=longest:full,full       " configure tab complete to something comfortable
set ls=2                             " Show the status bar
set diffopt+=iwhite                  " ignore whitespaces when diffing conflicts
set nowrap                           " don't wrap lines
set tabstop=2 shiftwidth=2           " a tab is two spaces (or set this to 4)
set expandtab                        " use spaces, not tabs (optional)
set backspace=indent,eol,start       " backspace through everything in insert mode
autocmd BufWritePre *.* :%s/\s\+$//e " trim trailing whitespace in all files, fairly aggressively
set hlsearch                         " highlight matches
set incsearch                        " incremental searching
set ignorecase                       " searches are case insensitive...
set smartcase                        " ... unless they contain at least one capital letter
set nocompatible                     " don't need to be compatible with old vim
set showmatch                        " show bracket matches
set hlsearch                         " highlight all search matches
set smartcase                        " pay attention to case when caps are used
set incsearch                        " show search results as I type
set mouse=a                          " enable mouse support
set ttimeoutlen=100                  " decrease timeout for faster insert with 'O'
set vb                               " enable visual bell (disable audio bell)
set ruler                            " show row and column in footer
set scrolloff=2                      " minimum lines above/below cursor
set wrap linebreak nolist            " configure soft wrapping
let test#strategy = "dispatch"       " use dispatch for vim-test strategy
set term=xterm                       " disable this for nvim
set number                           " enable line numbers
set numberwidth=1                    " set line number width
"set list listchars=tab:»·,trail:·   " show extra space characters
"set cursorline                      " highlight current line
"set cursorline cursorcolumn         " highlight current column
set termguicolors                    " enable true colors support
highlight LineNr ctermfg=darkgrey
set t_Co=256                         " enable 256 colors
colo seoul256                        " seoul256 colorscheme
set background=light                 " seoul256 light mode
" colorscheme ayu                    " ayu colorscheme
" let ayucolor="dark"                " ayu dark mode
" colorscheme hybrid                 " hybrid colorscheme
" set background=dark                " hybrid dark mode
" let g:hybrid_custom_term_colors=1  " enable custom colors

" Make diff colours not terrible
hi DiffAdd     ctermbg=235 ctermfg=108 cterm=reverse
hi DiffChange  ctermbg=235 ctermfg=103 cterm=reverse
hi DiffDelete  ctermbg=235 ctermfg=131 cterm=reverse
hi DiffText    ctermbg=235 ctermfg=208 cterm=reverse

" Language Server config
let g:ale_kotlin_kotlinc_enable_config=1
let g:ale_kotlin_languageserver_executable='~/Repositories/KotlinLanguageServer/server/build/install/server/bin/server'
let g:ale_kotlin_klint_executable='~/klint'
let g:ale_fix_on_save = 1

" Vim inspector mode
let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

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

" open test to current file with ,R
nmap <silent> <leader>T :TestFile<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Moves selected lines up and down with <c-{j,k}>
" '> is the last line of the visual selection
vnoremap <c-j> :m'>+1<cr>gv=gv
vnoremap <c-k> :m-2<cr>gv=gv

" Search using Ag
map <leader>a :Ag!<space>

" Run some ruby
map <leader>r :!ruby %<cr>

" Clear the command line and search highlighting
noremap <C-m> :nohlsearch<CR> :call MarkMultipleClean()<CR>

" No arrows
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Select entire buffer
nnoremap vy ggVG

" Move window with control+hjkl
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

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

" Move to end/beginning of lines with HL
noremap H ^
noremap L $

" Swap visual mode and visual line mode key bindings
noremap v <S-v>
noremap <S-v> v
"
" Remap section key to escape
imap § <esc>

" Easier splitting
nmap <C-i> :vsp<CR>
nmap <C-u> :sp<CR>
set splitbelow
set splitright

" Easier close window
nmap <C-c> <C-w>c

" qq to record, Q to replay
nnoremap Q @q

" jump to definition
map <leader>g <Plug>(ale_go_to_type_definition_in_vsplit) :ALEGoToDefinitionInVSplit<Return>

" configure fish plugin
compiler fish

"For project wide actions
command! -nargs=0 -bar Qargs execute 'args' QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

" rename current file, via Gary Bernhardt
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

" Promote variable to rspec let
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" Removes blank lines at the end of files
function! RemoveBlankLines()
  :silent! :%s#\($\n\s*\)\+\%$##
endfunction

autocmd FileWritePre    * :call RemoveBlankLines()
autocmd FileAppendPre   * :call RemoveBlankLines()
autocmd FilterWritePre  * :call RemoveBlankLines()
autocmd BufWritePre     * :call RemoveBlankLines()
