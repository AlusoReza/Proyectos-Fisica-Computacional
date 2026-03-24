set term gif animate

set output 'schr2.gif'
 
set label 'S=1000; nciclos=5000' at 10, 0.008
set label 'V=0' at 10, 0.005
 
do for [a = 0:2000:2] {
set multiplot layout 3,1
set xra[0:5000]
set yra[200:800]
set ytics('200' 200, '500' 500, '800' 800)
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:3 w l lw 2 t '<Xm>'
set xra[0:5000]
set yra[-7.35E-2:7.35E-2]
set ytics('-7.35E-2' -7.35E-2, '0' 0, '7.35E-2' 7.35E-2)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:4 w l lw 2 t '<Pm>'
set xra[0:5000]
set yra[4.07E-3:4.125E-3]
set ytics('4.07E-3' 4.07E-3, '4.0925E-3' 4.0925E-3, '4.125E-3' 4.125E-3)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:5 w l lw 2 t '<Hm>'
unset multiplot
}
 
