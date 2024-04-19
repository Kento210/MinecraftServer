#!/bin/bash

# .envファイルを読み込む
source .env

# マインクラフトサーバーのデータがあるリモートディレクトリ
REMOTE_DIR="/home/kento/test_bk"

# 圧縮されたファイルの名前
ARCHIVE_NAME="minecraft_server_backup_$(date +%Y-%m-%d)"

# ローカルで圧縮ファイルを保存するディレクトリ
LOCAL_DIR="."

# バックアップを取得する
scp -r -P ${PORT} -i ${KEY_PASS} ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR} ${LOCAL_DIR}

echo "Backup completed successfully."
