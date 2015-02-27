#!/bin/sh
ODIR=..
for f in index company login service privacy contact 
do
	m4 $f.html.m4 > $ODIR/$f.html
	echo "Done: $f.html"
done
