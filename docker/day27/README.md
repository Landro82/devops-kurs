# Day 27 – Docker Compose

## Ziel

Docker Compose für eine Multi-Container-Anwendung mit Frontend und Backend.

## Architektur

Host -> Frontend (Nginx) -> Backend (Nginx) -> backend.html

## Compose

Die Anwendung wird mit compose.yaml definiert.

Services:

- backend
- frontend

Compose erstellt automatisch das Netzwerk day27_default.

## Starten

docker compose up -d

## Status

docker compose ps

## Test

curl http://localhost:8085

Der Frontend-Nginx leitet die Anfrage an den Backend-Service weiter.

## Docker DNS

Das Frontend verwendet:

proxy_pass http://backend;

Docker Compose ermöglicht die Auflösung des Service-Namens backend.

## Stoppen

docker compose down

## Wichtig gelernt

- Docker Compose verwaltet mehrere Container als eine Anwendung.
- Compose erstellt automatisch ein gemeinsames Netzwerk.
- Services können über ihre Namen kommunizieren.
- depends_on definiert Abhängigkeiten.
- docker compose up -d startet die Anwendung.
- docker compose down entfernt Container und Netzwerk.
