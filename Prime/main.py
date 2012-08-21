#!/usr/bin/python
import math
n=200
r=[None]*(n+1)
for x in xrange(2,int(math.sqrt(n))+1):
    for y in xrange(x,int(n/x)+1):
        v=x*y;
        if v <= n:
            r[v]=1

for x in xrange(1,n+1):
    if r[x]==None:
        print x

