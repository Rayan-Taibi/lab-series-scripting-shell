#!/bin/bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 nom_de_fichier"
    exit 1
fi
DIR=$1
trouve=0

if [ ! -d "$DIR" ];then
    echo "Le répertoire $DIR n'existe pas."
    exit 2
fi
for file in "$DIR"/*; do 
    if [ -f "$file" ] && [ -r "$file" ]; then
        if head -n 1 "$file" | grep -q "#!" ; then
           echo "$file : est un script"
           trouve=1
        fi
    fi
done

if [ $trouve -eq 0 ];then
    echo "Aucun script trouvé dans le répertoire $DIR."
    exit 3
fi