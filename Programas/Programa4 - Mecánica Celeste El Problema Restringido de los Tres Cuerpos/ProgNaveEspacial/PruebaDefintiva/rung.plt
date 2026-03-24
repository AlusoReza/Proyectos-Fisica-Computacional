set term gif animate

set output 'Prob3cuerpos.gif'

set xra[-4.5e8:4.5e8]
set yra[-1e4:4.5e8]

do for [ii=1:300000:100]{plot "POSXYNLT.dat" u 2:3 every ::ii::ii w p pt 2 ps 2 lc 1 t 'Cohete.', "POSXYNLT.dat" u 2:3 every ::1::ii w l lc 0 notitle, "POSXYNLT.dat" u 4:5 every ::ii::ii w p pt 7 ps 3 lc 2 t 'Luna.', "POSXYNLT.dat" u 4:5 every ::1::ii w l lc 0 notitle, "POSTIE.dat" w p pt 7 ps 2 lc 3 t 'Tierra.'}
