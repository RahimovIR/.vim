#.vim

Мои vim :)

##Требования

Для корректной работы автодополнения (выподающее меню) 
необходимов установить версию vim 7.4.
Ubuntu 12.04 - 13.04 идет с версий 7.3, для обновления 
необхлдимо сделать следующее:
    sudo add-apt-repository ppa:nmi/vim-snapshots
    sudo apt-get update
    sudo apt-get upgrade

Для работы jedi-vim (автодополнение) необходимо установить
jedi:
    sudo pip install jedi

##Установка

####1. Скопировать в какую нибудь папку, например vim.git:

    git clone https://github.com/RahimovIR/.vim.git ~/vim.git

####2. Перейти в папку vim.git обновить модули:

    cd ~/vim.git && git submodule init && git submodule update

####3. Создать ссылки на .vim и .vimrc:

    ln -s ~/vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

#### Или одним списком для удобства:

    git clone https://github.com/RahimovIR/.vim.git ~/vim.git
    cd ~/vim.git && git submodule init && git submodule update
    ln -s ~/vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
