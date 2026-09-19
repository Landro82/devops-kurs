#!/bin/bash
backup_starten(){
	echo "Backup für Datei: $1"
	echo "Backup wird gestartet..."
	echo "Backup abgeschlossen."
	}

	backup_starten "server.log"
	backup_starten "app.log"
