DIRECTORIO=$(pwd)
if [ -z $1 ]; then
	echo "NO se ha pasado un argumento -> tomado directorio de pwd: $DIRECTORIO"
else
	DIRECTORIOPOSIBLE=$1
	if [ -d $DIRECTORIOPOSIBLE ]; then
		echo "El argumento es un directorio válido: Tomado como directorio: $DIRECTORIOPOSIBLE"
			DIRECTORIO=$DIRECTORIOPOSIBLE
	else
		echo "El directorio relativo especificado NO es válido!"
		echo "Tomado directorio de pwd: $DIRECTORIO"
	fi
fi


FICHEROS=$DIRECTORIO/*

for fichero in $FICHEROS; do
	echo "Procesando $fichero..."
	rename 'y/a-z/A-Z/' $fichero
done