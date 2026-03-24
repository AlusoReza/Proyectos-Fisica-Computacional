set term gif animate

set output 'Movimiento_ult.gif'

set yra[-1.01:-0.96]
set xra[-0.26:0.26]

do for [ii=1:10000:50] {plot 'POSXYPEND.dat' u 1:2 every ::ii::ii w p ps 1 pt 7 t 'Evolución Posición.', "POSXYPEND.dat" u 1:2 every ::1::ii w l lc 0 notitle}

set term gif animate

set output 'Energia_ult.gif'

set yra[-9.85:-9.5]
set xra[0:10**8]

do for [ii=1:10000:50] {plot 'ENERGYTIEM.dat' u 1:2 every ::ii::ii w p ps 1 pt 7 t 'Evolución Energía.', "ENERGYTIEM.dat" u 1:2 every ::1::ii w l lc 0 notitle}

set term gif animate

set output 'DiagramaFases_ult.gif'

set yra[-0.3:0.3]
set xra[-0.3:0.3]

do for [ii=1:10000:50] {plot 'DIAGASES.dat' u 1:2 every ::ii::ii w p ps 1 pt 7 t 'Evolución Energía.', "DIAGASES.dat" u 1:2 every ::1::ii w l lc 0 notitle}
