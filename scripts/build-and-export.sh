#!/usr/bin/env bash
# Собрать все образы remnawave-admin и упаковать их в один tar.gz —
# для переноса на сервер, где нет места под полную сборку (docker load).
#
# Запуск на сборочной машине (нужны docker и клон репозитория):
#   cp .env.example .env        # для сборки достаточно заглушек: compose
#                               # требует POSTGRES_USER/PASSWORD/DB даже при build
#   bash scripts/build-and-export.sh
#
# На сервере:
#   docker load < rwa-images-YYYY-MM-DD.tar.gz
#   docker compose up -d --pull never   # образы уже локально, из GHCR не тянуть
set -euo pipefail

cd "$(dirname "$0")/.."

BOT="ghcr.io/toluol2005/remnawave-admin:latest"
BACKEND="ghcr.io/toluol2005/remnawave-admin-web-backend:latest"
FRONTEND="ghcr.io/toluol2005/remnawave-admin-web-frontend:latest"
AGENT="ghcr.io/toluol2005/remnawave-admin-node-agent:latest"
OUT="rwa-images-$(date +%F).tar.gz"

echo "==> Сборка compose-сервисов (bot, web-backend, web-frontend)"
docker compose build

echo "==> Сборка node-agent (в compose его нет)"
docker build -t "$AGENT" node-agent

echo "==> Упаковка четырёх образов в $OUT — несколько сотен МБ, не прерывайте"
docker save "$BOT" "$BACKEND" "$FRONTEND" "$AGENT" | gzip > "$OUT"

echo
echo "Готово: $(pwd)/$OUT"
echo "Дальше на сервере:"
echo "  docker load < $OUT"
echo "  docker compose up -d --pull never"
