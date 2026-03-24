#set terminal pngcairo
#set output "XN(T).png"

set samples 1000
set xzeroaxis

set multiplot

set origin 0,0
set size 1,1
set title "Variaciones de {/Symbol c}_{N}(M,N,T) experimentales para diferentes números de partículas comparado con los valores teóricos y x=0.5 o m=0."
set xlabel "T"
set ylabel "{/Symbol c}_{N}"
set xrange [0:5]
set yrange [-0.001:0.001]
set key
plot 'MEPPT32.dat' u 1:5 w lp t '{/Symbol c}_{N} - 32 Part.', '' u 1:6 w lp t '{/Symbol c}_{N} 32 - Dominio 1', '' u 1:7 w lp t '{/Symbol c}_{N} 32 - Dominio 2', 'MEPPT64.dat' u 1:5 w lp t '{/Symbol c}_{N} - 64 Part.', '' u 1:6 w lp t '{/Symbol c}_{N} 64 - Dominio 1', '' u 1:7 w lp t '{/Symbol c}_{N} 64 - Dominio 2', 'MEPPT128.dat' u 1:5 w lp t '{/Symbol c}_{N} - 128 Part.', '' u 1:6 w lp t '{/Symbol c}_{N} 128 - Dominio 1', '' u 1:7 w lp t '{/Symbol c}_{N} 128 - Dominio 2', -2.439e-4/x t '{/Symbol c}_{N} 32 - Dominio 1 - Teórico = -2.439e-4/T', 2.439e-4/x t '{/Symbol c}_{N} 32 - Dominio 2 - Teórico = 2.439e-4/T', -6.10202551e-5/x t '{/Symbol c}_{N} 64 - Dominio 1 - Teórico = -6.10202551e-5/T', 6.10202551e-5/x t '{/Symbol c}_{N} 64 - Dominio 2 - Teórico = 6.10202551e-5/T', -1.52578577e-5/x t '{/Symbol c}_{N} 128 - Dominio 1 - Teórico = -1.52578577e-5/T', 1.52578577e-5/x t '{/Symbol c}_{N} 128 - Dominio 2 - Teórico = 1.52578577e-5/T'

set origin 0.2, 0.1
set size 0.45, 0.4
unset title
unset xlabel
unset ylabel
unset key
set xrange [0:1]
set yrange [-0.0005:0.0005]
replot 

set origin 0.625, 0.1
set size 0.35, 0.4
unset title
unset xlabel
unset ylabel
unset key
set xrange [0.8:1]
set yrange [-0.00025:0.00025]
replot 

unset multiplot
