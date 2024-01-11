#!/bin/bash

# NOTE:
# --cpus-per-task parameter controls the number of
# cpus needed to run the current job.
#
# If your application runs sequentially, please set
# --cpus-per-task=4
# If you need to reserve the full node, please set
# --cpus-per-task=6

#SBATCH -p hpc-bio-ampere
#SBATCH --chdir=/home/alumno23/lab4-Git
#SBATCH -J submit_lab4_ampere-alumno23
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=4
#SBATCH --mail-type=NONE   # END/START/NONE


#Paralelo
#Ejecuto 4 veces el programa file-cut.sh en 4 procesos en background.
#En cada proceso corto un fichero distinto
for (( i=1; i<=4; i++ ))
do
	if [[ "$i" -eq 1 ]] ; then
		./file-cut.sh Sample1.fastq &
	elif [[ "$i" -eq 2 ]] ; then
		./file-cut.sh Sample2.fastq &
	elif [[ "$i" -eq 3 ]] ; then
		./file-cut.sh Sample3.fastq &
	elif [[ "$i" -eq 4 ]] ; then
		./file-cut.sh Sample4.fastq &
	fi
done
wait #Para esperar a que terminen todos los procesos en segundo plano

#Así los 4 procesos se están ejecutando al mismo tiempo, en vez de tener que esperar a que termine un proceso para poder empezar el siguiente.

echo Ha finalizado la ejecución del trabajo.
