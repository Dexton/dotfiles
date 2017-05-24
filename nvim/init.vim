" My .vimrc

" {{{ Plug.vim (plugin management)

call plug#begin('~/.vim/plugged')

" General plugins
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'lepture/vim-jinja'
Plug 'mhinz/vim-startify'
Plug 'derekprior/vim-trimmer'

" Language specific
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'exu/pgsql.vim', { 'for': 'pgsql' }
Plug 'Glench/Vim-Jinja2-Syntax', { 'for': 'jinja2'}
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby'}
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'gregsexton/MatchTag', { 'for': ['html', 'eruby', 'jinja2'] }
Plug 'tmhedberg/matchit', { 'for': 'ruby' }
Plug 'vim-scripts/ruby-matchit', { 'for': 'ruby' }
Plug 'tpope/vim-fugitive', { 'for': 'ruby' }

" Fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unite
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'

" Coloschemes
Plug 'mkarmona/colorsbox'
Plug 'chankaward/vim-railscasts-theme'
Plug 'altercation/vim-colors-solarized'

" Fonts n' Stuffs
Plug 'ryanoasis/nerd-fonts'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" }}}

" Syntax highlighting
syntax enable
" Load filetype plugins and indentation
filetype plugin indent on

" {{{ UI Configuration

if has("gui_running")
  " Font option depends on platform
  if has("win32")
    set guifont=Andale\ Mono:h10:cDEFAULT
  else
    set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
  endif

  " set guioptions
  set guioptions=a "Autoselect
  set guioptions+=c "Console dialog instead of popup
  set guioptions+=h "Limit horizontal scrollbar to cursor line length
  set guioptions+=e "Add gui tab pages when needed
  set guioptions+=g "Gray non-active menu items
  set guioptions+=i "Use the Vim icon
  set guioptions+=r "Right hand scrollbar always present
  set guioptions+=L "Left hand scrollbar when needed
  set guioptions+=m "Menu bar is present

  " Use anti-aliasing
  set antialias
end

" Using putty I get the wrong t_Co value
if (&term == "xterm")
  set t_Co=256
elseif (&term == "screen-bce")
  set t_Co=256
endif

" colorscheme (works in both gvim and vim)
" only set if exists
silent! colorscheme solarized
silent! set background=dark
" for seoul256 only
"let g:seoul256_background = 234

" Status line
set laststatus=2

" }}}

" {{{ Keyboard Configuration

" Change ESC to ENTER
inoremap <CR> <ESC>`^
vnoremap <CR> <ESC>
" jj is now ENTER in insert mode
inoremap jj <C-J>

" reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" when moving between searches, center the selected line
nnoremap n nzz
nnoremap N Nzz

" Easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make Y behave like other Capitals (C, D, etc.)
noremap Y y$

" Map Q to repeat the last recorded macro
noremap Q @@

" Use space to toggle folds in normal mode
nnoremap <silent> , za
" Create a fold using space in visual mode
vnoremap <silent> , zf"

" Change :W to :w in command line
cnoreabbrev W w

" Jump to the end of the yanked, put'ed text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" The button which will be referred to as <Leader> from here on out
let mapleader=" "

" Clear search results
nnoremap <Leader><Leader> :nohlsearch<CR>

" Select all
noremap <Leader>a ggVG

" Do the splits
noremap <Leader>s :split<CR>
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

" Change directory to current file dir
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Clipboard yank, delete and put with leader
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y

nnoremap <Leader>d "+d
nnoremap <Leader>D "+D

nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <C-s> :Startify<CR>

" Toggle paste mode
"set pastetoggle=<Leader>p

" Disable weird Alt+Spacebar Character
inoremap <A-Space> <Space>

" run pdflatex
autocmd Filetype tex nnoremap <Leader>m :!pdflatex -shell-escape %<CR>
"
" Run markdown on file and open in browser
autocmd Filetype markdown nnoremap <Leader>m :!markdown % > %.html && sensible-browser %.html<CR><CR>

" Neovim specific
if has("nvim")

  " In terminal mode use ESC to get back to normal mode
  tnoremap <ESC> <C-\><C-n>

endif

" }}}

" {{{ Options

set nocompatible

" No backup, no swap
set nobackup
set noswapfile

" Custom invisibles
set list
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↲

" Show line numbers
set number
set relativenumber

" "Scrolling"
set scrolloff=5

" Do tabbing correctly
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" Tab settings for specific filetypes are described in TabSettings

" Sjarrappa youuu
set noerrorbells
set novisualbell
set t_vb=

" Show me what I'm doing
set showcmd

" Highlight search results
set hlsearch
set incsearch

" I don't like the mouse
set mouse=

" Set memo list plugin default dir
let g:memolist_path = "~/Memos"

" }}}

" {{{ Autocommands

" Static line numbers in insert mode
augroup TabSettings
  au!
  autocmd Filetype python setlocal tabstop=4
  autocmd Filetype python setlocal shiftwidth=4
  autocmd Filetype python setlocal softtabstop=4
  autocmd filetype apexcode setlocal tabstop=4
  autocmd filetype apexcode setlocal shiftwidth=4
  autocmd filetype apexcode setlocal softtabstop=4
  autocmd filetype apexcode setlocal noexpandtab
  autocmd filetype apexcode setlocal listchars=tab:\ \ ,trail:⋅,extends:❯,precedes:❮
augroup END

" Stupid slim template syntax not turning on the syntax in *.slim files
autocmd BufRead,BufNewFile,BufEnter *.slim set filetype=slim

" }}}

" {{{ Plugin Configuration

""" FZF
nnoremap <Leader>f :FZF<CR>

""" Startify
let g:startify_list_order = [
        \ ['   These are my sessions:'],
        \ 'sessions',
        \ ['   My most recently', '   used files'],
        \ 'files',
        \ ['   These are my bookmarks:'],
        \ 'bookmarks',
        \ ]

let g:startify_bookmarks = [ { 'n': '~/.config/nvim/init.vim'}, { 'g': '~/.gitconfig'}, { 'p': '~/projects/'}, { 'd': '~/dotfiles/'}]

""" Vim-reek
let g:reek_always_show = 1
let g:reek_line_limit = 2000

""" Airline
let g:airline_powerline_fonts = 1

""" Vim-force
let g:apex_workspace_path = "/home/viktoralex/vim-force"
let g:apex_backup_folder = "/home/viktoralex/vim-force/backup"
let g:apex_temp_folder = "/home/viktoralex/vim-force/temp"
let g:apex_properties_folder = "/home/viktoralex/vim-force/properties"
let g:apex_tooling_force_dot_com_path = "/home/viktoralex/vim-force/tooling-force/tooling-force.com.jar"
runtime ftdetect/vim-force.com.vim

let g:apex_API_version = "31.0"

""" vim-json
let g:vim_json_syntax_conceal = 0

""" Dev Icons
set encoding=utf8

" }}}
