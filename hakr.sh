#!/bin/sh
for f in index company service privacy contact 
do
	m4 $f.html.m4 > $f.html
	echo "Done: $f.html"
done
