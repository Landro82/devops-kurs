#!/bin/bash

set -e

echo "Starte Tests..."

test -f docker/day30/compose.yaml
test -f docker/day30/nginx.conf
test -f docker/day30/backend.html

echo "Alle Tests erfolgreich!"
