#!/bin/bash

if [ $# -ne 1 ]; then
    echo "un seul argument requis"
    exit 1
fi

cmd=$1

trouve=0

for p in /proc/[0-9]*; do
    if [ -f "$p/status" ]; then
        name=$(head -n 1 "$p/status" | awk '{print $2}') #head -1 pour lire la premiere ligne et la pipe veut dire qu'on envoie la sortie de la commande precedente a la commande suivante et awk pour extraire le deuxieme mot 
        if [ "$name" = "$cmd" ]; then
            echo "PID : ${p##*/}" 
            trouve=1
        fi
    fi
done

[ $trouve -eq 0 ] && echo "Aucun processus trouvé"