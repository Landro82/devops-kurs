# Day 29 – Docker Secrets

## Ziel

Sensible Werte mit Docker Compose Secrets verwalten.

## Secret

Das Beispiel-Secret liegt lokal in:

db_password.txt

Die Datei wird über `.gitignore` von Git ausgeschlossen.

## Compose

In `compose.yaml` wird das Secret definiert:

db_password:
  file: ./db_password.txt

Der Service erhält Zugriff darauf über:

/run/secrets/db_password

## Test

Das Secret kann im Container gelesen werden mit:

docker compose exec app cat /run/secrets/db_password

## Environment Variable vs Secret

Environment Variable:

- Wert ist als Umgebungsvariable verfügbar
- kann leichter über Prozesse oder Debugging sichtbar werden

Docker Secret:

- wird als Datei bereitgestellt
- liegt im Container unter `/run/secrets/...`
- wird nicht als normale Environment Variable gesetzt

## Sicherheit

Sensible Werte wie:

- Passwörter
- API Keys
- Tokens
- Zugangsdaten

sollten nicht direkt in `compose.yaml` oder Git gespeichert werden.

## Wichtig gelernt

- Docker Compose Secrets verwenden
- Secrets als Dateien bereitstellen
- `/run/secrets/...` verwenden
- `.gitignore` für lokale Secret-Dateien
- Secrets nicht in Git committen
