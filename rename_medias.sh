#!/bin/bash

# Script de renommage des fichiers médias pour ATLAS
# À exécuter depuis le dossier racine de votre projet

echo "🚀 Démarrage du renommage des fichiers médias ATLAS..."

# Vérifier si le dossier medias existe
if [ ! -d "medias" ]; then
    echo "❌ Erreur: Le dossier 'medias' n'existe pas"
    exit 1
fi

cd medias

echo "📁 Renommage dans le dossier: $(pwd)"

# Fonction de renommage sécurisée
rename_file() {
    local old_name="$1"
    local new_name="$2"
    
    if [ -f "$old_name" ]; then
        if [ -f "$new_name" ]; then
            echo "⚠️  $new_name existe déjà, création d'une sauvegarde"
            mv "$new_name" "${new_name}.backup"
        fi
        mv "$old_name" "$new_name"
        echo "✅ $old_name → $new_name"
    else
        echo "⚠️  $old_name introuvable"
    fi
}

# Renommage des fichiers principaux
echo "🔄 Renommage des fichiers principaux..."
rename_file "LogoHeader.svg" "logo-atlas.svg"
rename_file "LogoTalan.svg" "hero-illustration.svg"

# Si LogoTalan.svg n'existe pas, essayer avec LogoTalan-petit.svg
if [ ! -f "hero-illustration.svg" ] && [ -f "LogoTalan-petit.svg" ]; then
    rename_file "LogoTalan-petit.svg" "hero-illustration.svg"
fi

# Renommage des icônes de problèmes/témoignages
echo "🔄 Renommage des icônes sections..."
rename_file "E-commerce.svg" "icon-ecommerce.svg"
rename_file "institution.svg" "icon-corporate.svg"
rename_file "blog.svg" "icon-blog.svg"

# Renommage des icônes de bénéfices
echo "🔄 Renommage des icônes bénéfices..."
rename_file "trafic.svg" "icon-traffic.svg"
rename_file "engagement.svg" "icon-engagement.svg"
rename_file "gain.svg" "icon-time.svg"
rename_file "Calque_1.svg" "icon-clarity.svg"

# Renommage des icônes solutions
echo "🔄 Renommage des icônes solutions..."
rename_file "ATLAS-Foundation.svg" "icon-foundation.svg"
rename_file "ATLAS-Premium.svg" "icon-premium.svg"

echo ""
echo "✨ Renommage terminé!"
echo ""
echo "📋 Fichiers manquants à demander au graphiste:"
echo "   - research-paper.png (image article de recherche)"
echo "   - cyril-wolfangel.png (photo du fondateur)"
echo ""
echo "📁 Contenu final du dossier medias:"
ls -la

cd ..
echo "🎉 Script terminé avec succès!"
