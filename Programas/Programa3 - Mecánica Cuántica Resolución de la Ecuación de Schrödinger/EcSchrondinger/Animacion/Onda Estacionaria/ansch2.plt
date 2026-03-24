set term gif animate

set output 'schr2.gif'
 
set label 'S=1000; nciclos=5000' at 10, 0.008
set label 'V=0' at 10, 0.005
 
do for [a = 0:2000:2] {
set multiplot layout 3,1
set xra[0:5000]
set yra[0:1]
set ytics('0' 0, '0.5' 0.5, '1' 1)
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:3 w l lw 2 t '<Xm>'
set xra[0:5000]
set yra[-2E-11:2E-11]
set ytics('-2E-11' -2E-11, '0' 0, '2E-11' 2E-11)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:4 w l lw 2 t '<Pm>'
set xra[0:5000]
set yra[100:200]
set ytics('100' 100, '150' 150, '200' 200)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:5 w l lw 2 t '<Hm>'
unset multiplot
}
 
