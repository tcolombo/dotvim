" Activation/Désactivation de la fenêtre d'exploration des fichiers
map <F9> <Esc>:NERDTreeToggle<CR>

" Affichage/Masquage de la fenêtre TagList
map <F8> <Esc>:TlistToggle<CR>

" Activation de la complétion Django
map <F10> <Esc>:call SetAutoDjangoCompletion()<CR> 

" Ouverture d'une définition de classe/fonction avec Rope
map <F6> <Esc>:RopeGotoDefinition<CR>

" Renommage d'une classe ou variable avec Rope
map <F7> <Esc>:RopeRename<CR>

" Affichage de la liste des tâches
map <C-t> <Plug>TaskList

" Affichage de l'historique des modifications
map <C-h> <Esc>:GundoToggle<CR>

" Exécution des tests unitaires
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>

" Appel de la fonction d'activation/désactivation de la gestion de la souris
map <F4> <Esc>:call ToggleMouseActivation()<CR>

" Appel de la fonction de nettoyage d'un fichier (enlève les ^M parasites et
" les tabulations)
map  <F3> <Esc>:call CleanCode()<CR>
imap <F3> <Esc>:call CleanCode()<CR>i

" Amélioration de la recherche avant et arrière avec surlignement du pattern
map * <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '/' . expand('<cWORD>') . '/'<CR>
map ù <Esc>:exe '2match Search /' . expand('<cWORD>') . '/'<CR><Esc>:exe '?' . expand('<cWORD>') . '?'<CR>
