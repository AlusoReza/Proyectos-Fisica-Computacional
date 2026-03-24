set term gif animate

set output 'MetIsingT1Part32.gif'

set palette grey

set xra[-0.5:31.5]
set yra[-0.5:31.5]

set size square

do for [a=0:300]{plot "MSPT1       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT2Part32.gif'

set palette grey

set xra[-0.5:31.5]
set yra[-0.5:31.5]

set size square

do for [a=0:300]{plot "MSPT2       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT3Part32.gif'

set palette grey

set xra[-0.5:31.5]
set yra[-0.5:31.5]

set size square

do for [a=0:300]{plot "MSPT3       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT4Part32.gif'

set palette grey

set xra[-0.5:31.5]
set yra[-0.5:31.5]

set size square

do for [a=0:300]{plot "MSPT4       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT5Part32.gif'

set palette grey

set xra[-0.5:31.5]
set yra[-0.5:31.5]

set size square

do for [a=0:300]{plot "MSPT5       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT6Part32.gif'

set palette grey

set xra[-0.5:31.5]
set yra[-0.5:31.5]

set size square

do for [a=0:300]{plot "MSPT6       .dat" i a matrix with image notitle}

set term gif animate

set output 'MetIsingT7Part32.gif'

set palette grey

set xra[-0.5:31.5]
set yra[-0.5:31.5]

set size square

do for [a=0:300]{plot "MSPT7       .dat" i a matrix with image notitle}

