#!/bin/bash

echo "🚀 Instalando Docker e Docker Compose..."

# Instalar Docker
if ! command -v docker &> /dev/null
then
    curl -fsSL https://get.docker.com | bash
fi

# Instalar Docker Compose plugin
if ! command -v docker-compose &> /dev/null
then
    apt-get update && apt-get install -y docker-compose-plugin
fi

echo "📦 Subindo stack Prometheus + Grafana + Node Exporter..."
docker compose up -d

echo "✅ Acesse Grafana: http://localhost:3000 (admin/admin)"
