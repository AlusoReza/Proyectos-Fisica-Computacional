set term gif animate

set output 'Mov_Hel_Sis_Solar_Interior.gif'

set xra[-4*10**11:4*10**11]
set yra[-4*10**11:4*10**11]

set grid

do for [ii=1:300000:100]{plot "movhelplanint.dat" u 1:2 every ::ii::ii w p pt 7 ps 2 lc 1 t 'Sol', "movhelplanint.dat" u 3:4 every ::ii::ii w p pt 7 ps 2 lc 2 t 'Mercurio', "movhelplanint.dat" u 3:4 every ::1::ii w l lc 0 notitle, "movhelplanint.dat" u 5:6 every ::ii::ii w p pt 7 ps 2 lc 3 t 'Venus', "movhelplanint.dat" u 5:6 every ::1::ii w l lc 0 notitle, "movhelplanint.dat" u 7:8 every ::ii::ii w p pt 7 ps 2 lc 4 t 'Tierra', "movhelplanint.dat" u 7:8 every ::1::ii w l lc 0 notitle, "movhelplanint.dat" u 9:10 every ::ii::ii w p pt 7 ps 2 lc 5 t 'Marte', "movhelplanint.dat" u 9:10 every ::1::ii w l lc 0 notitle}
