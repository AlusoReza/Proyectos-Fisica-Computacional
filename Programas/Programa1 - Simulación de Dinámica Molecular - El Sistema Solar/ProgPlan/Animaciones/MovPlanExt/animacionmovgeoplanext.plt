set term gif animate

set output 'Mov_Geo_Sis_Solar_Exterior.gif'

set xra[-6*10**12:6*10**12]
set yra[-6*10**12:6*10**12]

set grid

do for [ii=1:300000:1750]{plot "movgeoplanext.dat" u 7:8 every ::ii::ii w p pt 7 ps 3 lc 1 t 'Tierra', "movgeoplanext.dat" u 11:12 every ::ii::ii w p pt 7 ps 3 lc 2 t 'Jupiter', "movgeoplanext.dat" u 11:12 every ::1::ii w l lc 0 notitle, "movgeoplanext.dat" u 13:14 every ::ii::ii w p pt 7 ps 3 lc 3 t 'Saturno', "movgeoplanext.dat" u 13:14 every ::1::ii w l lc 0 notitle, "movgeoplanext.dat" u 15:16 every ::ii::ii w p pt 7 ps 3 lc 4 t 'Urano', "movgeoplanext.dat" u 15:16 every ::1::ii w l lc 0 notitle, "movgeoplanext.dat" u 17:18 every ::ii::ii w p pt 7 ps 3 lc 5 t 'Neptuno', "movgeoplanext.dat" u 17:18 every ::1::ii w l lc 0 notitle, "movgeoplanext.dat" u 19:20 every ::ii::ii w p pt 7 ps 3 lc 6 t 'Plutón', "movgeoplanext.dat" u 19:20 every ::1::ii w l lc 0 notitle}
