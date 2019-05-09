function! s:initVariable(var, value)
    if !exists(a:var)
        exec 'let ' . a:var . ' = ' . "'" . substitute(a:value, "'", "''", "g") . "'"
        return 1
    endif
    return 0
endfunction

call s:initVariable("g:NERDTreeMapView", 'v')

call NERDTreeAddKeyMap({
            \ 'key': g:NERDTreeMapView,
            \ 'callback': 'NERDTreeFileOpenReadOnlyHandler',
            \ 'quickhelpText': 'open file in read-only mode',
            \ 'scope': 'FileNode' })

function! g:NERDTreePath.view()
    exec "view " . self.str({'format': 'Edit'})
endfunction

function! g:NERDTreeOpener.viewFile(target)
    if !self._stay && !and(g:NERDTreeQuitOnOpen,1) && exists("b:NERDTreeZoomed") && b:NERDTreeZoomed
        call b:NERDTree.ui.toggleZoom()
    endif

    if self._reuseWindow()
        return
    endif

    call self._gotoTargetWin()

    if self._stay
        silent call self._path.view()
        call self._restoreCursorPos()
        return
    endif

    call self._path.view()
endfunction

function! g:NERDTreeFileNode.view(...)
    let opts = a:0 ? a:1 : {}
    let opener = g:NERDTreeOpener.New(self.path, opts)
    call opener.viewFile(self)
endfunction

function! NERDTreeFileOpenReadOnlyHandler(node)
    call a:node.view({'reuse': 'all', 'where': 'p'})
endfunction
