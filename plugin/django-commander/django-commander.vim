" Author:
"   Original: Tristan Colombo <tristan.colombo@info2dev.com>
"   Current:  Tristan Colombo <tristan.colombo@info2dev.com> (as of version 0.1)
"   Please direct all correspondence to Tristan.
" Version: 0.1
"
" Description: {{{
"   Plugin dedicated to Django usage : documentation and shortcuts.
" }}}
"
" Copyright: {{{
"   Copyright (C) 2011 Tristan Colombo
"
"   Permission is hereby granted to use and distribute this code,
"   with or without modifications, provided that this copyright
"   notice is copied with it. Like anything else that's free,
"   minibufexpl.vim is provided *as is* and comes with no
"   warranty of any kind, either expressed or implied. In no
"   event will the copyright holder be liable for any damamges
"   resulting from the use of this software.
"}}}

" Startup Check
"
" Has this plugin already been loaded? {{{
"
if exists('loaded_django_commander')
  finish
endif
let loaded_django_commander = 1
" }}}


" ============================================================================
" Documentation
" ============================================================================

" Definition of default browser {{{
"
let defaultBrowser = 'firefox'
" }}}


" Access to Django documentation {{{
"
function! DjangoDoc()
  exe '!' . g:defaultBrowser . ' http://www.google.fr/search?q=site:docs.djangoproject.com+<cWORD>'
  return 1
endfunction

" Definition of the shortkey
if !hasmapto('<Plug>DjangoDoc')
  map <unique> <F2> <Plug>DjangoDoc
endif

nnoremap <unique> <script> <Plug>DjangoDoc :call DjangoDoc()<CR>
" }}}

" To be continued...
" exe '!python manage.py ...'
