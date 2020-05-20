

cd ~

set fileencodings=utf-8,cp932,euc-jp,sjis

set hidden
set number 
"set clipboard+=unnamedplus
set clipboard+=unnamed,unnamedplus

" Shift + Insertでペイスト
noremap! <S-Insert> <C-R>+

colorscheme darkblue

let g:python3_host_prog = expand('~/Anaconda3/envs/py36/python')

""-------------------------------------
"Config dein   ------------------------
""-------------------------------------

" dein.vimインストール時に指定したディレクトリをセット
"

if &compatible
  set nocompatible
endif

"なければgit clone-------------------------------------------
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir
"#----------------------------------------------


"Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  "起動時に読み込むプラグイン群
  call dein#load_toml('~/dein.toml', {'lazy': 0})
  call dein#load_toml('~/dein_lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

""plugin installation check
if dein#check_install()
  call dein#install()
endif

"" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on
syntax enable




""------------------------------------------------
"plugin  -----------------------------------------
""------------------------------------------------

"deoplete----


"dirmark---------
nnoremap <silent> <space>mf :<C-u>Denite dirmark<CR>
nnoremap <silent> <space>ma :<C-u>Denite dirmark/add<CR>

"
"------*******+++++******+++++******======******+++++******+++++*****-----
"-----------------------------------
" キーマップ
"-----------------------------------
"移動用------------------------------------------------------------
"ノーマルモード
 map - $
 map j gj
 map k gk


 nmap <C-d> 10j
 nmap <C-u> 10k

"TAB & Window
"
 nmap <C-W><C-W> :close<CR>
 nmap <C-W><C-E> :bdelete<CR>

 nmap tn :tabnew<CR>
 nmap <C-W><C-T> :tabclose<CR>

 nmap <C-tab> :tabnext<CR>
 nmap tl :tabnext<CR>
 nmap th :tabprevious<CR>

" ディレクトリ移動関係
nnoremap <silent> <space>h :cd ~ <CR>
nnoremap <silent> cd :lcd %:h <CR>



"------*******+++++******+++++******======******+++++******+++++*****-----
"-----------------------------------
" 言語ごとの設定
"-----------------------------------
autocmd FileType html set tabstop=2
autocmd FileType html set tabstop=2
autocmd FileType html set shiftwidth=2
autocmd FileType cpp set tabstop=2

autocmd FileType python set expandtab
autocmd FileType python set tabstop=2

autocmd FileType r   imap <C--> <-
autocmd FileType r set expandtab
autocmd FileType r set shiftwidth=2
autocmd FileType r set tabstop=2



"Fortran設定
let fortran_free_source=1
let fortran_fold=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1


