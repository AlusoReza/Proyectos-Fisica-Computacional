

set multiplot
#-----------------------------------------------------------------
set origin 0,0
set size 1,1

set title 'Variaciones a lo largo del tiempo (t) de <M> para x=0.5 (m=0) y 64 partículas por dominios.'

set ylabel 'Tiempo (t).'
set xlabel '<M(T,t)>'

set xra[0:2500]
set yra[-0.52:0.52]

set key

plot 'MAGPDT1       .dat' u 1:4 w lp t 'M(0.5K,t) - Total', '' u 1:2 w lp t 'M(0.5K,t) - Dominio 1.', '' u 1:3 w lp t 'M(0.5K,t) - Dominio 2.', 'MAGPDT2       .dat' u 1:4 w lp t 'M(0.8K,t) - Total', '' u 1:2 w lp t 'M(0.8K,t) - Dominio 1.', '' u 1:3 w lp t 'M(0.8K,t) - Dominio 2.', 'MAGPDT3       .dat' u 1:4 w lp t 'M(0.9K,t) - Total', '' u 1:2 w lp t 'M(0.9K,t) - Dominio 1.', '' u 1:3 w lp t 'M(0.9K,t) - Dominio 2.', 'MAGPDT4       .dat' u 1:4 w lp t 'M(0.925K,t) - Total', '' u 1:2 w lp t 'M(0.925K,t) - Dominio 1.', '' u 1:3 w lp t 'M(0.925K,t) - Dominio 2.', 'MAGPDT5       .dat' u 1:4 w lp t 'M(0.95K,t) - Total', '' u 1:2 w lp t 'M(0.95K,t) - Dominio 1.', '' u 1:3 w lp t 'M(0.95K,t) - Dominio 2.', 'MAGPDT6       .dat' u 1:4 w lp t 'M(1K,t) - Total', '' u 1:2 w lp t 'M(1K,t) - Dominio 1.', '' u 1:3 w lp t 'M(1K,t) - Dominio 2.'
#-----------------------------------------------------------------

set origin 0.4,0.15
set size 0.45,0.3

set xra[90:1250]
set yra[-0.1:0.1]

unset key
unset title
unset xlabel
unset ylabel

replot
#-----------------------------------------------------------------
set origin 0.4,0.55
set size 0.4,0.3

set xra[900:1050]
set yra[-0.065:0.065]

unset key
unset title
unset xlabel
unset ylabel

replot
unset multiplot
