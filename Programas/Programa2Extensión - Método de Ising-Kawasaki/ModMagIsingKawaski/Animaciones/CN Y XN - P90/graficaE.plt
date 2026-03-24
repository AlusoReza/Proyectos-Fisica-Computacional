
set title 'Variaciones de la Energía función de la temeperatura para m = 0 y m = 0.8, o x = 0.5 y x = 0.9.' 

set key

plot 'MEPPT32-50.dat' u 1:3 w lp t 'E(T) - x = 0.5 - 32 part.', 'MEPPT64-50.dat' u 1:3 w lp t 'E(T) - x = 0.5 - 64 part.', 'MEPPT128-50.dat' u 1:3 w lp t 'E(T) - x = 0.5 - 128 part.', 'MEPPT32-90.dat' u 1:3 w lp t 'E(T) - x = 0.9 - 32 part.', 'MEPPT64-90.dat' u 1:3 w lp t 'E(T) - x = 0.9 - 64 part.', 'MEPPT128-90.dat' u 1:3 t 'E(T) - x = 0.9 - 128 part.'

