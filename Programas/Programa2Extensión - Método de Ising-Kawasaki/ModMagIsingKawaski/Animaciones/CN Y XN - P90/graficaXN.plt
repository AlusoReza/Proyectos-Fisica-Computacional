#set terminal pngcairo
#set output "XN(T).png"

set samples 1000
set xzeroaxis

set multiplot

set origin 0,0
set size 1,1
set title "Variaciones de {/Symbol c}_{N}(M,N,T) experimentales para diferentes números de partículas comparado con los valores teóricos, para x=0.9 o m=0.8."
set xlabel "T"
set ylabel "{/Symbol c}_{N}"
set xrange [0:5]
set yrange [0:0.001]
set key
plot 'MEPPT32.dat' u 1:5 w lp t '{/Symbol c}_{N} - 32 Part.', '' u 1:(-$6) w lp t '{/Symbol c}_{N} 32 - Dominio 1', '' u 1:7 w lp t '{/Symbol c}_{N} 32 - Dominio 2', 'MEPPT64.dat' u 1:5 w lp t '{/Symbol c}_{N} - 64 Part.', '' u 1:(-$6) w lp t '{/Symbol c}_{N} 64 - Dominio 1', '' u 1:7 w lp t '{/Symbol c}_{N} 64 - Dominio 2', 'MEPPT128.dat' u 1:5 w lp t '{/Symbol c}_{N} - 128 Part.', '' u 1:(-$6) w lp t '{/Symbol c}_{N} 128 - Dominio 1', '' u 1:7 w lp t '{/Symbol c}_{N} 128 - Dominio 2', 6.24389648e-4/x t '{/Symbol c}_{N} 32 - Teórico = 6.24389648e-4/x', 7.90243149e-4/x t '{/Symbol c}_{N} 32 - Dominio 1 - Teórico = 7.90243149e-4/x', 9.75698826e-6/x t '{/Symbol c}_{N} 32 - Dominio 2 - Teórico = 9.75698826e-6/x', 1.56211853e-4/x t '{/Symbol c}_{N} 64 - Teórico = 1.56211853e-4/T', 1.97705626e-4/x t '{/Symbol c}_{N} 64 - Dominio 1 - Teórico = 1.97705626e-4/T', 2.4408102e-6/x t '{/Symbol c}_{N} 64 - Dominio 2 - Teórico = 2.4408102e-6/T', 3.90601158e-5/x t '{/Symbol c}_{N} 128 - Teórico = 3.90601158e-5/T', 4.94354591e-5/x t '{/Symbol c}_{N} 128 - Dominio 1 - Teórico = 4.94354591e-5/T', 6.1031431e-7/x t '{/Symbol c}_{N} 128 - Dominio 2 - Teórico = 6.1031431e-7/T'

set origin 0.375, 0.6
set size 0.325, 0.3
unset title
unset xlabel
unset ylabel
unset key
set xrange [0.3:0.7]
set yrange [0:0.00004]
replot 

set origin 0.375, 0.325
set size 0.325, 0.3
unset title
unset xlabel
unset ylabel
unset key
set xrange [0.8:1.2]
set yrange [0:0.00085]
replot 

unset multiplot
