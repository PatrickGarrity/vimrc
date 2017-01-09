my vimrc
========

This repository contains my primary Vim configuration. Will hopefully undergo 
some cleanup over time. It's pretty beefy but has been enjoyable to build up.

# Installation

Make sure to back up your existing `vimrc` first!

```
$ cd ~/somedir
$ git clone https://github.com/eidolonpg/vimrc.git
$ ln -s /home/username/somedir/vimrc/vimrc /home/username/.vimrc 

# File-specific configurations...
# FT is rust, clojure, scala, haskell

$ mkdir ~/.vim/ftplugin
$ ln -s /home/$USER/somedir/vimrc/FT.vim /home/$USER/.vim/ftplugin/FT.vim
```

# TODO

Add a 'root' Vim configuration without plugins.

# Example

![screenshot](/screenshots/example.png)
