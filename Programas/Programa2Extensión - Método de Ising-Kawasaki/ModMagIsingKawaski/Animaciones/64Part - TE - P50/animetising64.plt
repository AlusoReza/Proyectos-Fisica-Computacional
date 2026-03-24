set term gif animate

set output 'MetIsingT1Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:300]{plot "MSPT1       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT2Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:300]{plot "MSPT2       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT3Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:300]{plot "MSPT3       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT4Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:300]{plot "MSPT4       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT5Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:300]{plot "MSPT5       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT6Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:300]{plot "MSPT6       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT7Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:300]{plot "MSPT7       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT8Part64.gif'

set palette grey

set xra[-0.5:131.5]
set yra[-0.5:131.5]

set size square

do for [a=0:300]{plot "MSPT8       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT9Part64.gif'

set palette grey

set xra[-0.5:127.5]
set yra[-0.5:127.5]

set size square

do for [a=0:300]{plot "MSPT9       .dat" i a matrix with image notitle}

