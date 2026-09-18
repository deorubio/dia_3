#!/bin/bash
# Guarda el nombre del archivo temporal donde estn los archivos encontrados
archivo_tmp="encontrados.tmp"

# mensaje indicando que inicia el programa
echo "=== [PERSONA 3] Procesando rutas absolutas (Paths) ==="
echo ""

# Revisas si el archivo temporal no existe o est vaco
if [ ! -f "$archivo_tmp" ] || [ ! -s "$archivo_tmp" ]; then
    # Mostramos un mensaje si no encontramos archivos
    echo "[!] No se encontraron archivos con coincidencias para procesar."

    # Explicamos que primero se debe ejecutar el programa de la Persona 2
    echo "    Asegrate de ejecutar primero el mdulo de Persona 2 (./busqueda.sh)."
	#Terminamos el programa si no hay archivos
    exit 1
fi
#Mostramos un titulo
echo "=========================================================="
echo " UBICACIN DE ARCHIVOS QUE CONTIENEN LA PALABRA 'HOME'"
echo "=========================================================="
#Revisamos el archivo temporal 
while IFS= read -r archivo; do
	#Revisamos que el archivo si exista
    if [ -f "$archivo" ]; then
#Obtenemos la ubicacion del archivo
        ruta_absoluta=$(cd "$(dirname "$archivo")" && pwd)/$(basename "$archivo")
	#Mostramos el nombre del archivo
        echo "[XITO] Archivo: $archivo"
	#Mostramos la ruta del archivo
        echo "        Path:    $ruta_absoluta"
        echo "----------------------------------------------------------"
    fi
#terminamos de leer el archivo temporal
done < "$archivo_tmp"
#Borramos el archivo temporal despues de usarlo
rm -f "$archivo_tmp"
#Mostramos un mensaje diciendo que termino el programa
echo "Proceso finalizado con exito."
