#!/bin/bash

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
