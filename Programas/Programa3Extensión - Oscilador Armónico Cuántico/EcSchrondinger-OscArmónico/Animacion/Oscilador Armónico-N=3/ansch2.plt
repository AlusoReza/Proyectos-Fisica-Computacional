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
set yra[-1E-30:1E-30]
set ytics('-1E-30' -1E-30, '0' 0, '1E-30' 1E-30)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:4 w l lw 2 t '<Pm>'

set xra[0:5000]
set yra[650:750]
set ytics('650' 650, '700' 700, '750' 750)
unset label
set xlabel 'n - Tiempo'
plot 'NXPHPHFT.dat' i 0:a u 1:5 w l lw 2 t '<Hm>'

unset multiplot
}
 
