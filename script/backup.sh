#!/bin/bash

# .envファイルを読み込む
source .env

# ファイル名
ARCHIVE_NAME="minecraft_server_backup_$(date +%Y-%m-%d)"

# Dockerコンテナを停止
echo "Stopping Docker containers..."
sudo docker-compose -f /home/MinecraftServer/docker/docker-compose.yml stop

# バックアップを取得する
echo "Taking backup..."
scp -r -P ${PORT} -i ${KEY_PASS} ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR} ${LOCAL_DIR}

echo "Backup completed successfully."

# Dockerコンテナを開始
echo "Starting Docker containers..."
sudo docker-compose -f /home/MinecraftServer/docker/docker-compose.yml start

echo "Docker containers started successfully."
