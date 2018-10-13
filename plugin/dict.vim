"===============================================================================
"File: plugin/dict.vim
"Description: 简单的翻译插件
"Last Change: 2015-04-25
"Maintainer: iamcco <ooiss@qq.com>
"Github: http://github.com/iamcco <年糕小豆汤>
"Licence: Vim Licence
"Version: 1.0.0
"===============================================================================

if !has('python') && !has('python3')
    finish
endif

if !exists('g:debug_dict') && exists('g:loaded_dict')
    finish
endif
let g:loaded_dict= 1

let s:save_cpo = &cpo
set cpo&vim

nmap <silent> <Plug>DictWSearch  :call dict#Search(expand("<cword>"), "complex")<CR>
vmap <silent> <Plug>DictWVSearch :<C-U>call dict#VSearch("complex")<CR>

if !exists(':Dict')
    command! -nargs=1 Dict call dict#Search(<q-args>, 'simple')
endif

if !exists(':DictW')
    command! -nargs=1 DictW call dict#Search(<q-args>, 'complex')
endif

let &cpo = s:save_cpo
unlet s:save_cpo
