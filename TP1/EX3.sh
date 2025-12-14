#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 exec file1.c file2.c ..."
    exit 1
fi

exec=$1
shift

gcc -o "$exec" "$@"
if [ $? -eq 0 ]; then  
   
    cp "$exec" ~/bin
    echo "Compilation réussie"
    exit 0
else
    echo "Erreur de compilation"
    exit 2
fi
