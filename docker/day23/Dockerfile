FROM nginx:latest

ARG VCS_REF=unknown

LABEL org.opencontainers.image.title="DevOps Docker Day 23"
LABEL org.opencontainers.image.description="Nginx image aus dem DevOps-Kurs"
LABEL org.opencontainers.image.source="https://github.com/Landro82/devops-kurs"
LABEL org.opencontainers.image.revision="${VCS_REF}"

COPY index.html /usr/share/nginx/html/index.html
