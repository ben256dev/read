#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage: $0 <markdown_file>"
    exit 1
fi

file_name=$(basename $1 .md)
pandoc "$file_name.md" -o "$file_name.html" --template=read.html --metadata last-updated="$(date +'%Y-%m-%d %H:%M:%S')"
firefox "$file_name.html" 1>/dev/null 2>/dev/null &
