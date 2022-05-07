#!/bin/bash

system_type=$(uname -s)

MINICONDA_INSTALLER=Miniconda3-py39_4.11.0-Linux-x86_64.sh
CMAKE_VERSION=3.23.1
FISH_VERSION=3.4.1
GIT_V=2.34.0
MOSH_V=1.3.2
if [ "$system_type" != "Darwin" ]; then
  # TODO: install tar if not installed
  # TODO: install wget if not installed
  # TODO: install make if not installed
  # TODO: install gcc if not installed
  # TODO: install ncurses-devel if not installed
  # TODO: install autoconf if not installed
  # TODO: install zlib-devel if not installed
  # TODO: need libcurl for git for omf

  mkdir -p ~/.local/bin/

  
  # install cmake
  wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}.tar.gz
  tar -xzf cmake-${CMAKE_VERSION}.tar.gz
  rm cmake-${CMAKE_VERSION}.tar.gz
  cd cmake-${CMAKE_VERSION}
  ./bootstrap
  ./configure --prefix=${HOME}/.local
  make
  make install
  cd
  rm -r cmake-${CMAKE_VERSION}



  # install fish
  wget https://github.com/fish-shell/fish-shell/releases/download/${FISH_VERSION}/fish-${FISH_VERSION}.tar.xz
  tar -xf fish-${FISH_VERSION}.tar.xz
  rm fish-${FISH_VERSION}.tar.xz
  cd fish-${FISH_VERSION}
  cmake -DCMAKE_INSTALL_PREFIX=$HOME/.local .
  make
  make install
  cd
  rm -r fish-${FISH_VERSION}


  # TODO: remove git and omf
  # install new git
  wget http://mirrors.edge.kernel.org/pub/software/scm/git/git-${GIT_V}.tar.xz
  tar -xf git-${GIT_V}.tar.xz
  rm git-${GIT_V}.tar.xz
  cd git-${GIT_V}
  make configure
  ./configure --prefix=${HOME}/.local
  make NO_GETTEXT=1 # this flag is for Scientific Linux :/
  make install
  cd
  rm -r git-${GIT_V}

  # install oh-my-fish
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

  wget https://mosh.org/mosh-${MOSH_V}.tar.gz
  tar -xzf mosh-${MOSH_V}.tar.gz
  cd mosh-${MOSH_V}
  ./configure --prefix=${HOME}/.local
  make
  make install
  rm mosh-${MOSH_V}.tar.gz
  rm -r mosh-${MOSH_V}

  # install miniconda
  wget https://repo.anaconda.com/miniconda/${MINICONDA_INSTALLER}
  bash ${MINICONDA_INSTALLER} -b

  fisher install franciscolourenco/done

  fisher install jorgebucaran/hydro
  set --global hydro_symbol_prompt λ
  conda init fish

fi