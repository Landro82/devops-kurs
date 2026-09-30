# Day 28 – Docker Compose Environment & Secrets

## Ziel

Umgebungsvariablen mit Docker Compose verwenden.

## Environment Variables

Die Datei `.env` enthält:

APP_MESSAGE=...

In `compose.yaml` wird die Variable verwendet:

${APP_MESSAGE}

Compose übergibt den Wert an den Container.

## Test

Die Variable kann im Container geprüft werden mit:

docker compose exec app printenv APP_MESSAGE

## Wichtig

Eine Änderung in `.env` aktualisiert einen bereits laufenden Container nicht automatisch.

Nach einer Änderung muss der Container mit Compose neu erstellt bzw. aktualisiert werden:

docker compose up -d

## Sicherheit

`.env` kann sensible Werte enthalten, zum Beispiel:

- Passwörter
- API Keys
- Zugangsdaten

Deshalb wird `.env` über `.gitignore` von Git ausgeschlossen.

## Wichtig gelernt

- `.env` für Konfiguration verwenden
- `${VARIABLE}` in Compose verwenden
- Environment Variables an Container übergeben
- Änderungen an `.env` erfordern ein Compose-Update
- Sensible Werte nicht in Git committen
