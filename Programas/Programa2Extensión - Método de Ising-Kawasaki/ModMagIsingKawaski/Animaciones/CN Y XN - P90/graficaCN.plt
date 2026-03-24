set samples 1000
set xzeroaxis

set multiplot

set origin 0,0
set size 1,1

set title 'Variaciones de C_N(E,N,T) experimentales ajustados a funciones tipo y=cte/x^2 para x=0.9 o m=0.8.'

set dummy x

f(x) = a/x**2
g(x) = b/x**2
h(x) = c/x**2

fit f(x) 'MEPPT32.dat' u 1:4 via a

fit g(x) 'MEPPT64.dat' u 1:4 via b

fit h(x) 'MEPPT128.dat' u 1:4 via c

set xrange [0:5]
set yrange [-0.0005:0.4]

set key

plot 'MEPPT32.dat' u 1:4 w lp t 'C_N 32 part.', f(x) t 'C_NTeorico - 32 = (0.00367272 +/- 9.931e-06)/T²', 'MEPPT64.dat' u 1:4 w lp t 'C_N 64 part.', g(x) t 'C_NTeorico - 64 = (0.000948921 +/- 2.374e-06)/T²' , 'MEPPT128.dat' u 1:4 w lp t 'C_N 128 part.', h(x) t 'C_NTeorico - 128 = (0.000243261 +/- 3.506e-07)/T²'

set origin 0.225, 0.175
set size 0.7, 0.7
unset title
unset xlabel
unset ylabel
unset key
set xrange [0.1:1]
set yrange [0:0.03]
replot 

unset multiplot
