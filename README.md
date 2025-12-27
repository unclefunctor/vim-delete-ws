# delete-ws.vim

A simple plugin for Vim that allows you to delete the white space to the next word in a line. Works with Tim Pope's [vim-repeat](https://github.com/tpope/vim-repeat) and in visual block mode.

## Installation

### Manual Vim Install

    Copy 'delete-ws.vim' to your '~/.vim/plugin' directory.

### <a href="https://github.com/junegunn/vim-plug">junegunn/vim-plug</a>
```
    `Plug 'unclefunctor/vim-delete-ws'`
```

### <a href="https://github.com/tpope/vim-pathogen">tope/vim-pathogen</a>
```
    cd ~/.vim/bundle
    git clone https://github.com/unclefunctor/vim-delete-ws.git
```

### <a href="https://github.com/folke/lazy.nvim">folke/lazy.nvim</a>
```
    `{ 'unclefunctor/vim-delete-ws' },`
```

## Mappings

The default mapping is :

```
    noremap <silent> <expr> d<Space> mode() == "\<C-v>"
        \ ? ":<C-u>call DeleteWsBlock()<CR>"
        \ : ":<C-u>call DeleteWs()<CR>"
```
