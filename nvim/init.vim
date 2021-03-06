set number
set cursorline
set clipboard=unnamedplus
set mouse=a
set autoindent
set tabstop=4
set shiftwidth=2

"python
autocmd BufNewFile,BufRead *.py nnoremap <F5> :!python %

"cpp
autocmd BufNewFile,BufRead *.cpp nnoremap <F5> :!g++ --std=c++11 %

"md
autocmd BufNewFile,BufRead *.md nnoremap <F5> :!markdown % >

""tex
autocmd BufNewFile,BufRead *.tex nnoremap <F5> :!platex %
autocmd BufNewFile,BufRead *.tex nnoremap <F6> :!dvipdfmx

" dein.vim {{{
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('~/.config') : $XDG_CONFIG_HOME
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME

let s:dein_config_dir = g:config_home . '/nvim/dein'
let s:toml_file = s:dein_config_dir .'/toml/plugins.toml'
let s:dein_cache_dir = g:cache_home . '/dein'

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

if &runtimepath !~# '/dein.vim'
    let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

    " Auto Download
    if !isdirectory(s:dein_repo_dir)
        call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
    endif

    " dein.vim をプラグインとして読み込む
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'title'
let g:dein#install_message_type = 'none'
let g:dein#enable_notification = 1

if dein#load_state(s:dein_cache_dir)
    call dein#begin(s:dein_cache_dir)

    let s:toml_dir = g:config_home . '/dein'

    call dein#load_toml(s:toml_dir . '/plugins.toml', {'lazy': 0})
    call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})
    if has('nvim')
        call dein#load_toml(s:toml_dir . '/neovim.toml', {'lazy': 1})
    endif

    call dein#end()
    call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
    call dein#install()
endif
" }}}

colorscheme apprentice
