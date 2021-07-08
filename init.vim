call plug#begin(stdpath('data') . '/site/plugins')
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'arthurxavierx/vim-caser'
Plug 'danilo-augusto/vim-afterglow'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-carbon-now-sh'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/jsonc.vim'
Plug 'posva/vim-vue'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'voldikss/vim-floaterm'
call plug#end()

colorscheme afterglow

set background=dark
set backspace=indent,eol,start
set backupdir=$TMPDIR
set clipboard=unnamed
set expandtab
set nofoldenable
set foldmethod=indent
set hidden
set incsearch
set number
set scrolljump=7
set scrolloff=7
set shiftwidth=2
set noshowmode
set signcolumn=yes
set smartcase
set smartindent
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set updatetime=128

inoremap jk <ESC>
inoremap <ESC> <NOP>
nnoremap <expr> H col('.') == 1 ? '^' : '0'
nnoremap <expr> L col('.') == col('$') - 1 ? 'g_' : '$'
nnoremap <silent> <C-G> :<C-U>let @+=expand('%')<CR><C-G>
nnoremap <silent> <C-L> :<C-U>noh<CR><C-L>
nnoremap <silent> <leader>ev :vsplit ${MYVIMRC}<CR>
nnoremap <silent> <leader>sv :source ${MYVIMRC}<CR>
onoremap <expr> H col('.') == 1 ? '^' : '0'
onoremap L $
vnoremap <expr> H col('.') == 1 ? '^' : '0'
vnoremap L $

" Airline
let g:airline_powerline_fonts = v:true
let g:airline_theme = 'afterglow'

" Carbon
vnoremap <silent> <leader>cs :CarbonNowSh<CR>

" Coc
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-G>u\<CR>\<C-R>=coc#on_enter()\<CR>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>ShowDocumentation()<CR>
function! s:ShowDocumentation() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Defx
noremap <silent> <C-BSLASH> :Defx -columns=mark:indent:icon:filename -direction=topleft
  \ -search=`expand('%:p')` -show-ignored-files -split=vertical -toggle -winwidth=40<CR>
autocmd! FileType defx call s:DefxSettings()
function! s:DefxSettings() abort
  setlocal cursorline

  nnoremap <silent><buffer><expr> h
  \ defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> l
  \ defx#is_directory() ?
  \ defx#do_action('open_tree', 'toggle') :
  \ defx#do_action('drop')
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> n
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path', ':.')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Tab>
  \ defx#do_action('toggle_select')
  nnoremap <silent><buffer> = :vertical resize 40<CR>
  nnoremap <silent><buffer> > :vertical resize +10<CR>
  nnoremap <silent><buffer> < :vertical resize -10<CR>
endfunction

" Floaterm
let g:floaterm_autoclose = 2
let g:floaterm_height = 0.9
let g:floaterm_width = 0.9
let g:floaterm_opener = 'tabe'
nnoremap <silent> <leader>t :FloatermToggle<CR>
autocmd! FileType floaterm call s:FloatermSettings()
function! s:FloatermSettings() abort
  tnoremap <silent><buffer> <C-T> <C-\><C-N>:FloatermNew<CR>
  tnoremap <silent><buffer> <C-J> <C-\><C-N>:FloatermNext<CR>
  tnoremap <silent><buffer> <C-K> <C-\><C-N>:FloatermPrev<CR>
  tnoremap <silent><buffer> <ESC> <C-\><C-N>:FloatermToggle<CR>
endfunction

" Fzf
let g:fzf_action = { 'ctrl-t': 'tab split', 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
noremap <silent> <leader>b :Buffers<CR>
noremap <silent> <leader>c :GFiles?<CR>
noremap <silent> <leader>f :GFiles<CR>
noremap <silent> <leader>r :Rg<CR>
