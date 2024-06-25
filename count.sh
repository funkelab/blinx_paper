#!/bin/zsh

rm **/*.txt

for i in sections/**/*.tex
do \
  echo $i
  detex -l -n $i > `echo $i | sed -e 's/tex/txt/'`
done

setopt NULL_GLOB
for d in sections/00_abstract sections/01_introduction sections/02_method sections/03_results sections/04_discussion sections/05_experimental_methods
do \
  echo "Counting in $d..."
  a=($d.txt)
  b=($d**/*.txt)
  files="${a} ${b}"
  wc -w $(echo $files) | sort -n
done
