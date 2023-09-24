FROM ubuntu:22.04

WORKDIR /code

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y -q \
    build-essential \
    libssl-dev \
    libpq-dev \
    pkg-config \
    libdbus-1-dev \
    software-properties-common \
    git \
    curl 

RUN apt-get install curl gnupg -y
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install nodejs -y


RUN apt-get install libncurses-dev -y

RUN git clone https://github.com/vim/vim.git
WORKDIR vim
RUN ./configure --with-features=huge
RUN make
RUN make install

RUN apt-get install -y -q \
    gauche 


RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY src /code/
COPY .vim /root/.vim/
COPY .vimrc /root/.vimrc


RUN add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe" \
    apt-get update

RUN apt-get install -y -q \
    fonts-firacode \
    fzf \
    ncurses-term

WORKDIR /code

