#!/bin/gnuplot
set terminal postscript eps enhanced "Palatino" 12
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

yi=-0.1
yf=0.6

set xrange[-6:12]
set yrange[yi:yf]
#set arrow nohead lt 2 from 2.4,-0.1 to 2.4,0.4
#set arrow nohead lt 2 from 2.925,-0.1 to 2.925,0.4
set xlabel "{/Palatino-Italic z} /{/Palatino-Italic a}_0"
set ylabel "{/Symbol D}{/Palatino-Italic q}({/Palatino-Italic z}) /e"

set key samplen 1.5

xconv=0.52918

set output "../data/prova/cucn/cucn_cda.eps"
set arrow nohead lt 1 from 1.85,yi to 1.85,yf
set key top right Left reverse box title "{/Palatino-Bold Cu-CN}"
plot \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/fit-drho.dsv" u 1:2 w l ls 1 title "{/Symbol D}{/Symbol-Oblique r}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/fit-drho0.dsv" u 1:2 w l ls 2 title "{/Symbol D}{/Symbol-Oblique r}'", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/fit-pair.00001.dsv" u 1:($2*2) w l ls 11 title "{/Symbol D}{/Symbol-Oblique r}'_{1:2}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/fit-pair.00005.dsv" u 1:($2*2) w l ls 12 title "{/Symbol D}{/Symbol-Oblique r}'_{3:4}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/fit-pair.00011.dsv" u 1:($2*2) w l ls 13 title "{/Symbol D}{/Symbol-Oblique r}'_{5:6}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/fit-pair.00009.dsv" u 1:($2*2) w l ls 14 title "{/Symbol D}{/Symbol-Oblique r}'_{7:8}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/fit-pair.00021.dsv" u 1:($2*2) w l ls 15 title "{/Symbol D}{/Symbol-Oblique r}'_{9:10}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/fit-pair.00019.dsv" u 1:($2*2) w l ls 16 title "{/Symbol D}{/Symbol-Oblique r}'_{11:12}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/paste.dsv" u 1:($2*2+$5*2+$8*2+$11*2+$14*2+$17*2) w p ls 21 title "{/Symbol D}{/Symbol-Oblique r}'_{1:12}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/cucn/cucn.xyz" u ($4/xconv):($3*0) w p pt 7 ps 0.5 notitle \

unset arrow
set output "../data/prova/agcn/agcn_cda.eps"
set arrow nohead lt 1 from 2.15,yi to 2.15,yf
set key top right Left reverse box title "{/Palatino-Bold Ag-CN}"
plot \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/drho.dsv" u 1:2 w l ls 1 title "{/Symbol D}{/Symbol-Oblique r}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/drho0.dsv" u 1:2 w l ls 2 title "{/Symbol D}{/Symbol-Oblique r}'", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/fit-pair.00001.dsv" u 1:($2*2) w l ls 11 title "{/Symbol D}{/Symbol-Oblique r}'_{1:2}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/fit-pair.00007.dsv" u 1:($2*2) w l ls 12 title "{/Symbol D}{/Symbol-Oblique r}'_{3:4}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/fit-pair.00009.dsv" u 1:($2*2) w l ls 13 title "{/Symbol D}{/Symbol-Oblique r}'_{5:6}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/fit-pair.00013.dsv" u 1:($2*2) w l ls 14 title "{/Symbol D}{/Symbol-Oblique r}'_{7:8}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/fit-pair.00017.dsv" u 1:($2*2) w l ls 15 title "{/Symbol D}{/Symbol-Oblique r}'_{9:10}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/fit-pair.00025.dsv" u 1:($2*2) w l ls 16 title "{/Symbol D}{/Symbol-Oblique r}'_{11:12}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/paste.dsv" u 1:($2*2+$5*2+$8*2+$11*2+$14*2+$17*2) w p ls 21 title "{/Symbol D}{/Symbol-Oblique r}'_{1:12}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/agcn/agcn.xyz" u ($4/xconv):($3*0) w p pt 7 ps 0.5 notitle \



unset arrow
set output "../data/prova/aucn/aucn_cda.eps"
set arrow nohead lt 1 from 2.05,yi to 2.05,yf
set key top right Left reverse box title "{/Palatino-Bold Au-CN}"
plot \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/drho.dsv" u 1:2 w l ls 1 title "{/Symbol D}{/Symbol-Oblique r}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/drho0.dsv" u 1:2 w l ls 2 title "{/Symbol D}{/Symbol-Oblique r}'", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/fit-pair.00001.dsv" u 1:($2*2) w l ls 11 title "{/Symbol D}{/Symbol-Oblique r}'_{1:2}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/fit-pair.00006.dsv" u 1:($2*2) w l ls 12 title "{/Symbol D}{/Symbol-Oblique r}'_{3:4}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/fit-pair.00015.dsv" u 1:($2*2) w l ls 13 title "{/Symbol D}{/Symbol-Oblique r}'_{5:6}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/fit-pair.00009.dsv" u 1:($2*2) w l ls 14 title "{/Symbol D}{/Symbol-Oblique r}'_{7:8}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/fit-pair.00017.dsv" u 1:($2*2) w l ls 15 title "{/Symbol D}{/Symbol-Oblique r}'_{9:10}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/fit-pair.00025.dsv" u 1:($2*2) w l ls 16 title "{/Symbol D}{/Symbol-Oblique r}'_{11:12}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/paste.dsv" u 1:($2*2+$5*2+$8*2+$11*2+$14*2+$17*2) w p ls 21 title "{/Symbol D}{/Symbol-Oblique r}'_{1:12}", \
"../nscv/production/aug-cc-pVTZ-DK_1.3_5_A22/aucn/aucn.xyz" u ($4/xconv):($3*0) w p pt 7 ps 0.5 notitle \




#"../../../drafts/1401she/cube/au20pb/au20pb_cda.dsv" u ( $1>= 2.4 && $1<= 2.9 ? $1 : 1/0):(0.4):(-0.1) w filledcurves ls 99 notitle, \

#"au_file.xyz" u ($2):($2*0):( \
#					$1 == 79 ? "" : \
#					$1 == 479 ? "" : \
#						1/0) w labels font "Palatino, 10" point pt 7 ps 0.5 offset 0, -0.75 notitle, \
