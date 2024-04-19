#!/bin/bash

# .envファイルを読み込む
source .env

# ファイル名
ARCHIVE_NAME="minecraft_server_backup_$(date +%Y-%m-%d)"

# バックアップを取得する
scp -r -P ${PORT} -i ${KEY_PASS} ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR} ${LOCAL_DIR}

echo "Backup completed successfully."
