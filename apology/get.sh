#!/bin/bash

mkdir -p html
mkdir -p xml

for i in {17..42}; do
    fname="apology_$i.html"
    if [ ! -f html/$fname ]; then
        echo -ne "\033[2K  ...\r"
        curl -s "https://www.perseus.tufts.edu/hopper/text?doc=Plat.+Apol.+$i&fromdoc=Perseus%3Atext%3A1999.01.0169" -o html/$fname
        echo -ne "\033[2K$fname\r\n"
    fi
    xname="apology_$i.xml"
    if [ ! -f xml/$xname ]; then
        echo -ne "\033[2K  ...\r"
        # xmlref="$(grep 'class="xml"' html/$fname | awk '{print $4}' | grep -oP 'href="\K[^"]+' | uniq)"
        curl -s "https://www.perseus.tufts.edu/hopper/xmlchunk?doc=Perseus%3Atext%3A1999.01.0169%3Atext%3DApol.%3Apage%3D$i" -o xml/$xname
        echo -ne "\033[2K$xname\r\n"
    fi
done
