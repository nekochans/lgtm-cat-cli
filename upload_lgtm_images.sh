#!/bin/sh

set -ex

if [ "$1" == "" ] || ([ "$1" != "stg" ] && [ "$1" != "prod" ])
then
  echo  "対象の環境を指定してください。stg, prod のみ指定できます。"
  exit 1
fi

env="$1"
profile="lgtm-cat"
source="lgtm_image"
date=$(date "+%Y/%m/%d/%H")
target="s3://${env}-lgtmeow-images/${date}"

# 画像をS3にアップロード
aws s3 cp "./${source}/" "${target}"  --recursive --profile ${profile}

# /lgtm_image の中身を削除
cd "${source}"
rm *
cd ../
