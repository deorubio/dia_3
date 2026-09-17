#!/bin/bash

# Módulo de Búsqueda - Persona 2
palabra=$1
archivo_salida="encontrados.tmp"

echo "=== [PERSONA 2] Buscando la palabra '$palabra' ==="
> "$archivo_salida"
encontrados=0

for i in {1..8}; do
    archivo="Doc$i.txt"
    if [ -f "$archivo" ]; then
        if grep -iq "$palabra" "$archivo"; then
            echo "$archivo" >> "$archivo_salida"
            echo "[COINCIDENCIA] La palabra '$palabra' está en $archivo"
            ((encontrados++))
        else
            echo "[SIN COINCIDENCIA] $archivo no contiene la palabra"
        fi
    else
        echo "[ERROR] No existe el archivo $archivo"
    fi
done

echo ""
echo "Búsqueda finalizada. Total detectados: $encontrados"
echo "Archivo temporal generado: $archivo_salida"
