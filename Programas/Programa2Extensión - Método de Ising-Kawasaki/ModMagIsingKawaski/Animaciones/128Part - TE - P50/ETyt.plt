
set title 'Variaciones a lo largo del tiempo de <E> para x=0.5 (m=0) y 128 partículas.'

set ylabel 'Tiempo.'
set xlabel '<E(T,t)>'

#set xra[0:128]
#set yra[-1.05:1.05]

plot 'MEPMT1       .dat' u 1:3 w lp t 'E(0.5K,t)', 'MEPMT2       .dat' u 1:3 w lp t 'E(0.8K,t)', 'MEPMT3       .dat' u 1:3 w lp t 'E(0.9K,t)', 'MEPMT4       .dat' u 1:3 w lp t 'E(0.925K,t)', 'MEPMT5       .dat' u 1:3 w lp t 'E(0.95K,t)', 'MEPMT6       .dat' u 1:3 w lp t 'E(1K,t)'
