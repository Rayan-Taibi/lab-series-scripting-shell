#!/bin/bash

# Vérification du nombre d'arguments
if [ $# -ne 1 ]; then
    echo "un seul argument requis"
    exit 1
fi

fic=$1
# Vérification de l'existence du fichier
if  [ ! -e "$fic" ]; then 
    echo "le fichier $fic n'existe pas"
    exit 2
fi
# Vérification des droits de lecture
if [ ! -r "$fic" ]; then
    echo"l'utilisateur n'a pas les droits de lecture sur le fichier $fic"
    exit 3
fi 
# Vérification si le fichier est vide
if [ ! -s "$fic" ]; then 
     echo " le fichier $fic est vide"
     exit 4
fi
# Vérification si le fichier est un répertoire
if [ -d "$fic" ]; then
    echo "le fichier $fic est un répertoire et son contenu est :"
    ls -l "$fic"
    exit 5
fi
# Vérification des droits d'exécution
if [ ! -x "$fic" ];then
    echo "le fichier $fic n'est  pas exécutable et son contenu est :"
    cat "$fic"
    exit 6
fi
# Si le fichier est exécutable
if [ -x "$fic" ]; then
    echo "le fichier $fic est exécutable , et son execution affiche  :"
    ./"$fic"
    exit 7
fi