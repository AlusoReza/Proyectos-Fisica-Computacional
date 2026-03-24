

set multiplot
#-----------------------------------------------------------------
set origin 0,0
set size 1,1

set title 'Variaciones a lo largo del tiempo (t) de <M> para x=0.9 (m=0.8) y 128 partículas por dominios.'

set ylabel 'Tiempo (t).'
set xlabel '<M(T,t)>'

set xra[0:2500]
set yra[-0.115:0.915]

set key

plot 'MAGPDT6-32       .dat' u 1:(-$4) w lp t 'M(0.5K,t) - Total', '' u 1:(-$2) w lp t 'M(0.5K,t) - Dominio 1.', '' u 1:(-$3) w lp t 'M(0.5K,t) - Dominio 2.', 'MAGPDT6-64       .dat' u 1:(-$4) w lp t 'M(0.8K,t) - Total', '' u 1:(-$2) w lp t 'M(0.8K,t) - Dominio 1.', '' u 1:(-$3) w lp t 'M(0.8K,t) - Dominio 2.', 'MAGPDT6-128       .dat' u 1:(-$4) w lp t 'M(0.9K,t) - Total', '' u 1:(-$2) w lp t 'M(0.9K,t) - Dominio 1.', '' u 1:(-$3) w lp t 'M(0.9K,t) - Dominio 2.'
#-----------------------------------------------------------------

set origin 0.1,0.315
set size 0.25,0.4

set xra[1000:1500]
set yra[0.7:0.825]

unset key
unset title
unset xlabel
unset ylabel

replot
#-----------------------------------------------------------------
set origin 0.4,0.315
set size 0.5,0.4

set xra[1000:1500]
set yra[0.02:0.1]

unset key
unset title
unset xlabel
unset ylabel

replot
#-----------------------------------------------------------------
unset multiplot
