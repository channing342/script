#!/bin/bash
# Filename:    capture.sh
# Revision:    0.1
# Date:        2016/05/21
# Author:      Channing Liu

# Download Line Offical Store Sitcker 

read -p 'Line Store Link : ' url
curl $url > tmp
grep 'https://sdl-stickershop.line.naver.jp/products/' tmp | awk '{FS="("} {print $2}' | awk '{FS=")"} {print $1}' | grep -v ^$ | grep -v ^src > sticker-url
while  read  sticker; do
curl -O  $sticker > /dev/null 
done < sticker-url
rm tmp sticker-url
zip sticker.zip *.png -m > /dev/null
