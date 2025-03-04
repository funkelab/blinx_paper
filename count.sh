#!/bin/zsh

rm **/*.txt

for i in sections/**/*.tex
do \
  echo $i
  detex -l -n $i > `echo $i | sed -e 's/tex/txt/'`
done

echo "Abstract:"
wc -w $(echo sections/00_abstract.txt)

setopt NULL_GLOB
for d in sections/01_introduction sections/02_method sections/03_results sections/04_discussion sections/06_acknowledgments sections/07_contributions sections/08_code sections/09_si_description
do \
  echo "Counting in $d..."
  a=($d.txt)
  b=($d**/*.txt)
  files="${a} ${b}"
  wc -w $(echo $files) | sort -n
done
