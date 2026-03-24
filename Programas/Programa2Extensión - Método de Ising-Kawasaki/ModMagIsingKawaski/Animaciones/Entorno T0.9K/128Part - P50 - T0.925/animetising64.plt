set term gif animate

set output 'MetIsingT1Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:1000]{plot "MSPT1       .dat" i a matrix with image notitle}


