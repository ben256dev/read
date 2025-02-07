#!/bin/bash

finaltxt="../apology_greek.md"

if [ ! -f $finaltxt ]; then
    touch $finaltxt
fi

echo "---"                   >$finaltxt
echo "title: Apology"       >>$finaltxt
echo "author: Plato"        >>$finaltxt
echo "translator: original" >>$finaltxt
echo "---"                  >>$finaltxt

for f in $(ls xml); do
    sed -E 's/<milestone unit="section" n="([^"]+)"\s*\/?>/[\1] /g' xml/$f | sed -E 's/<[^>]*>//g' >>$finaltxt
done
