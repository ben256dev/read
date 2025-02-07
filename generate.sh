#!/bin/bash

for f in *.md; do
    echo -ne "  ...\r"
    ./convert.sh -n "$f"
    new_file="$(basename "$f" .md).html"

    echo -ne "\033[2K  ...\r"
    mv "$new_file" ../public/read/
    echo -ne "\033[2K$new_file\r\n"
done
