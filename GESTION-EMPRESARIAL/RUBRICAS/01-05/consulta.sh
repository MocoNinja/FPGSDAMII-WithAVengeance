#! /bin/bash

function linea {
	echo "******************************************************************************************"
	echo ""
}

DIRECTORIO=$(pwd)
echo "El directorio inicial es el que marca el comando pwd: $DIRECTORIO"
if [ -z $1 ]; then
	echo "NO se ha pasado un argumento; tomado pwd como directorio de trabajo..."
else
	DIRECTORIOPOSIBLE=$1
	if [ -d $DIRECTORIOPOSIBLE ]; then
		echo "El argumento es un directorio válido: Tomado como directorio: $DIRECTORIOPOSIBLE"
		$DIRECTORIO=$DIRECTORIOPOSIBLE
	else
		echo "El argumento que se ha pasado NO es un directorio válido; tomado pwd como directorio de trabajo..."
	fi
fi

FICHEROS=$DIRECTORIO/*
for fichero in $(find $FICHEROS);
do
linea
# asumo que un fichero de texto es .txt
	if [[ ${fichero: -4} != ".txt" ]]; then
		echo "$fichero no es un archivo de texto -> skipping"
		continue
	fi
	permiso=$(stat -c %A $fichero)
	
	if [[ $permiso == *"r"* ]]; then
		echo "Permisos de $fichero: $permiso -> Hay permisos de lectura -> continue"
		linea
		echo "*** Introduce tu opción y pulsa [ENTER] ***"
		echo -n "Leer opción -> 's', 'S', 'si', 'SI' | Pasar opción -> 'n', 'N', 'no', 'NO' | Salir -> 'q' |       "
		read name
		
		if [[ $name == 's' ]] || [[ $name == 'S' ]] || [[ $name == 'si' ]] || [[ $name == 'SI' ]]; then
			tail $fichero
		fi
		
		if [[ $name == 'q' ]]; then
			echo "BYE"
			exit 0
		fi
	else 
		echo "Permisos de $fichero: $permiso -> *NO* hay permisos de lectura -> skipping"
	fi
done


