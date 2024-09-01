# MinecraftServer
大学のSuwaGeeksServerにMinecraftServerコンテナを建て、管理しています。

# ブランチについて
これはmodを極力抜いたシンプルなマイクラ鯖です

# 対応バージョン

| client | version |
|-|-|
| Java Edition (PC) | 1.20.4 |

# 参考
- [Minecraftサーバーをクロスプレイで運用するまでにやったこと](https://qiita.com/mabubu0203/items/59a78b689740b42549c0)

# 上記を参考に私が書いた記事
- [Docker使って超簡単にJava版、BE版クロスプレイ対応Minecraft Serverを建ててみた](https://qiita.com/Kento210/items/cf9204ef695a9bf8f3b2)

# 特徴
`SPIGOT` サーバーで起動しています。

以下のプラグインにより、サーバのホスティングを実現しています。
- Geyser-Spigot

# 初回起動について
上記Qiitaの記事を閲覧してください

# 起動と停止
start -> `$ docker-compose -f ./docker/docker-compose.yml start`  
stop -> `$ docker-compose -f ./docker/docker-compose.yml stop`  

# ディレクトリ構成

```bash
root
- docker
  - data
    - cache
    - logs
    - plugins
    - world
    - world_nether
    - world_the_end
  - mc-backups
- README.md
```

# プラグイン

| name                 | version           | 用途 |
|----------------------|-------------------|------|
| Geyser-Spigot.jar    | latest |      |
| WorldEdit       | 7.3.0  |  |
| CoreProtect       | 22.2  |  |

# サーバー接続に必要な情報

設定したドメイン

# 更新について

## minecraft本体(Spigot)

1. docker-compose.ymlを書き換えてブランチにpush
1. コンテナを停止
1. ブランチに切り替え
1. コンテナを起動

## プラグイン差し替え

1. docker-compose.ymlを書き換えてブランチにpush
1. コンテナを停止
1. ブランチに切り替え
1. コンテナを起動

## 変数変更

```
$ vi ./docker/.env
```

## ops追加

```
$ vi ./docker/data/ops.json
```

## バックアップ
※ 別インスタンス、開発用PCからの使用を想定しています

1. .env.sampleを参考にUSER、HOST、鍵のディレクトリ、ポート、保存するディレクトリ、保存先のディレクトを選択する
1. `$ sh backup.sh`でバックアップ実行
