#!/bin/sh

set -ex

# LGTM画像用のディレクトリを作成
mkdir -p lgtm_image

# goを実行する
go run cmd/generateLgtmImage/main.go

# ./lgtm_image に出力されたPNG形式のLGTM画像をWebPに変換
cd lgtm_image
array=`\find . -mindepth 1 -maxdepth 1 -type f`
for fpath in $array; do
    fname_ext="${fpath##*/}"
    fname="${fname_ext%.*}"
    cwebp -lossless -metadata icc -o $fname.webp $fname.png
done

# 不要になった ./lgtm_image ディレクトリのpngの画像を削除
rm *.png
cd ../

# /image の中身を /completeImage に移動
mkdir -p complete_image
cd image
mv * ./../complete_image
cd ../
