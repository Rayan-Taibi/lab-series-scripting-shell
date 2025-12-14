#!/bin/bash

# Vérification du nombre d'arguments
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: $0 [-force] archive.tar"
    exit 1
fi

force=0

# Gestion de l'option -force
if [ "$1" = "-force" ]; then
    if [ -z "$2" ]; then 
        echo "Erreur: Nom de l'archive manquant."
        exit 1
    fi
    force=1
    archive="$2"
else
    archive="$1"
fi

# Création de l'archive vide pour éviter les erreurs au premier ajout
# (tar rvf a besoin que le fichier existe ou le crée, mais touch est une bonne sécurité)
touch "$archive" || exit 1

# CORRECTION : On force la lecture sur le terminal avec < /dev/tty
find ~ -mtime +7 -type f | while read file; do
    ajouter=0
    
    if [ $force -eq 1 ]; then
        ajouter=1
    else
        echo "Ajouter $file ? (O/N)"
        # ICI : On force la lecture depuis le clavier (tty)
        read rep < /dev/tty
        if [ "$rep" = "O" ] || [ "$rep" = "o" ]; then
            ajouter=1
        fi
    fi

    if [ $ajouter -eq 1 ]; then
        # Utilisation de la commande demandée dans le sujet 
        tar rvf "$archive" "$file"
    fi
done