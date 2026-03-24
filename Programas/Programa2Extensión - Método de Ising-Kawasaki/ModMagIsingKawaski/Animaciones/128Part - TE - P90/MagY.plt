
set title 'Magnetización según eje Y para el caso de N = 128^2 partículas para diferentes temperaturas y x=0.5.'

set ylabel 'M(Y,T)'
set xlabel 'Eje Y de s_{i,j}, 128 partículas/cortes'

set xra[0:128]
set yra[-1.05:1.05]

plot 'MPEYT1       .dat' u 1:2 w lp t 'M(Y,0.5K)', 'MPEYT2       .dat' u 1:2 w lp t 'M(Y,0.8K)', 'MPEYT3       .dat' u 1:2 w lp t 'M(Y,0.9K)', 'MPEYT4       .dat' u 1:2 w lp t 'M(Y,0.925K)', 'MPEYT5       .dat' u 1:2 w lp t 'M(Y,0.95K)', 'MPEYT6       .dat' u 1:2 w lp t 'M(Y,1K)'
