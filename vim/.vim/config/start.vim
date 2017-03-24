" sdothum - 2016 (c) wtfpl

" Start
" ▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂▂

  " Vim ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .................................................................... Setup

      set nocompatible                      " disable vi-compatibility

      augroup start
        autocmd!
      augroup END

   " .................................................................. Keyboard

      " first, get <leader>
      source ~/.vim/config/keyboard.vim

    " ................................................................... System

      set lazyredraw                        " don't redraw while executing macros
      " set modelines=0                     " prevent modeline secrurity hole
      set modelines=1
      set mouse=a                           " enable mouse actions
      set shell=/bin/sh                     " required for plugin system call dependencies
      set title                             " change the terminal's title
      set ttyfast
      set timeout timeoutlen=1000 ttimeoutlen=100
      " set cryptmethod=blowfish            " encryption method

    " ..................................................................... Swap

      set nobackup
      set directory=~/tmp,/tmp              " keep swap files in one location
      set noswapfile                        " turn off swap files
      set nowritebackup

  " Reload settings ▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁

    " .............................................................. Config file

      " quickly edit/reload the vimrc file
      nmap <silent><leader>vim         :edit $MYVIMRC<CR>
      " must switch to .vimrc first for unknown reason.. (bug?)
      nmap <silent><leader><leader>vim :buffer .vimrc<CR>:autocmd!<CR>:source $MYVIMRC<CR>

      " load .vimrc after save
      autocmd start BufWritePost $MYVIMRC nested source $MYVIMRC
      autocmd start BufWritePost ~/.vim/config/* buffer $MYVIMRC | source $MYVIMRC
      autocmd start BufWinEnter  *.vim           set filetype=vim

" start.vim