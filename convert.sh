#!/bin/bash

usage() {
    echo "usage: $0 [-n|--no-preview] <markdown_file>"
    exit 1
}

no_preview=false

while [[ "$1" =~ ^- ]]; do
    case "$1" in
        -n|--no-preview)
            no_preview=true
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

if [[ -z "$1" ]]; then
    usage
fi

file_name=$(basename $1 .md)
pandoc "$file_name.md" -o "$file_name.html" --template=read.html --metadata last-updated="$(date +'%Y-%m-%d %H:%M:%S')"

if ! $no_preview; then
    firefox "$file_name.html" 1>/dev/null 2>/dev/null &
fi
