#!/bin/bash 

if [ $# -ne 3 ];then
    echo "trois arguments requis"
    exit 1
fi 
nombre1=$1
nombre2=$2 
operateur=$3

case $operateur in
    "+")
    resultat=$((nombre1 + nombre2))
    ;;
     "-")
    resultat=$((nombre1 - nombre2))
    ;;
    \*)
    resultat=$((nombre1 * nombre2))
    ;;
    /)
    if [ $nombre2 -eq 0 ]; then
        echo "erreur: division par zero"
        exit 2
    else
        resultat=$((nombre1 / nombre2))
    fi
    ;;
    %)
    if [ $nombre2 -eq 0 ]; then
        echo "erreur: division par zero"
        exit 2
    else
        resultat=$((nombre1 % nombre2))
    fi
    ;;
    *)
    echo "operateur inconnu essaye avec "*"" 
    exit 3
    ;;
esac
echo "$resultat"
exit 0

