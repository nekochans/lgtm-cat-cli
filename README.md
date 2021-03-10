# lgtm-cat-backend
lgtm-cat（サービス名 LGTMeow https://lgtmeow.com のバックエンド用

## 環境
- Go v1.15
- S3にファイルをアップロードするため、AWS 名前付きプロファイルが設定されていること(プロファイル名: `lgtm-cat`)
- [webp](https://formulae.brew.sh/formula/webp) ( cwebp を実行できること )

## LGTM画像の作成方法

`/image`ディレクトリに保存された画像からLGTM画像を生成します。

PNG・JPEG形式の画像からLGTM画像を生成することが可能です。

LGTM画像は`/lgtm_image`に作成されます。

LGTM画像の生成が完了すると、`/image`の中身は`/complete_image`に移動されます。

### 手順

1. LGTM画像を生成したい画像を`/image`ディレクトリに保存します。

2. `generate_lgtm_images.sh` を実行してください。LGTM画像が`/lgtm_image`ディレクトリに生成されます。

3. `/lgtm_image`ディレクトリに生成されたLGTM画像を確認してください。

## LGTM画像のS3へのアップロード方法

LGTM画像を配信するために、S3にアップロードします。

アップロードが完了すると、`/lgtm_image`ディレクトリの中身は削除されます。

### 手順

1. `LGTM画像の作成方法`の完了後に実行します。`/lgtm_image`にアップロード対象のLGTM画像が保存されていることを確認してください。

2. `upload_lgtm_images.sh`を実行してください。その際アップロード対象の環境を指定してください。(対象環境: stg | prod)

prod環境にアップロードする例
```shell
upload_lgtm_images.sh prod
```

# font
- Google Fonts を利用

https://fonts.google.com/specimen/M+PLUS+Rounded+1c?preview.text_type=custom&sidebar.open=true&selection.family=Truculenta:wght@100#pairings


