#!/bin/bash

if  [ $# -ne 3 ];then 
    echo "trois arguments requis"
    exit 1
fi
fichier1=$1
fichier2=$2
fichier3=$3

for fic in "$fichier1" "$fichier2" ;do 
   if [ ! -f "$fic" ]; then
   echo "le fichier $fic n'existe pas ou n'est pas valide"
   exit 2
   fi
done
if [ ! -w "$fichier3" ]; then
    echo "le fichier $fichier3 n'a pas les driots d'ecriture"
    exit 3
fi

cat "$fichier1" "$fichier2" > "$fichier3" || echo "erreur lors de la fucsion" 