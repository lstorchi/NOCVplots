#!/bin/gnuplot
set term postscript enhanced color "Palatino" 12
set encoding utf8
#set xtics rotate by 25 offset -1,-2
set grid ytics lt 0 lw 1 lc rgb "#bbbbbb"
set grid xtics lt 0 lw 1 lc rgb "#bbbbbb"
set size 0.5,0.5
set lmargin 10
set bmargin 3.25
set rmargin 2
set tmargin 1
#set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb "white" behind
set xzeroaxis
set yzeroaxis

#set title "{/Times-Bold Charge Displacement functions}"

lw1=2
ps2=0.35
set style line 11 lt 1 lw lw1 pt 6 ps ps2 lc rgb "red"  # red
set style line 12 lt 1 lw lw1 pt 6 ps ps2 lc rgb "blue" # blue
set style line 13 lt 1 lw lw1 pt 6 ps ps2 lc rgb "#228B22" # forestgreen
set style line 14 lt 1 lw lw1 pt 6 ps ps2 lc rgb "#A0522D" # sienna
set style line 15 lt 1 lw lw1 pt 6 ps ps2 lc rgb "#FFA500" # orange
set style line 16 lt 1 lw lw1 pt 6 ps ps2 lc rgb "#FF6347" # tomato
set style line 21 lt 2 lw lw1 pt 6 ps ps2 lc rgb "red"  # red
set style line 22 lt 2 lw lw1 pt 6 ps ps2 lc rgb "blue" # blue
set style line 23 lt 2 lw lw1 pt 6 ps ps2 lc rgb "#228B22" # forestgreen
set style line 24 lt 2 lw lw1 pt 6 ps ps2 lc rgb "#A0522D" # sienna
set style line 25 lt 2 lw lw1 pt 6 ps ps2 lc rgb "#FFA500" # orange
set style line 26 lt 2 lw lw1 pt 6 ps ps2 lc rgb "#FF6347" # tomato

# ovverride
set style line 1 lt 2 lw lw1 pt 6 ps ps2 lc rgb "black"
set style line 2 lt 1 lw lw1 pt 6 ps ps2 lc rgb "black"
set style line 11 lt 1 lw lw1 pt 6 ps ps2 lc rgb "red"
set style line 12 lt 1 lw lw1 pt 6 ps ps2 lc rgb "#228B22"
set style line 13 lt 1 lw lw1 pt 6 ps ps2 lc rgb "blue"
set style line 14 lt 1 lw lw1 pt 6 ps ps2 lc rgb "#4dbeee"
set style line 15 lt 1 lw lw1 pt 6 ps ps2 lc rgb "gray50"
set style line 16 lt 1 lw lw1 pt 6 ps ps2 lc rgb "gray70"
set style line 21 lt 1 lw lw1 pt 6 ps ps2 lc rgb "black" 

set style line 99 lt 1.2 lw 1 lc rgb "#D8BFD8"
#set style line 99 lt 1.2 lw 1 lc rgb "#ff6666"

yi=-0.05
yf=0.30

set xrange[-20.0:13.0]
set yrange[yi:yf]
#set arrow nohead lt 2 from 2.4,-0.1 to 2.4,0.4
#set arrow nohead lt 2 from 2.925,-0.1 to 2.925,0.4
set xlabel "{/Palatino-Italic z} /{/Palatino-Italic a}_0"
set ylabel "{/Symbol D}{/Palatino-Italic q}({/Palatino-Italic z}) /e"

set key samplen 1.5

xconv=1

set output "cda.eps"
set arrow nohead lt 1 from 1.85,yi to 1.85,yf
set key top left reverse box title "{/Palatino-Bold Ag_{20}-Og}"
plot \
"./full" u 1:2 w l ls 2 title "{/Symbol D}{/Symbol-Oblique r}'", \
"./fit-pair.26399.dsv" u 1:($2*2) w l ls 11 title "{/Symbol D}{/Symbol-Oblique r}'_{1}", \
"./fit-pair.26397.dsv" u 1:($2*2) w l ls 12 title "{/Symbol D}{/Symbol-Oblique r}'_{2}", \
"./fit-pair.26395.dsv" u 1:($2*2) w l ls 13 title "{/Symbol D}{/Symbol-Oblique r}'_{3}", \
"./fit-pair.26394.dsv" u 1:($2*2) w l ls 14 title "{/Symbol D}{/Symbol-Oblique r}'_{4}", \
"./fit-pair.26391.dsv" u 1:($2*2) w l ls 15 title "{/Symbol D}{/Symbol-Oblique r}'_{5}", \
"./fit-pair.26389.dsv" u 1:($2*2) w l ls 16 title "{/Symbol D}{/Symbol-Oblique r}'_{6}", \
"./Au20Og.xyz" u ($4/xconv):($3*0) w p pt 7 ps 0.5 notitle \

