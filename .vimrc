let mapleader = " "

set nocompatible              " be iMproved, required
" Vundle stuff
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim', {'pinned': 1}
Plugin 'Valloric/YouCompleteMe', {'pinned': 1}
Plugin 'vim-syntastic/syntastic', {'pinned': 1}
Plugin 'nvie/vim-flake8', {'pinned': 1}
Plugin 'jpalardy/vim-slime', {'pinned': 1}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
let g:python_recommended_style=0

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ycm settings
let g:ycm_autoclose_preview_window_after_completion=1
map <Leader>g :YcmCompleter GoToDefinition<CR>
" end ycm settings

" syntastic settings
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
nnoremap <Leader>e :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
" end syntastic settings

" vim-slime settings
let g:slime_target = "tmux"
"let g:slime_dont_ask_default = 1
"let g:slime_default_config = {"socket_name": "default"}
let g:slime_no_mappings = 1
nmap <Leader>a <Plug>SlimeLineSend
nmap <Leader>z <Plug>SlimeParagraphSend
xmap <Leader>a <Plug>SlimeRegionSend
" end vim-slime settings

set autoindent          " copy indent from current line when starting a new line
set hlsearch
hi Search ctermbg=White
hi Search ctermfg=Red
nnoremap <Leader><space> :noh<Enter>
nnoremap <Leader>w <Esc>:w<CR>
nnoremap <Leader>q <Esc>:q<CR>
nnoremap <Leader>d <Esc>oimport pdb;pdb.set_trace()<Esc>0
nnoremap <Leader>D <Esc>Oimport pdb;pdb.set_trace()<Esc>0
nnoremap <Leader>s <Esc>/import pdb;pdb\.set_trace()<Esc>0
nnoremap <Leader>S <Esc>?import pdb;pdb\.set_trace()<Esc>0
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set laststatus=2

" line numbers
nnoremap <Leader>n <Esc>:set number relativenumber<CR>
nnoremap <Leader>m <Esc>:set nonumber norelativenumber<CR>

" fix *
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" virtual tabstops using spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
"set expandtab
set noexpandtab
nnoremap <Leader>` <Esc>:set list listchars=tab:>-<CR>
nnoremap <Leader><tab> <Esc>:retab!<CR>
highlight BadWhitespace ctermbg=red guibg=darkred

fu! ResetSpaces()
    set tabstop=2
    set noexpandtab
    %retab!
endfunction

autocmd BufWritePre *.py :call ResetSpaces()

augroup pygroup
  au!
  au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/
  au BufRead,BufNewFile *.py set encoding=utf-8
augroup END

" never connect to an X-server. Otherwise vim is slow to open when X-11
" Forwarding is enabled
set clipboard=exclude:.*

" python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  with open(activate_this, 'r') as f:
    exec(f.read(), dict(__file__=activate_this))
EOF

