#!/bin/bash
# Módulo de Búsqueda - Persona 2
palabra=$1 #Guarda la variable de palabra que el usario escoge
archivo_salida="encontrados.tmp" #Crea otra variable la cual crea otro archivo donde se se guardan los resultados

echo "=== [PERSONA 2] Buscando la palabra '$palabra' ===" 
> "$archivo_salida" #Limpia el archivo creado
encontrados=0 #Cuenta cuantos archivos tienen la palabra buscada

for i in {1..8}; do #empieza un ciclo que se repite para buscar dentro de los 8 archivos
    archivo="Doc$i.txt" #Dependiendo del ciclo que se lleva busca en el doc que se llame asi
    if [ -f "$archivo" ]; then #Revisa que el archivo si existe
        if grep -iq "$palabra" "$archivo"; then #Busca el texto seleccionado
            echo "$archivo" >> "$archivo_salida"
            echo "[COINCIDENCIA] La palabra '$palabra' está en $archivo" #Muestra que la palabra si se encuentra
            ((encontrados++)) #Incrementa el contador de los archivos con palabras encontradas
        else
            echo "[SIN COINCIDENCIA] $archivo no contiene la palabra" #Muestra que no se ecnuentra esa palabra
        fi
    else
        echo "[ERROR] No existe el archivo $archivo" #Muestra que el archivo que se esta buscando no existe 
    fi
done

echo ""
echo "Búsqueda finalizada. Total detectados: $encontrados" #Estas ultimas 2 lineas de codigo muestran el resumen final y el conteo total
echo "Archivo temporal generado: $archivo_salida"
