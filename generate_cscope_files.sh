#!/bin/bash
#在任意目录下，存放本文件
#帮助生成cscope数据库，相关的工程目录需要自己指定
#添加工程之后，运行即可
webrtc_cscope="/Users/xiejinbao/Documents/webrtc-checkout/src"
ffmpeg_cscope="/Users/xiejinbao/Documents/GitHub/ffmpeg"
rm $webrtc_cscope"/cscope.*"
rm $ffmpeg_cscope"/cscope.*"
rm -rf webrtc
rm -rf ffmpeg

mkdir webrtc
mkdir ffmpeg

echo "generate cscope.files"
find ~/Documents/webrtc-checkout/src/webrtc ~/Documents/webrtc-checkout/src/third_party ~/Documents/webrtc-checkout/src/base -name '*.cc' -o -name '*.h' >webrtc/cscope.files
find $ffmpeg_cscope -name '*.c' -o -name '*.h' >ffmpeg/cscope.files

echo "generate cscope.out"
cd webrtc
cscope -R -b -q -k
cd ../ffmpeg
cscope -R -b -q -k
cd ..

echo "move cscope.out to webrtc dir"
#if [ ! -d "$webrtc_cscope" ];then
    #mkdir "$webrtc_cscope"
#fi
mv webrtc/cscope.*out "$webrtc_cscope"

echo "move cscope.out to ffmpeg dir"
#if [ ! -d "$ffmpeg_cscope" ];then
    #mkdir "$ffmpeg_cscope"
#fi
mv ffmpeg/cscope.*out "$ffmpeg_cscope"
echo "Done!"
