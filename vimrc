let $MYVIMRC = $VIM.'/vimrc'
set nocompatible
set encoding=UTF8

set backspace=indent,eol,start
set history=50
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

set clipboard=unnamed

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")
  filetype plugin indent on
  augroup vimrcEx
    au!

    autocmd FileType text setlocal textwidth=78

    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \   exe "normal! g`\"" |
          \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

if has('gui_running')
  if has('gui_gtk')
    set guifont=Ubuntu\ Mono\ 14
  elseif has('gui_win32')
    set guifont=Consolas:h12
  endif
endif

colorscheme jellybeans

let g:XkbSwitchEnabled = 1 
let g:XkbSwitchIMappings = ['ru']

"INDENT

set tabstop=2
set shiftwidth=2
set smarttab
set expandtab

"SOME APPE

set nu
set autoread 
if has('mouse')
  set mouse=a
endif
set cursorline
set guioptions-=T
set guioptions-=m
set ignorecase
"BACKUP

set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize
set backupdir=$HOME/.vim/.vimbackup
set directory=$HOME/.vim/.vimbackup
"MAP

nmap <C-Tab> :bp<CR>
nmap <F1> :NERDTreeToggle<CR>
nmap <F2> :TagbarToggle<CR>
nmap <A-1> :NERDTreeFind<CR>
nmap <C-B> :CtrlPBuffer<CR>
nmap <C-K> \ci
nmap <F9> :w<CR>:make<CR>
nmap <F10> :silent !%:t:r.exe<CR>

"VUNDLE

filetype off    

"set rtp+=$VIM/vimfiles/bundle/eclim/
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc()

"Bundle 'gmarik/vundle'
Bundle 'git://github.com/digitaltoad/vim-jade.git'
Bundle 'git://github.com/kchmck/vim-coffee-script.git'
  let coffee_make_options = '--bare'
  au BufWritePost *.coffee silent CoffeeMake!

Bundle 'git://github.com/hallettj/jslint.vim.git'

Bundle 'git://github.com/heavenshell/vim-jsdoc.git'
  let g:jsdoc_additional_descriptions = 1
  let g:jsdoc_allow_input_prompt = 1

Bundle "pangloss/vim-javascript"
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/majutsushi/tagbar.git'

"Bundle 'Raimondi/delimitMate'

Bundle 'git://github.com/kien/ctrlp.vim.git'
  let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/](\.git|_x)$'
        \ }

Bundle 'git://github.com/spf13/PIV.git'
Bundle 'git://github.com/thinca/vim-template.git'
Bundle 'tpope/vim-surround'

"snippets
"Bundle 'git://github.com/SirVer/ultisnips.git'

"Bundle 'git://github.com/msanders/snipmate.vim.git'
  "let g:snippets_dir=$VIM.'/vimfiles/snippets'

Bundle 'git://github.com/drmingdrmer/xptemplate.git'
  let g:xptemplate_key='<Tab>'
  let g:xptemplate_nav_next = '<C-j>'
  let g:xptemplate_nav_prev = '<C-k>'
  "let g:xptemplate_brace_complete = 1

"project
Bundle 'git://github.com/plasticboy/vim-markdown.git'

"syntax
Bundle 'git://github.com/scrooloose/syntastic.git'
  let g:syntastic_enable_signs=1 

"Bundle 'git://github.com/Valloric/YouCompleteMe.git'


filetype plugin indent on
filetype plugin on

autocmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
  if search('${name}')
    silent %s/\${name}/\=expand('%:t:r')/g
  endif
  if search('${fullname}')
    silent %s/\${fullname}/\=expand('%:t')/g
  endif
  if search('${user}')
    silent %s/\${user}/Denis Blokhin/g
  endif
  if search('${date}')
    silent %s/\${date}/\=strftime('%Y-%m-%d')/g
  endif
  if search('${time}')
    silent %s/\${time}/\=strftime('%H:%M:%S')/g
  endif
endfunction
au BufWritePost vimrc :so $MYVIMRC
