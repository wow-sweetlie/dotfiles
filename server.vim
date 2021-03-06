" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

if (has("termguicolors"))
 set termguicolors
end


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

call plug#begin('~/.vim/bundle')

Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'chriskempson/base16-vim'
Plug 'gorkunov/smartpairs.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'elixir-lang/vim-elixir'
Plug 'tpope/vim-endwise'
Plug 'slashmili/alchemist.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'ervandew/supertab'
Plug 'sheerun/vim-polyglot'
Plug 'benmills/vimux'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'fatih/vim-go'
Plug 'ElmCast/elm-vim'
Plug 'xolox/vim-misc'
Plug 'junegunn/limelight.vim'
Plug 'saltstack/salt-vim'
Plug 'Glench/Vim-Jinja2-Syntax'

call plug#end()

" Use Bash
set shell=/bin/bash

" set clipboard
set clipboard=unnamed


" ALE
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '•'

highlight! link ALEWarningSign DiffAdd
highlight! link ALEErrorSign DiffDelete

nmap <silent> <leader>, <Plug>(ale_next_wrap)
nmap <silent> <leader>; <Plug>(ale_previous_wrap)

" gometalinter is too slow
let g:ale_go_gometalinter_options = '-fast'

" go lang
autocmd FileType go nmap <leader>v  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)


" indent guide
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" xml
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" NERDTree configuration
let NERDTreeDirArrows=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 50

" Nerd tree
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent><leader>f :NERDTreeFind<cr>

" ctrlp nearest git -> current dir
let g:ctrlp_working_path_mode = 'ra'

"
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase
map <CR> :noh<CR>


" highlight cursor position
set cursorline
set cursorcolumn

" Set the title of the iterm tab
set title

colorscheme base16-chalk
let g:airline_theme = 'base16_chalk'

let g:deoplete#enable_at_startup = 1

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

augroup  golang
  au!

  au Filetype go setlocal listchars+=tab:\ \ " tricky comment for last space
 augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5



" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
