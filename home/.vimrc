" Enable Pathogen
filetype off
execute pathogen#infect()
syntax on
filetype plugin indent on

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

" Leave me for the end
set exrc " enables per-directory .vimrc files
set secure " disables unsafe commands in local .vimrc files
