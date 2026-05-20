#!/usr/bin/env bash
# Arma un PDF único con escaneos de certificados.
# Uso:
#   scripts/armar-anexo.sh <nombre-salida> <archivo1> <archivo2> ...
# Ejemplo:
#   scripts/armar-anexo.sh Anexo-Nautico-Docente \
#     certificaciones/2019-timonel-yate-vela-motor-pna.jpeg \
#     certificaciones/2019-libreta-guardias-historial.jpeg \
#     certificaciones/2023-titulo-profesor-ef-isef27.jpeg
set -euo pipefail
nombre="$1"; shift
mkdir -p exports
img2pdf --pagesize A4 --auto-orient -o "exports/${nombre}.pdf" "$@"
echo "OK -> exports/${nombre}.pdf"
