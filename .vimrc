set autoindent          " copy indent from current line when starting a new line
set hlsearch
hi Search ctermbg=White
hi Search ctermfg=Red
nnoremap <Leader><space> :noh<Enter>
nnoremap <Leader>w <Esc>:w<CR>
nnoremap <Leader>q <Esc>:q<CR>
set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set laststatus=2

" virtual tabstops using spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
" allow toggling between local and default mode
function TabToggle()
  if &expandtab
    set shiftwidth=8
    set softtabstop=0
    set noexpandtab
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
  endif
endfunction
nmap <F9> mz:execute TabToggle()<CR>'z

syntax on
hi Special ctermfg=red " for query specific keywords
hi Underlined ctermfg=magenta cterm=bold " for local variables
set tags=tags;
