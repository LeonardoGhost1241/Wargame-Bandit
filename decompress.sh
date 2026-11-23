#!/bin/bash

set -e
set -u

if [ $# -eq 0 ]; then
    echo "Uso: $0 <archivo_binario>"
    exit 1
fi

cp "$1" work_file
current="work_file"

while true; do
    desc=$(file -b "$current")
    echo "[*] Detectado: $desc"

    case "$desc" in
        *ASCII*)
            echo "[+] ¡Texto plano encontrado! Contenido:"
            cat "$current"
            break
            ;;
        *"gzip compressed data"*)
            mv "$current" "${current}.gz"
            gzip -d "${current}.gz"
            # gzip -d restaura el nombre sin .gz
            current="${current}"
            ;;
        *"bzip2 compressed data"*)
            mv "$current" "${current}.bz2"
            bzip2 -d "${current}.bz2"
            current="${current}"
            ;;
        *"POSIX tar archive"*|*"tar archive"*)
            mv "$current" "${current}.tar"
            # Extrae y toma el primer archivo regular creado
            next_file=$(tar -xvf "${current}.tar" | tail -n 1)
            rm -f "${current}.tar"
            current="$next_file"
            ;;
        *)
            echo "[!] Formato no manejado: $desc"
            exit 1
            ;;
    esac
done

