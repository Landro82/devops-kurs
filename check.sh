#!/bin/bash
set -e

echo "Prüfe Docker-Compose-Konfiguration..."
APP_ENV=testing docker compose -f tag50/compose.yaml config --quiet

echo "Prüfe HTML-Datei..."
test -f tag50/html/index.html

echo "Prüfe HTML-Titel..."
grep -q '<title>Mein DevOps-Projekt</title>' tag50/html/index.html

echo "Alle Prüfungen erfolgreich!"
