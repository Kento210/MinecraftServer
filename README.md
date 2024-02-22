# MinecraftServer
大学のSuwaGeeks ServerにMinecraftServerコンテナを建て、管理しています。

# 対応バージョン

| client | version |
|-|-|
| Java Edition (PC) | 1.20.x |
| BE Edition (スマホなど) | 1.20.x |

# 参考
- [Minecraftサーバーをクロスプレイで運用するまでにやったこと](https://qiita.com/mabubu0203/items/59a78b689740b42549c0)

# 上記を参考に私が書いた記事
- [Docker使って超簡単にJava版、BE版クロスプレイ対応Minecraft Serverを建ててみた](https://qiita.com/Kento210/items/cf9204ef695a9bf8f3b2)

# 特徴
`SPIGOT` サーバーで起動しています。

以下のプラグインにより、クロスプレイを実現しています。
- Geyser-Spigot
- floodgate-spigot
- ViaVersion

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
| floodgate-spigot.jar | latest |      |
| ViaVersion.jar       | 4.9.2  | バージョン調節 |

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
