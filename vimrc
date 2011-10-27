" Chargement de Pathogen
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" Activation de l'indentation automatique
set autoindent
" Redéfinition des tabulations
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
" Activation de la détection automatique du type de fichier
filetype on
filetype plugin indent on

" Longueur maximale des lignes
set textwidth=79

" Activation de la coloration syntaxique
syntax on

" Lecture des raccourcis clavier généraux
execute 'source ' . $HOME . '/.vim/shortkeys.vim'

" Activation de la complétion pour les fichiers python
au FileType python set omnifunc=pythoncomplete#Complete
" Activation de la complétion pour les fichiers javascript
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" Activation de la complétion pour les fichiers html
au FileType html set omnifunc=htmlcomplete#CompleteTags
" Activation de la complétion pour les fichiers css
au FileType css set omnifunc=csscomplete#CompleteCSS

" Définition du type de complétion de SuperTab
let g:SuperTabDefaultCompletionType = "context"

" Activation de la visualisation de la documentation
set completeopt=menuone,longest,preview

" Activation de la complétion pour Django
function! SetAutoDjangoCompletion()
  let l:tmpPath   = split($PWD, '/')
  let l:djangoVar = tmpPath[len(tmpPath)-1].'.settings'
  let $DJANGO_SETTINGS_MODULE=djangoVar
  echo 'Activation de la complétion Django avec : '.djangoVar
  return 1
endfunction

" Activation de la complétion pour les librairies installées dans virtualenv
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" Activation des snippets Django pour les fichiers python et html
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

" Activation de la barre de status de fugitive
set laststatus=2
set statusline=set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [Line=%04l]\ [Col=%04v]\ [%p%%]\ %{fugitive#statusline()}

" Fonction d'affichage d'un message en inverse vidéo
function! s:DisplayStatus(msg)
  echohl Todo
  echo a:msg
  echohl None
endfunction

" Variable d'enregistrement de l'état de la gestion de la souris
let s:mouseActivation = 1
" Fonction permettant l'activation/désactivation de la gestion de la souris
function! ToggleMouseActivation()
  if (s:mouseActivation)
    let s:mouseActivation = 0
    set mouse=n
    set paste
    call s:DisplayStatus('Désactivation de la gestion de la souris (mode '.
                         'collage)')
  else
    let s:mouseActivation = 1
    set mouse=a
    set nopaste
    call s:DisplayStatus('Activation de la gestion de la souris (mode normal)')
  endif
endfunction

" Activation par défaut au démarrage de la gestion de la souris
set mouse=a
set nopaste

" Fonction de 'nettoyage' d'un fichier :
"   - remplacement des tabulations par des espaces
"   - suppression des caractères ^M en fin de ligne
function! CleanCode()
  %retab
  %s/^M//g
  call s:DisplayStatus('Code nettoyé')
endfunction

" Affichage des numéros de ligne
set number
highlight LineNr ctermbg=blue ctermfg=gray

" Surligne la colonne du dernier caractère autorisé par textwidth
set cc=+1

" Ouverture des fichiers avec le curseur à la position de la dernière édition
function! s:CursorOldPosition()
  if line("'\"") > 0 && line("'\"") <= line("$")
    exe "normal g`\""
  endif
endfunction
autocmd BufReadPost * silent! call s:CursorOldPosition()
