No puedo probar el cron porque ahora mismo no tengo una instalaci�n funcional de Linux con el postgre

Los pasos ser�an:
1) ejecutar 'crontab -e' para poder especificar mi propia tarea personalizada
2) Escribir '*/2 * * * * ~/.scripts/script.sh' Para ejecutar cada dos minutos el script adjuntado

Esto requiere dar permisos de ejecuci�n a dicho script mediante chmod +x ~/.scripts/script.sh