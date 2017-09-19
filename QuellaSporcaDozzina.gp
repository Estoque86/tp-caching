#! xgp -qx DATA/QuellaSporcaDozzina.DATA 2:($6/100)
# Created the Thu Nov 24 23:06:12 CET 2016 with:
#   ____________________________
#  /                            \
# /        xgp        __________/
# \__________________/.:nonsns:.
#
 
#-------------------------------------
# SHAPES:
# (c)ircle  (t)riangle (i)nv.tri.
#           (d)iamond  (s)quare
# FILLING:
# (f)illed  (o)paque  (e)mpty (default)
#-------------------------------------
   s=4  ; es=s  ; fs=s+1 ; os=s+66
   c=6  ; ec=c  ; fc=c+1 ; oc=os+1
   t=8  ; et=t  ; ft=t+1 ; ot=oc+1
   i=10 ; ei=i  ; fi=i+1 ; oi=ot+1
   d=12 ; ed=d  ; fd=d+1 ; od=oi+1
   p=14 ; ep=p  ; fp=p+1 ; op=od+1
#-------------------------------------
#  e.g.:  
#  empty circles vs filled squares
#  plot "file" u 1:3 w p pt ec, 
#           "" u 1:4 w lp pt fs
#-------------------------------------

#Happy gnuplotting

#set size 1,0.7

set key top right samplen 2
set logs x
set format x "10^{%T}"

set xlab "Catalog Size (M)"
set ylab "Hit Ratio (h)"

#set label "Rank 10"    at 20000,0.3
set label "C=100"   at 20000,0.5
set label "C=1000"  at 30000,0.7
set label "C=10000" at 40000,0.9

hit(C,M)=log(C)/log(M)

# rerr(C)=100*(hit(C,1e4)-hit(100,1e12))/hit(100,1e12)

# set label sprintf("%.f%%\nerror", rerr(100)) at 15000,0.53
#set label sprintf("%.f%%\nerror", rerr(1000)) at 15000,0.8
# set label sprintf("%.f%%\nerror", rerr(10000)) at 15000,0.975

# set obj circle center 1e4,hit(100,1e4) radius 2

# 250, 300 and 500% errors!

plot \
'QuellaSporcaDozzina.DATA' i 0 u 2:($6/100) t '' w   p pt 5 lc rgb "#AAFF0000",\
'QuellaSporcaDozzina.DATA' i 1 u 2:($6/100) t '' w   p pt 5 lc rgb "#88FF0000" ,\
'QuellaSporcaDozzina.DATA' i 2 u 2:($6/100) t 'h_{LFU}' w  p pt 5 lc rgb "red",\
hit(100,x) t 'h^{app}_{LFU}' w l lt -1, \
hit(1000,x) t '' w l lt -1, \
hit(10000,x) t '' w l lt -1

#plot 'DATA/QuellaSporcaDozzina.DATA'	u 2:($6/100)   t ''	w  l lt -1

