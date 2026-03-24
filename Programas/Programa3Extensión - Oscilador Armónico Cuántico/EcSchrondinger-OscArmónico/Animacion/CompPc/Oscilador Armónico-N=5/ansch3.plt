
set xra[0:5000]
set yra[0:4]
set ytics('0' 0, '2' 2, '4' 4)

set xlabel 'n - Tiempo'

plot 'NXPHPHFT.dat' u 1:6 w l lw 2 t 'dX*dP'
replot 0.5 t 'dX*dP>/=1/2'
replot 3.558015252 t '(dX*dP)_{teorico aproximado}>'
