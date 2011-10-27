" Author:
"   Original: Tristan Colombo <tristan.colombo@info2dev.com>
"   Current:  Tristan Colombo <tristan.colombo@info2dev.com> (as of version 0.1)
"   Please direct all correspondence to Tristan.
" Version: 0.1
"
" Description: {{{
"   Remind all your Vim shortcuts and other Vim commands !
"   Note: you must use <F1> to open/close the reminder window
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
if exists('loaded_reminder')
  finish
endif
let loaded_reminder = 1
" }}}

" Definition of reminder state {{{
"
let reminderDisplay = 0
" }}}

" Definition of reminder file path {{{
"
let reminderFilePath = $HOME . '/.vim/plugin/reminder/reminder.txt'
" }}}

" Reminder file reader {{{
"
function! Reminder()
  if g:reminderDisplay == 0
    silent! topleft vertical 40split +buffer Reminder 
    let g:reminderDisplay = 1
    set buftype=nofile
    " TODO: Use reminderPath variable
    "0read g:reminderFilePath
    0read $HOME/.vim/plugin/reminder/reminder.txt
    set nonumber
    highlight Memory ctermfg=white ctermbg=blue
    3match Memory /^.\+\ \+:/
  else
    bdelete Reminder
    let g:reminderDisplay = 0
  endif
endfunction
" }}}

" Definition of the shortkey {{{
if !hasmapto('<Plug>Reminder')
  map <unique> <F1> <Plug>Reminder
  imap <unique> <F1> <Plug>Reminder
endif

nnoremap <unique> <script> <Plug>Reminder :call Reminder()<CR>
" }}}

" To be continued...
