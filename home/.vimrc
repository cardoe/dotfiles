" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif

" Install vim-plug if it is missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run in improved mode if we aren't already
if has('vim_starting')
	if &compatible
		set nocompatible
	endif
endif

" only use Linux style on Linux sources by default
let g:linuxsty_patterns = [ "/linux/" ]

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Turn on vim-plug
call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-sensible'
Plug 'bling/vim-airline'
" Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
" Plug 'kergoth/vim-bitbake'
" Plug 'keith/swift.vim'
Plug 'cespare/vim-toml'
" Plug 'leafgarland/typescript-vim'
" Plug 'vivien/vim-linux-coding-style'
Plug 'ledger/vim-ledger'
Plug 'junegunn/fzf'

call plug#end()

" Terminals are meant to be black
set bg=dark

" Fix up tab completion
set wildmode=longest,list,full
set wildmenu

" 4 space tabs
set sw=4
set ts=4
set expandtab

" Python files should get PEP8 white space settings
autocmd BufNewFile,BufEnter,BufRead *.py set filetype=python
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

" Ruby files should get what appears the be the default of 2 spaces
autocmd BufNewFile,BufEnter,BufRead *.rb set filetype=ruby
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab

" Cucumber (behave) files should use spaces
autocmd FileType cucumber set tabstop=4|set shiftwidth=4|set expandtab

" Kconfig files should use tabs
autocmd FileType kconfig set noexpandtab

" bitbake recipes should use spaces
autocmd FileType bitbake set expandtab

" Markdown not Modula-2..
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Rust
autocmd FileType rust setlocal makeprg=cargo|setlocal errorformat=%f:%l:%c:%m

" JavaScript Standard Style
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType json set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab

" YAML
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab

" Riot Tags are HTML
autocmd BufNewFile,BufEnter,BufRead *.tag set filetype=html

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave,BufWinEnter * match ExtraWhitespace /\s\+$/

" Spelling support
if has("spell")
	let mapleader = ","
	" Toggle spell checking on and off with `,s`
	nmap <silent> <leader>s :set spell!<CR>
	" Murica
	set spelllang=en_us
endif

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if ! exists("g:leave_my_cursor_position_alone") |
    \     if line("'\"") > 0 && line ("'\"") <= line("$") |
    \         exe "normal g'\"" |
    \     endif |
    \ endif

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

let mapleader = ","
nnoremap <leader>b :b <C-d>
nnoremap <leader>g :grep<space>
nnoremap <leader>m :make<space>
nnoremap <leader>q :b#<CR>

" Leave me for the end
set exrc " enables per-directory .vimrc files
set secure " disables unsafe commands in local .vimrc files
