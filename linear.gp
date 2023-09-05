
set terminal pslatex auxfile 18 dl 4 color #solid #set terminal postscript enhanced color solid

reset
fnstr="linear"
set output sprintf("%s.tex", fnstr)
print sprintf("output : %s.tex %s.ps", fnstr, fnstr)

set style line 11 lt 1 lw 5 lc rgb "red"
set style line 12 lt 3 lw 5 lc rgb "blue"

set style line 21 lt 1 lw 1 lc rgb "black"
set style line 22 lt 3 lw 1 lc rgb "green"

set style line 3 lt 1 lw 1 lc rgb "black"
#set style line 1 lt 1 lw 5 lc rgb "red"
#set style line 2 lt 1 lw 1 lc rgb "blue"
#set style line 11 lt 3 lw 5 lc rgb "red"
#set style line 21 lt 3 lw 1 lc rgb "blue"



set format x ""
set format y ""
set format y2 ""

set size square 1.2

labelnum=1000
do for [i=labelnum:labelnum+200:1] {unset label i}
set xtics 1 scale 2,1 out ; set mxtics 2
do for [ xx = 0:4:1 ] {
coord=xx*1
lb=sprintf("$%g$",coord);
labelnum=labelnum+1
set label labelnum lb at coord, -5 center offset graph -0.,-0.06
}

set ytics 2  scale 2,1 out mirror ; set mytics 4
do for [ xx = -2:1:1 ] {
coord=xx*2
lb=sprintf("$%g$",coord);
labelnum=labelnum+1
set label labelnum lb at 0, coord right offset graph -0.04,0
}

f(x)=1

set label 2  '$\sigma_0^{-1}\sigma^{(1);xx}(\omega)$'  at graph -0.2,0.5 center rotate by 90 
set label 1  '$\hbar\omega/E_c$' at graph 0.5,-0.13 center

set key samplen 1.5 at graph 0.99,0.36 

#set label 3 '$\times 20$' at 0.1, 20
#set label 4 '$\times 1$'  at 1.0, 20
#set label 5 '$\times 100$' at 2.1, 20

plot [0.:][-5:3] \
     "linearc.dat" u 1:($2/f(0)) w l ls 11 title '$\frac{\Delta}{E_c}=1$: Re', \
     '' u 1:($3/f(0)) w l ls 12 title 'Im',\
     '' u 1:($4/f(0)) w l ls 21 title '$0.7$: Re',\
     '' u 1:($5/f(0)) w l ls 22 title 'Im'