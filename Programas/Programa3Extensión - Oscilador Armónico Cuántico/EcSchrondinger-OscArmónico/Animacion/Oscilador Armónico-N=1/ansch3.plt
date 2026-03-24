
set xra[0:5000]
set yra[0:2]
set ytics('0' 0, '1' 1, '2' 2)

set xlabel 'n - Tiempo'

plot 'NXPHPHFT.dat' u 1:6 w l lw 2 t 'dX*dP'
replot 0.5 t 'dX*dP>/=1/2'
replot 1.5 t '(dX*dP)_{teorico aproximado}>'
