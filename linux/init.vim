set exrc
set nocompatible
set encoding=utf-8
set number
syntax on
set cursorline
set t_Co=256
set relativenumber
set incsearch
set linebreak
set noswapfile
let mapleader = " "
set nowrap
set signcolumn=yes

filetype plugin on
filetype indent on 

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Keycode delay solution
set timeoutlen=1000
set ttimeoutlen=50

set mouse=n
set belloff=all

set showtabline=2

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

if exists('+termguicolors')  
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif


" Pluggins 
call plug#begin('~/.config/nvim/plugged')

"Plug 'nvim-telescope/telescope.nvim'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'suan/vim-instant-markdown', {'for':'markdown'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'vimwiki/vimwiki'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Setting the colorscheme and the background color
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

" Remaped the jumps bw splited windows 
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Delete a buffer without closing the split window
nnoremap <silent> <leader>d :bp\|bd #<CR>

" Jumping between buffers
nnoremap <leader>. :bn<CR>
nnoremap <leader>, :bp<CR>
" Jumping between tabs
"nnoremap <leader>. :tabn<CR>
"nnoremap <leader>, :tabp<CR>

" nerdcommenter commenting  
map <leader>/ <plug>NERDCommenterToggle

" vimwiki
map <leader>md :InstantMarkdownPreview<CR>
let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown'} "markdown support
let g:instant_markdown_autostart = 0 " disable autostart 

" Opening explorer page on the same pane
nnoremap <leader>m :Ex<CR>
" Explore page on a new pane
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Undotree
nnoremap <leader>u :UndotreeShow<CR>

" Resizing window pane 
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Install extensions when not  
let g:coc_global_extensions = [
            \ 'coc-java',
            \ 'coc-python',
            \ 'coc-json',
            \ 'coc-clangd',
            \ 'coc-sh',
            \]
"-----------------------------------------------------------------------------
" vim todo highlight
"-----------------------------------------------------------------------------

"\'gui_bg_color': '#1d2021' 
let g:todo_highlight_config = {
        \'TODO': {
            \'gui_bg_color': '#ff3300',
            \'gui_fg_color': '#ffffff'
        \},
        \'FIXME': {
            \'gui_bg_color': '#ff6600',
            \'gui_fg_color': '#ffffff'
        \},
        \'NOTE': {
            \'gui_bg_color' : '#00ffff',
            \'gui_fg_color': '#000000'
        \}
    \}

" FIXME:
" NOTE:
" TODO: dkfjdkfj
" NOTE(hell):

" -----------------------------------------------------------------------------
" Airline config
" -----------------------------------------------------------------------------

" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#righ_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'unique_tail'


" -----------------------------------------------------------------------------
" coc.nvim
" -----------------------------------------------------------------------------
source $HOME/.config/nvim/plugged/coc.nvim/plugin/coc.vim

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> <leader>gd <plug>(coc-definition)
nmap <silent> <leader>gy <plug>(coc-type-definition)
nmap <silent> <leader>gi <plug>(coc-implementation)
nmap <silent> <leader>gr <plug>(coc-references)

" Jump to errors
nmap [g <plug>(coc-diagnostic-prev)
nmap ]g <plug>(coc-diagnostic-next)

" Restart coc server
nnoremap <leader>cr :CocRestart<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Exculsive setup for C development (linux dev style)
"autocmd BufRead,BufNewFile *.h set filetype=c
"autocmd Filetype c setlocal shiftwidth=8 softtabstop=8 noexpandtab cindent cc=80
"autocmd Filetype h setlocal shiftwidth=8 softtabstop=8 noexpandtab cindent cc=80

