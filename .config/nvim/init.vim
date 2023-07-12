if has('win32') || has('win64')
        let &shell='cmd.exe'
endif

set encoding=utf-8

call plug#begin()
  Plug 'junegunn/vim-easy-align'
  " Bracket completion
  Plug 'jiangmiao/auto-pairs'
  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Vim-Wiki
  Plug 'vimwiki/vimwiki'
call plug#end()

" Enable theming support
if (has("termguicolors"))
 " set termguicolors
endif

" Theme
syntax enable
set background=dark
set number
let mapleader = ","

" Tab sanity
set expandtab
set tabstop=2
set shiftwidth=2
" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·" Different tab/space stops"
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype typescript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 noexpandtab


" Fuzzy File Finder open from popup
nnoremap <c-p> :FZF<CR>
nnoremap <Leader>p :Ag<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""' 
" open new split panes to right
set splitright

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" open terminal on ctrl + n
function! OpenTerminal()
    tabnew 
    terminal
    startinsert
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" Tab navigation like Firefox.
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

" Air-line make powerline work and set theme
let g:airline_powerline_fonts = 1  
let g:airline_theme='solarized'

if !exists('g:airline_symbols')
  let g:airline_symbols = {} 
endif

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif     

" notification after file change
autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Copy/paste in Windows
set clipboard^=unnamed,unnamedplus
