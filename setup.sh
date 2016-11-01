#!/bin/bash
#echo "安装将花费一定时间，请耐心等待直到安装完成^_^"
if which apt-get >/dev/null; then
    sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev python-dev3 git cscope
    sudo apt-get install build-essential cmake
elif which yum >/dev/null; then
    sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel python-devel3 cscope	
fi

##Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle cscope
fi

sudo easy_install -ZU autopep8 
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags
sudo ln -s /usr/bin/cscope /usr/local/bin/cscope
mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/cnxiejb/x-vim.git
mv -f ~/.vim ~/.vim_old
mv -f ~/x-vim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
mv -f ~/.vim/.indexer_files ~/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

echo "正在安装Ycm"
git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe/
git submodule update --init --recursive
if ['which clang']
then
    ./install.py --clang-completer --system-libclang
else
    ./install.py --clang-completer
fi

echo "正在努力为您安装bundle程序" > cnxiejb
echo "安装完毕将自动退出" >> cnxiejb
echo "请耐心等待" >> cnxiejb
vim cnxiejb -c "BundleInstall" -c "q" -c "q"
rm cnxiejb
echo "安装完成"
