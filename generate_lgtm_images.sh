#!/bin/sh

set -ex

# goを実行する
go run cmd/generateLgtmImage/main.go

# /image の中身を /completeImage に移動
mkdir -p complete_image
cd image
mv * ./../complete_image
cd ../
