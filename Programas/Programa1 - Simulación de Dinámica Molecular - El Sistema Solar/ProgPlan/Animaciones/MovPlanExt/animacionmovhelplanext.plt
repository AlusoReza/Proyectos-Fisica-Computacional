set term gif animate

set output 'Mov_Hel_Sis_Solar_Exterior.gif'

set xra[-6*10**12:6*10**12]
set yra[-6*10**12:6*10**12]

set grid

do for [ii=1:300000:1750]{plot "movhelplanext.dat" u 1:2 every ::ii::ii w p pt 7 ps 2 lc 1 t 'Sol', "movhelplanext.dat" u 11:12 every ::ii::ii w p pt 7 ps 2 lc 2 t 'Jupiter', "movhelplanext.dat" u 11:12 every ::1::ii w l lc 0 notitle, "movhelplanext.dat" u 13:14 every ::ii::ii w p pt 7 ps 2 lc 3 t 'Saturno', "movhelplanext.dat" u 13:14 every ::1::ii w l lc 0 notitle, "movhelplanext.dat" u 15:16 every ::ii::ii w p pt 7 ps 2 lc 4 t 'Urano', "movhelplanext.dat" u 15:16 every ::1::ii w l lc 0 notitle, "movhelplanext.dat" u 17:18 every ::ii::ii w p pt 7 ps 2 lc 5 t 'Neptuno', "movhelplanext.dat" u 17:18 every ::1::ii w l lc 0 notitle, "movhelplanext.dat" u 19:20 every ::ii::ii w p pt 7 ps 2 lc 6 t 'Plutón', "movhelplanext.dat" u 19:20 every ::1::ii w l lc 0 notitle}
