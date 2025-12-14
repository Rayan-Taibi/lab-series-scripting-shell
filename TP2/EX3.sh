#!/bin/bash

# Déclarer les tableaux
declare -A compteur_connexions

# Extraire les noms d'utilisateurs et compter
while read ligne; do
    # Ignorer les lignes vides et les lignes spéciales
    if [[ "$ligne" != "" ]] && [[ "$ligne" != wtmp* ]] && [[ "$ligne" != reboot* ]]; then
        user=$(echo "$ligne" | awk '{print $1}')
        
        # Incrémenter le compteur pour cet utilisateur
        if [ -z "${compteur_connexions[$user]}" ]; then
            compteur_connexions[$user]=1
        else
            compteur_connexions[$user]=$((${compteur_connexions[$user]} + 1))
        fi
    fi
done < <(last)

# Trouver le maximum
max_count=0
max_user=""

for user in "${!compteur_connexions[@]}"; do
    count=${compteur_connexions[$user]}
    if [ $count -gt $max_count ]; then
        max_count=$count
        max_user="$user"
    fi
done

if [ -n "$max_user" ]; then
    echo "Utilisateur: $max_user"
    echo "Nombre de connexions: $max_count"
else
    echo "Aucune connexion trouvée"
    exit 1
fi