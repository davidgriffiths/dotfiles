call plug#begin('~/.vim/plugged')

Plug 'adinapoli/vim-markmultiple'
Plug 'christoomey/vim-tmux-runner'
Plug 'godlygeek/tabular'
Plug 'junegunn/goyo.vim'
Plug 'rking/ag.vim'
Plug 'ngmy/vim-rubocop'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'ervandew/supertab'
Plug 'kchmck/vim-coffee-script'
Plug 'elixir-lang/vim-elixir'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mustache/vim-mustache-handlebars'
Plug 'rizzatti/dash.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'kovisoft/slimv'
Plug 'janko-m/vim-test'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

call plug#end()

let g:ag_working_path_mode="r"  " ag search from the root of the project
set nocompatible                " choose no compatibility with legacy vi
set shell=/bin/zsh
syntax enable
" set re=1
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set ttyfast                     " render more chars to the screen for smooth scroll
set lazyredraw                  " only redraw typed commands
set wildmenu
set wildmode=longest:full,full
set ls=2                        " Show the status bar

"" Whitespace
set diffopt+=iwhite
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
autocmd BufWritePre *.* :%s/\s\+$//e "trim trailing whitespace in all files, fairly aggressively
"set list listchars=tab:»·,trail:· " show extra space characters

"" Searching
set hlsearch                      " highlight matches
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain at least one capital letter
set nocompatible                  " don't need to be compatible with old vim
set showmatch                     " show bracket matches
set hlsearch                      " highlight all search matches
" set cursorline                    " highlight current line
" set cursorline cursorcolumn       " highlight current column
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set mouse=a                       " enable mouse support
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set wrap
set linebreak
set nolist  " list disables linebreak
let test#strategy = "dispatch" "use dispatch for vim-test strategy

"Use the system clipboard as the default register
set clipboard=unnamed

"Colours
let g:hybrid_custom_term_colors = 1
set background=dark
colorscheme hybrid
set number
highlight LineNr ctermfg=darkgrey
set numberwidth=1
set t_Co=256

hi DiffAdd     ctermbg=235 ctermfg=108 cterm=reverse
hi DiffChange  ctermbg=235 ctermfg=103 cterm=reverse
hi DiffDelete  ctermbg=235 ctermfg=131 cterm=reverse
hi DiffText    ctermbg=235 ctermfg=208 cterm=reverse

"Key Mappings
"
" use comma as <Leader> key instead of backslash
let mapleader=","

" test runner mappings
nmap <silent> <leader>t :TestNearest<CR>
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
noremap <C-l> :nohlsearch<CR> :call MarkMultipleClean()<CR>

"No arrows
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"remap section key to escape
imap § <esc>

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

" Add # => markers
vmap <silent> <F11> !xmpfilter -m<cr>
nmap <silent> <F11> V<F11>
imap <silent> <F11> <ESC><F11>a

" Remove # => markers
vmap <silent> <F10> ms:call RemoveRubyEval()<CR>
nmap <silent> <F10> V<F10>
imap <silent> <F10> <EC><F10>a

" Execute the the markers
vmap <silent> <F9> :call xmpfilter#run('n')<CR>
nmap <silent> <F9> V<F9>
imap <silent> <F9> <ESC><F9>a

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

"Removes blank lines at the end of files
function! RemoveBlankLines()
  :silent! :%s#\($\n\s*\)\+\%$##
endfunction

autocmd FileWritePre    * :call RemoveBlankLines()
autocmd FileAppendPre   * :call RemoveBlankLines()
autocmd FilterWritePre  * :call RemoveBlankLines()
autocmd BufWritePre     * :call RemoveBlankLines()

map <Leader>c :ccl<CR>
map <leader>o :copen<CR>

"fzf key bindings
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>
