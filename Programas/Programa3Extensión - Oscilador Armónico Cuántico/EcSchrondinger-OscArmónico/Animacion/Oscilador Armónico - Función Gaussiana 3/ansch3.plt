
set xra[0:5000]
set yra[0:0.6]
set ytics('0' 0, '0.3' 0.3, '0.6' 0.6)

set xlabel 'n - Tiempo'

plot 'NXPHPHFT.dat' u 1:6 w l lw 2 t 'dX*dP'
replot 0.5 t 'dX*dP>/=1/2'
replot 0.5 t '(dX*dP)_{teorico aproximado}>'
