let mapleader = " "

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

" virtual tabstops using spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
highlight BadWhitespace ctermbg=red guibg=darkred

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

