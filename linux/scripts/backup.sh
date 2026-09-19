#!/bin/bash
set -e



BACKUP_DIR="$HOME/devops-kurs/linux/logs"
SOURCE_DIR="$HOME/devops-kurs/linux"

echo "Backup gestartet"
echo "Backup-Verzeichnis: $BACKUP_DIR"
ANZAHL=0

if [ -d "$BACKUP_DIR" ]; then
	echo "Verzeichnis existiert."

	backup_datei(){
		datei="$1"
		cp "$datei" "$BACKUP_DIR/"
		if [ $? -eq 0 ]; then
			ANZAHL=$((ANZAHL + 1))
			echo "Backup erfolgreich: $datei"
		else
			echo "Backup fehlgeschlagen: $datei"
			exit 1
		fi
	}

	for datei in "$SOURCE_DIR"/*.log; do
		if [ -f "$datei" ]; then
		
			backup_datei "$datei" 
		else
			echo "Keine passende Datei gefunden."
			exit 1
		fi
	done
	echo "ANZAHL erfolgreicher Backups: $ANZAHL"
else
	echo "Verzrichnis existiert nicht."
	exit 1
fi

	
