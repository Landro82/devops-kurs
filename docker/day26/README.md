# Day 26 – Docker Multi-Container & Reverse Proxy

## Ziel

Zwei Docker-Container kommunizieren über ein eigenes Docker-Netzwerk.

- Backend: Nginx mit eigener HTML-Seite
- Frontend: Nginx als Reverse Proxy
- Kommunikation über Docker-DNS

## Docker-Netzwerk

Eigenes Netzwerk:

```bash
docker network create day26-net

Docker vergibt Container-IP-Adressen und ermöglicht die Namensauflösung zwischen Containern.

###Beispiel:
day26-frontend
       |
       | HTTP
       v
day26-backend

###Backend

Das Backend wurde mit Nginx gestartet:

docker run -d \
  --name day26-backend \
  --network day26-net \
  -p 8083:80 \
  -v "$(pwd)/backend.html":/usr/share/nginx/html/index.html:ro \
  nginx

###Test:

curl http://localhost:8083
###Container-zu-Container-Kommunikation

Das Backend war innerhalb des Docker-Netzwerks über seinen Container-Namen erreichbar:

curl http://day26-backend

Docker-DNS löst day26-backend automatisch auf die Container-IP auf.

###Reverse Proxy

Das Frontend verwendet Nginx als Reverse Proxy.

Konfiguration:

server {
    listen 80;

    location / {
        proxy_pass http://day26-backend;
    }
}

Das Frontend wurde mit dieser Konfiguration gestartet.

###Aufruf vom Host:

curl http://localhost:8084

###Die Antwort kam vom Backend.

Damit funktioniert:

Browser / Host
      |
      | HTTP :8084
      v
Frontend Nginx
      |
      | proxy_pass
      | http://day26-backend
      v
Backend Nginx
      |
      v
backend.html
###Nginx-Konfiguration testen
docker exec day26-frontend nginx -t

###Ergebnis:

syntax is ok
test is successful
###Wichtig gelernt
Docker Networks ermöglichen Kommunikation zwischen Containern.
Docker stellt interne DNS-Auflösung über Container-Namen bereit.
Container müssen nicht über ihre IP-Adresse angesprochen werden.
Nginx kann als Reverse Proxy eingesetzt werden.
Ein Frontend-Container kann Requests an einen Backend-Container weiterleiten.
