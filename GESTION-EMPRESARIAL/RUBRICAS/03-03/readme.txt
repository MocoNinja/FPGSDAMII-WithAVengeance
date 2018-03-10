No puedo probar el cron porque ahora mismo no tengo una instalación funcional de Linux con el postgre

Los pasos serían:
1) ejecutar 'crontab -e' para poder especificar mi propia tarea personalizada
2) Escribir '*/2 * * * * ~/.scripts/script.sh' Para ejecutar cada dos minutos el script adjuntado

Esto requiere dar permisos de ejecución a dicho script mediante chmod +x ~/.scripts/script.sh