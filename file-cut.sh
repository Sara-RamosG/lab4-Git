#!/bin/bash

#Indico el fichero a cortar por la línea de comandos
#Pero compruebo primero si no se indica ningún fichero:
if [ -z $1 ] ; then
	echo "Se debe indicar la ruta al fichero que se desea cortar"
else
	fichero="$1"

	#Cuento el total de las líneas del fichero, divido el fichero en 23 partes, y me quedo con la primera
	lineas=$(cat "$fichero" | wc -l)
	#Por defecto el operador de división de bash (( / )) devuelve el número entero de la división
	partes=$(($lineas / 23))
	head -n "$partes" "$fichero" > "${fichero}_temporal" #Creo un fichero temporal porque si sobreescribo el mismo fichero se borran todas las líneas
	#Cambio el nombre del fichero temporal para sobreescribir el original
	mv "${fichero}_temporal" "$fichero"
fi
