#!/bin/bash

#!/bin/bash

archivo_tmp="encontrados.tmp"

echo "=== [PERSONA 3] Procesando rutas absolutas (Paths) ==="
echo ""

if [ ! -f "$archivo_tmp" ] || [ ! -s "$archivo_tmp" ]; then
    echo "[!] No se encontraron archivos con coincidencias para procesar."
    echo "    Asegrate de ejecutar primero el mdulo de Persona 2 (./busqueda.sh)."
    exit 1
fi

echo "=========================================================="
echo " UBICACIN DE ARCHIVOS QUE CONTIENEN LA PALABRA 'HOME'"
echo "=========================================================="

while IFS= read -r archivo; do
    if [ -f "$archivo" ]; then
        ruta_absoluta=$(cd "$(dirname "$archivo")" && pwd)/$(basename "$archivo")

        echo "[XITO] Archivo: $archivo"
        echo "        Path:    $ruta_absoluta"
        echo "----------------------------------------------------------"
    fi
done < "$archivo_tmp"

rm -f "$archivo_tmp"

echo "Proceso finalizado con exito."
