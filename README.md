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

# Rust Setup

- [Install Rust](https://www.rust-lang.org/en-US/install.html)
- Ensure that Rust and its utilities are on your path

Add the following to your startup:

```bash
source $HOME/.cargo/env
```

- Install dependencies using Cargo

```bash
$ cargo install rustfmt
$ cargo install racer
```

- Checkout the Rust source code and set the proper environment variable

```bash
$ mkdir -p $HOME/src
$ cd $HOME/src
$ git clone https://github.com/rust-lang/rust.git
$ export RUST_SRC_PATH="$HOME/src/rust/src"
```

After setting that environment variable, you should also add it to your startup to ensure its set every time you create a new session.

- Ensure YCM is installed with racerd support

Open Vim and execute:

```
:PlugInstall! YouCompleteMe
```

The provided configuration will automatically install racerd support and the previous steps will allow that to succeed.

- (Recommended) Use the nightly release of Rust

_Do not do this before installing YCM_

```bash
$ rustup install nightly
$ rustup default nightly
```
