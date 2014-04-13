" pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" basics
syntax on
filetype plugin indent on
set nocompatible
let mapleader = ","
set laststatus=2
set backspace=indent,eol,start

" default settings for some files
autocmd BufNewFile,BufRead *.txt setfiletype text
autocmd FileType text,markdown,html,xhtml,eruby setlocal wrap linebreak nolist


" much nicer on the eyes
colorscheme solarized
set background=dark

" lightline.vim - fancy status line - requires patched font
let g:lightline = {
      \ 'colorscheme': 'solarized_dark',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '\u273b' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '\ue0a2' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() : 
        \  &ft == 'unite' ? unite#get_status_string() : 
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? "\ue0a0 "._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" paste toggle
set pastetoggle=<leader>p

" movement
map <leader>h    :wincmd h<cr>
map <leader>j    :wincmd j<cr>
map <leader>k    :wincmd k<cr>
map <leader>l    :wincmd l<cr>

" line numbers
set number
set numberwidth=5

" tab settings
set tabstop=2
set shiftwidth=2
set expandtab

" completion
imap <Tab> <C-N>

" search settings
set hlsearch
set ignorecase
set smartcase
set incsearch
map <leader>/    :set invhls<cr>

" nerd tree
map <leader>n    :NERDTreeToggle<cr>
autocmd vimenter * if !argc() | NERDTree | endif

" syntastic
let g:syntastic_always_populate_loc_list = 1

" TagBar
nmap <leader>t    :TagbarToggle<cr>

" Promptline
nmap <leader>PL    :Promptline! ~/.shell_prompt_new.sh lightline<cr>


" git commands
map <leader>gs    :Gstatus<cr>
map <leader>gc    :Gcommit<cr>
map <leader>en    :lnext<cr>
map <leader>ep    :lprev<cr>

" promptline
let g:promptline_preset = {
        \'a' : [ promptline#slices#user() ],
        \'b' : [ promptline#slices#cwd() ],
        \'x' : [ promptline#slices#python_virtualenv() ],
        \'y' : [ promptline#slices#vcs_branch() ],
        \'z' : [ promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}

