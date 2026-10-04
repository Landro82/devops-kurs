#!/bin/bash

set -e

echo "Starte Tests..."

test -f docker/day30/compose.yaml
test -f docker/day30/nginx.conf
test -f docker/day30/backend.html

echo "Docker Compose Konfiguration prüfen..."
docker compose -f docker/day30/compose.yaml config > /dev/null

echo "Alle Tests erfolgreich!"
