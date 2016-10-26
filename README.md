#借鉴ma6174的vim配置，做了以下修改：
#https://github.com/ma6174/vim.git

1，添加YouCompletetMe插件（需要安装clang编译器）

2，添加YCM-Generator插件，生成ycm需要的conf配置文件

3，添加Indexer等三个插件，自动生成cstags需要的tags文件

4，添加fswitch插件，切换.h与.cpp文件

5，添加Nerdcommenter插件，快速注释代码

6，开启代码折叠

7，配置使用cscope

#安装
git clone https://github.com/cnxiejb/x-vim.git x-vim

cd x-vim

sh -x setup.sh

