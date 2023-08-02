#!/bin/bash

#PBS -N pmm-OpenMP_atcgrid
#PBS -q ac
echo "Id$PBS_O_WORKDIR usuario del trabajo: $PBS_O_LOGNAME"
echo "Id$PBS_O_WORKDIR del trabajo: $PBS_JOBID"
echo "Nombre del trabajo especificado por usuario: $PBS_JOBNAME"
echo "Nodo que ejecuta qsub: $PBS_O_HOST"
echo "Directorio en el que se ha ejecutado qsub: $PBS_O_WORKDIR"
echo "Cola: $PBS_QUEUE"
echo "Nodos asignados al trabajo:"
cat $PBS_NODEFILE

export OMP_SCHEDULE="static"
echo "static y chunk por defecto"
$PBS_O_WORKDIR/pmm-OpenMP 15360

echo "Secuencial"

./pmm-secuencial 100
./pmm-secuencial 300
./pmm-secuencial 500
./pmm-secuencial 700
./pmm-secuencial 900
./pmm-secuencial 1100
./pmm-secuencial 1300
./pmm-secuencial 1500

echo "Paralelo con 2 threads"
export OMP_NUM_THREADS=2

./pmm-OpenMP 100
./pmm-OpenMP 300
./pmm-OpenMP 500
./pmm-OpenMP 700
./pmm-OpenMP 900
./pmm-OpenMP 1100
./pmm-OpenMP 1300
./pmm-OpenMP 1500

echo "Paralelo con 4 threads"
export OMP_NUM_THREADS=4

./pmm-OpenMP 100
./pmm-OpenMP 300
./pmm-OpenMP 500
./pmm-OpenMP 700
./pmm-OpenMP 900
./pmm-OpenMP 1100
./pmm-OpenMP 1300
./pmm-OpenMP 1500
