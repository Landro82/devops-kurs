# Day 25 – Docker Networking

## Ziele

- Docker-Netzwerke verstehen
- Bridge-Netzwerke kennenlernen
- Eigenes Docker-Netzwerk erstellen
- Container miteinander verbinden
- Container über Namen erreichen
- Docker-DNS testen

## Übungen

### 1. Docker-Netzwerke anzeigen

```bash
sudo docker network ls
Standardmäßig vorhanden:

bridge
host
none
###2. Eigenes Netzwerk erstellen
sudo docker network create devops-net

Das Netzwerk verwendet ein eigenes Bridge-Netzwerk.

###3. Container starten
sudo docker run -d --name server-test --network devops-net ubuntu:24.04 sleep infinity

sudo docker run -d --name client-test --network devops-net ubuntu:24.04 sleep infinity
###4. Docker-DNS testen
sudo docker exec client-test getent hosts server-test

Ergebnis:

172.18.0.2 server-test

Docker kann den Container über seinen Namen auflösen.

###5. Netzwerkverbindung testen

Nach Installation von iputils-ping:

sudo docker exec client-test ping -c 3 server-test

Ergebnis:

3 packets transmitted, 3 received, 0% packet loss
###6. Netzwerk untersuchen
sudo docker network inspect devops-net

Wichtige Werte:

Gateway: 172.18.0.1
server-test: 172.18.0.2
client-test: 172.18.0.3
Subnet: 172.18.0.0/16
Aufräumen
sudo docker rm -f client-test server-test
###Fazit

Docker-Container können in einem eigenen Bridge-Netzwerk miteinander kommunizieren. 
Docker stellt dabei automatisch DNS-Auflösung über die Container-Namen bereit.
