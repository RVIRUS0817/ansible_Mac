colorscheme molokai

syntax enable
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

set number
set title
set autoindent
set tabstop=4
set shiftwidth=2
set expandtab
set ignorecase
set smartcase
set wrapscan
map ; :
set ttimeoutlen=10

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  let s:toml = '~/.config/nvim/dein.toml'
  call dein#load_toml(s:toml, {'lazy': 0})

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

" Golang
set path+=$GOPATH/src/**
let g:gofmt_command = 'goimports'
let g:go_fmt_options = {
	\ 'gofmt': '-s',
	\ }
au BufWritePre *.go Fmt
"  au BufWritePost *.go !gotags . -R > tags
au BufWritePost *.go silent! !gotags -R -sort -silent . > tags &
au BufReadPost *.go silent! !gotags -R -sort -silent . > tags &

au BufNewFile,BufRead *.go set sw=4 noexpandtab ts=4 completeopt=menu
au FileType go compiler go

"  https://github.com/fatih/vim-go#mappings
"  nnoremap gt  :<C-u>GoDef<CR>
let g:godef_split=1
"au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test-func)
au FileType go nmap <leader>gT <Plug>(go-coverage-toggle)

au FileType go nmap <leader>gc <Plug>(go-callees)
au FileType go nmap <leader>gC <Plug>(go-callers)

au FileType go nmap <Leader>gg <Plug>(go-def)
au FileType go nmap <Leader>gs <Plug>(go-def-stack)
au FileType go nmap <Leader>gd <Plug>(go-doc)
" au FileType go nmap <Leader>gL <Plug>(go-lint)
au FileType go nmap <Leader>gv <Plug>(go-vet)
" au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gi :<c-u>GoSameIdsAutoToggle<cr>
au FileType go nmap <Leader>gr :<c-u>GoReferrers<cr>
au FileType go nmap <Leader>gI <Plug>(go-implements)
au FileType go nmap <Leader>gR <Plug>(go-rename)
au FileType go nmap <Leader>ge :<c-u>GoErrCheck<cr>
au FileType go nmap <Leader>gw :<c-u>GoWhicherrs<cr>
au FileType go nmap <Leader>ga <Plug>(go-alternate-vertical)
au FileType go nmap <Leader>gl :<c-u>GoDecls<cr>
au FileType go nmap <Leader>gL :<c-u>GoDeclsDir<cr>
au FileType go nmap <Leader>gp :<c-u>GoPlay<cr>

let g:go_auto_type_info = 1

" https://github.com/fatih/vim-go#using-with-syntastic
"let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_go_checkers = ['golint', 'govet', 'go']
let g:syntastic_aggregate_errors = 1
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

"  au BufNewFile,BufRead *.go :TagbarOpen<cr>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" https://github.com/golang/lint
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost *.go execute 'GoLint' | cwindow
" autocmd BufWritePost *.go execute 'GoErrCheck' | cwindow
