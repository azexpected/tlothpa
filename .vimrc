set nu "줄번호 표시"
set guifont=Fixedsys:h14:cHANGEUL:qDRAFT "command mode에서 set guifont?를 입력하고 엔터를 치면 현재 사용중인 font정보가 출력됨
set relativenumber "줄번호 표시할때 커서로부터 상대적인 줄을 표시"
set ignorecase "대소문자무시"
set smartcase
set ft=cpp
if has("win32") == 0
  set term=screen-256color
  set clipboard=unnamedplus "+ register를 x window clipboard에 저장, vim 7.3.74이후부터 지원
else
  set visualbell "linux에서는 이상한 문자가 써진다 이거 틀면
  set clipboard=unnamed "* register를 windows clipboard에 저장
endif
set nocompatible              " be iMproved, required
set tabstop=4 "tab의 간격을 지정(space간격을 말하는게 아님)
set softtabstop=4 "공백문자가 지정된 쉬만큼 발견되면 tab으로 간주하고 한번에 삭제
set shiftwidth=4 "들여쓰기 간격을 지정
"set expandtab "tab을 공백문자로 바꿈
set nobackup "backup파일 생성하지 않음
set incsearch "/로 검색할때 해당 단어가 강조됨
set hlsearch "/로 검색하고 마치면 해당 단어가 강조됨
set enc=utf-8
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'valloric/youcompleteme'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-fugitive'
Plugin 'a.vim'
call vundle#end()            " required
filetype plugin indent on    " required

" map, remap, noremap 세가지 종류가 있고 
" remap은 reculsive하게 동작한다(기본)
" noremap은 non-reculsive하게 동작한다
" normal모드에서만 동작하려면 nmap, nnoremap
" visual모드에서만 동작하려면 vmap, vnoremap
" 모든 모드에서 동작하려면 map, noremap을 사용한다
map <C-n> :NERDTreeToggle<CR>
map <F3> :call CurtineIncSw()<CR>
nmap <F8> :TagbarToggle<CR>
inoremap <C-v> "*p
vnoremap <C-c> "+y
vnoremap <C-d> "+d
   
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()
let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_buffer=1
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#tab_nr_type=1
"let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

syntax enable
set background=dark
"colorscheme molokai
"colorscheme wombat
colorscheme solarized
let g:solarized_termcolors=256

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --ignore={*.sln,*.ppm,*.jpg,*.suo,*.sln,*.ktx,*.git} --ignore-dir={External,Doc,temp,Data,Debug,Release,ipch} --nocolor -g ""' 
else
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$|\Doc$|\temp$|\Debug$|\Release$|\ipch$',
  \ 'file': '\.jpg$|\.git$|\.DS_Store$|\.suo$|\.ppm$|\.ktx$\.sln$'
  \ }
endif
