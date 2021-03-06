#!/bin/bash
#Script para revisar el estado de httpd y mysqld. Para iniciar/reiniciar los servicios.

echo "##########################################################"
SERVICIOS=(mysqld)
function servicioInit() {
	if ! service $1 status &>/dev/null; then
		echo -n -e " El servicio esta parado, INICIANDO $1 "
		service $1 start
		echo '----INICIO OK----'
		service mysqld status
	else
		echo -n -e " Servicio $1 en ejecucion -> REINICIANDO"
		service $1 restart
		echo '----REINICIO OK----'
		service mysqld status
	fi
}

for ((i=0; i<${#SERVICIOS[*]}; i++)) do 
	#if $estado = "start"; then if [ -z $1 ]; then echo "ESTADO: ${SERVICIO[$i]} ->"
	servicioInit ${SERVICIOS[$i]}
done

echo "----------------------------------------------------------"

SERVICIOS=(httpd)
function servicioInit() {
	if ! service $1 status &>/dev/null; then
		echo -n -e " El servicio esta parado, INICIANDO $1 "
		service $1 start
		echo '----INICIO OK----'
		service httpd status
	else
		echo -n -e " Servicio $1 en ejecucion -> REINICIANDO"
		service $1 restart
		echo '----REINICIO OK----'
		service httpd status
	fi
}

for ((i=0; i<${#SERVICIOS[*]}; i++)) do 
	#if $estado = "start"; then if [ -z $1 ]; then echo "ESTADO: ${SERVICIO[$i]} ->"
	servicioInit ${SERVICIOS[$i]}
done

echo "----------------------------------------------------------"
