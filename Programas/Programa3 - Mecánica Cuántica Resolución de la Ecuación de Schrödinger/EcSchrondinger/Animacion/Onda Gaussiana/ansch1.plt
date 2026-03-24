set term gif animate

set output 'schr1.gif'
 
do for [a = 0:2000:2] {
set multiplot layout 3,1
set xra[0:1000]
set yra[0:8]
set label 'S=1000; nciclos=5000' at 10, 0.008
set label 'V=0' at 10, 0.005
set ytics('0' 0, '4' 4, '8' 8)
set xlabel 'j - (Espacio)'
plot 'PTRIES.dat' i a u 2:5 w l lw 2 t 'Probabilidad'
set xra[0:1000]
set yra[-2.8:2.8]
set ytics('-2.8' -2.8, '0' 0, '2.8' 2.8)
unset label
set xlabel 'j - Espacio'
plot 'PTRIES.dat' i a u 2:3 w l lw 2 t 'Parte real', '' i a u 2:4 w l lw 2 t 'Parte imaginaria'
set xra[0:5000]
set yra[0:1.1]
set ytics('0' 0.0, '0.5' 0.5, '1.000' 1)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:2 w l lw 2 t 'Norma'
unset multiplot
}
 
