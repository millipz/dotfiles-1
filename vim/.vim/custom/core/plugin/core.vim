" sdothum - 2016 (c) wtfpl

" Core
" ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂

  " Primitive ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .................................................................... Setup

      if exists("g:loaded_core")
        finish
      endif
      let g:loaded_core = 1
      let s:save_cpo = &cpo
      set cpo&vim

      let g:matchspace = ''                 " statusline indicator, see core#ToggleSpaces()
      let g:ruler      = 0                  " colorcolumn mode

      augroup core
        autocmd!
      augroup END

  " System ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ............................................................ Open terminal

      " open shell session in buffer directory
      command! Term silent call system('term "vimterm" STACK')

    " ............................................................... Print file

      command! Hardcopy silent call core#Hardcopy()<CR>:echo 'Printing..'

  " Keyboard layout ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ......................................................... Colemak-shift-dh

      " environment variable
      if $COLEMAK > ''
        call core#Colemak()
      endif

  " GUI ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .................................................... Gvim menu and toolbar

      if $DISPLAY > ''
        autocmd core VimEnter * call core#RedrawGui()
      endif

      nnoremap <silent><F12>       :call core#ToggleGui()<CR>
      inoremap <silent><F12>       <C-o>:call core#ToggleGui()<CR>
      vnoremap <silent><F12>       <C-o>:call core#ToggleGui()<CR>

    " .................................................. Column and line numbers

      nmap <silent><Bar>           :call core#ToggleColumn()<CR>
      nmap <silent><leader><Bar>   :IndentGuidesToggle<CR>
      nmap <silent>#               :call core#ToggleNumber()<CR>

    " ...................................................... White space markers

      nmap <silent><leader><Space> :call core#ToggleSpaces()<CR>

  " Buffer ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ................................................................ Line wrap

      nmap <silent><leader><CR> :call core#ToggleWrap()<CR>

  " Text ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .............................................................. Select text

      " select paragragh
      nmap <silent><A-PageUp>     :call core#ParagraphAbove()<CR>
      nmap <silent><A-PageDown>   :call core#ParagraphBelow()<CR>

    " .......................................................... Shift up / down

      " shift text up / down
      imap <silent><S-Up>         <ESC>:call core#MoveLineUp()<CR>a
      imap <silent><S-Down>       <ESC>:call core#MoveLineDown()<CR>a
      nmap <silent><S-Up>         :call core#MoveLineUp()<CR>
      nmap <silent><S-Down>       :call core#MoveLineDown()<CR>
      vmap <silent><S-Up>         <ESC>:call core#MoveVisualUp()<CR>
      vmap <silent><S-Down>       <ESC>:call core#MoveVisualDown()<CR>

    " ......................................................... Insert line wrap

      inoremap <silent><C-Return> <C-o>:call core#InsertWrap()<CR>

    " .......................................................... Code block text

      " markup wiki code blocks
      nnoremap <silent><leader>`  V:call core#CodeBlock()<CR>
      vmap     <silent><leader>`  :call core#CodeBlock()<CR>

  " Filetype ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " ............................................................... Modifiable

      " check filetype on open
      autocmd core BufNewFile,BufRead * call core#CheckFiletype()

    " ................................................................... E-mail

      " position cursor for email reply or new message, see .sup/config.yaml and bin/dcompose
      autocmd core Filetype mail call core#ComposeMail()

    " ......................................................... Vimwiki markdown

      " reformat vimwiki markdown table
      nmap <silent><leader><leader>v :silent call core#ReformatVimwikiTable()<CR>

      let &cpo = s:save_cpo
      unlet s:save_cpo

" core.vim
