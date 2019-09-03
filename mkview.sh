#! /usr/bin/env bash

if [ $# -ne 1 ]; then
	echo "Usage: ./mkview.sh <lecture slides pdf>"
	exit 1
fi

lec="$1"

dir=$(dirname $lec)
base=$(basename $lec .pdf)
#echo "dir=$dir"
#echo "base=$base"

if [ X"$dir/$base.pdf" != X"$lec" ]; then
	echo "Bad filename?: $lec"
	exit 1
fi

echo "Running: java -jar $HOME/Software/pp4p/pp4p.jar $lec $dir/$base.view.pdf"
java -jar $HOME/Software/pp4p/pp4p.jar $lec $dir/$base.view.pdf
