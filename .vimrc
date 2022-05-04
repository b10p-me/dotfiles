let mapleader = " "

set nocompatible              " be iMproved, required


"vim-plug stugg
call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows: '~/.vim/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Unmanaged plugin (manually installed and updated)
Plug '/home/ubuntu/.vim/plugged/YouCompleteMe'
Plug '/home/ubuntu/.vim/plugged/syntastic'
Plug '/home/ubuntu/.vim/plugged/vim-easy-align'
Plug '/home/ubuntu/.vim/plugged/yats.vim'
Plug '/home/ubuntu/.vim/plugged/vim-jsx-pretty'
Plug '/home/ubuntu/.vim/plugged/vim-js'

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
let g:python_recommended_style=0

" ycm settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_hover=''
" disable annoying question about adding extra conf
let g:ycm_extra_conf_globlist = ['!~/*']
map <Leader>g :YcmCompleter GoToDefinition<CR>
map <leader>f <plug>(YCMHover)
" end ycm settings

" syntastic settings
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" populate loc list to allow :lnext and :lprev to jump between errors
let g:syntastic_always_populate_loc_list = 1
nnoremap <Leader>e :SyntasticCheck<CR>
nnoremap <Leader>r :SyntasticReset<CR>
nnoremap <Leader>] :lnext<CR>
nnoremap <Leader>[ :lprevious<CR>
" end syntastic settings

" prettier for typescript
" autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

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

