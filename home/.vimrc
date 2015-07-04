" Skip initialization for vim-tiny or vim-small
if !1 | finish | endif

" Install NeoBundle if it is missing
if !isdirectory(expand('~/.vim/bundle/neobundle.vim'))
	call system('git clone https://github.com/Shougo/neobundle.vim.git
		\ ~/.vim/bundle/neobundle.vim')
endif

" Run in improved mode if we aren't already
if has('vim_starting')
	if &compatible
		set nocompatible
	endif

	" Add NeoBundle to the path
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Turn on NeoBundle
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
NeoBundleLazy 'tpope/vim-sensible'
NeoBundle 'bling/vim-airline'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'wting/rust.vim'

call neobundle#end()

" Enable syntax highlighting and filetype support and indent
syntax on
filetype plugin indent on

" Install missing bundles
NeoBundleCheck

" Terminals are meant to be black
set bg=dark

" 4 space tabs
set sw=4
set ts=4

" Python files should get PEP8 white space settings
autocmd BufNewFile,BufEnter,BufRead *.py set filetype=python
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab

" Ruby files should get what appears the be the default of 2 spaces
autocmd BufNewFile,BufEnter,BufRead *.rb set filetype=ruby
autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab

" Bitbake files are just shell files
autocmd BufNewFile,BufEnter,BufRead *.bb set filetype=sh
autocmd BufNewFile,BufEnter,BufRead *.bbappend set filetype=sh

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

" Leave me for the end
set exrc " enables per-directory .vimrc files
set secure " disables unsafe commands in local .vimrc files

NeoBundleSource
