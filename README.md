#.vim

Мои vim :)

##Установка

####1. Скопировать в какую нибудь папку, например vim.git:

    git clone https://github.com/RahimovIR/.vim.git ~/vim.git

####2. Перейти в папку vim.git обновить модули:

    cd ~/vim.git && git submodule init && git submodule update

####3. Создать ссылки на .vim и .vimrc:

    ln -s ~/vim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc

