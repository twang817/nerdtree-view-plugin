nerdtree-view-plugin
====================

A plugin that lets you open files in NERDTree in read-only (or view) mode.

## Installation

For Pathogen

`git clone https://github.com/twang817/nerdtree-view-plugin.git ~/.vim/bundle/nerdtree-view-plugin`

For Vundle

`Plugin 'scrooloose/nerdtree'`

`Plugin 'twang817/nerdtree-view-plugin'`

For NeoBundle

`NeoBundle 'scrooloose/nerdtree'`

`NeoBundle 'twang817/nerdtree-view-plugin'`

For Plug

`Plug 'scrooloose/nerdtree'`

`Plug 'twang817/nerdtree-view-plugin'`

## Usage

Press 'v' while on a file in the NERDTree view to open a file in read-only mode.

If the file is already open in read-write mode, this will simply jump to the file.  It will not modify its read-write
state.

## Customize

`let g:NERDTreeMapView = 'v'`
