# MinecraftServer
大学のSuwaGeeks ServerにMinecraftServerコンテナを建て、管理しています。

# 参考
- [Minecraftサーバーをクロスプレイで運用するまでにやったこと](https://qiita.com/mabubu0203/items/59a78b689740b42549c0)

# 上記を参考に私が書いた記事
- [Docker使って超簡単にJava版、BE版クロスプレイ対応Minecraft Serverを建ててみた](https://qiita.com/Kento210/items/cf9204ef695a9bf8f3b2)

# 特徴
`SPIGOT` サーバーで起動しています。

以下のプラグインにより、クロスプレイを実現しています。
- Geyser-Spigot
- floodgate-spigot

# 準備
1. Docker, Docker-composeをインストール
1. Terminalを起動
1. 初回起動  
  `$ git clone git@github.com:Kento210/MinecraftServer.git` 
  `$ cp ./docker/.env.sample ./docker/.env`  
  `$ vi ./docker/.env`  
    設定修正  
  `$ docker-compose -f ./docker/docker-compose.yml up --build --remove-orphans`  
  docker-composeのログより起動を確認  
  `$ docker-compose -f ./docker/docker-compose.yml stop`  
1. 設定修正  
  `$ vi ./docker/data/plugins/Geyser-Spigot/config.yml`    
    remote.auth-type: online -> floodgate  
  `$ vi ./docker/data/plugins/floodgate/config.yml`  
    
  `$ docker-compose -f ./docker/docker-compose.yml start`  
  docker-composeのログより起動を確認  

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

# 運用について

## ops.json

WIP

## whitelist.json

`$ /whitelist add {username}`
