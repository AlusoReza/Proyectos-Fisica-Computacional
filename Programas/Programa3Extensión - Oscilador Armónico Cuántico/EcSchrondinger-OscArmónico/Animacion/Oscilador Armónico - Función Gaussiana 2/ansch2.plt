set term gif animate

set output 'schr2.gif'
 
do for [a = 0:2000:2] {

set multiplot layout 3,1

set xra[0:5000]
set yra[0:1]
set ytics('0' 0, '0.5' 0.5, '1' 1)
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:3 w l lw 2 t '<Xm>'

set xra[0:5000]
set yra[-2.5E-31:2.5E-31]
set ytics('-2.5E-31' -2.5E-31, '0' 0, '2.5E-31' 2.5E-31)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:4 w l lw 2 t '<Pm>'

set xra[0:5000]
set yra[125:150]
set ytics('125' 125, '137.5' 137.5, '150' 150)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:5 w l lw 2 t '<Hm>'

unset multiplot
}
 
