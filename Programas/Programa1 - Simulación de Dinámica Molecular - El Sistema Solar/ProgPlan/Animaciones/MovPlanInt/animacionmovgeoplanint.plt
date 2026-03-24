set term gif animate

set output 'Mov_Geo_Sis_Solar_Interior.gif'

set xra[-4*10**11:4*10**11]
set yra[-4*10**11:4*10**11]

set grid

do for [ii=1:300000:100]{plot "movgeoplanint.dat" u 7:8 every ::ii::ii w p pt 7 ps 3 lc 1 t 'Tierra', "movgeoplanint.dat" u 1:2 every ::ii::ii w p pt 7 ps 3 lc 2 t 'Sol', "movgeoplanint.dat" u 1:2 every ::1::ii w l lc 0 notitle, "movgeoplanint.dat" u 3:4 every ::ii::ii w p pt 7 ps 3 lc 3 t 'Mercurio', "movgeoplanint.dat" u 3:4 every ::1::ii w l lc 0 notitle, "movgeoplanint.dat" u 5:6 every ::ii::ii w p pt 7 ps 3 lc 4 t 'Venus', "movgeoplanint.dat" u 5:6 every ::1::ii w l lc 0 notitle, "movgeoplanint.dat" u 9:10 every ::ii::ii w p pt 7 ps 3 lc 5 t 'Marte', "movgeoplanint.dat" u 9:10 every ::1::ii w l lc 0 notitle}
