#!/bin/bash

# Installer les paquets doxygen et doxygen-gui

sudo apt install doxygen doxygen-gui

# Ajouter les icônes (cf fichier joint), et mettre à jour le cache des icônes
for SIZE in {"32","48","96","128"}; do 
  cp doxygen$SIZE.png application-vnd.doxygen.png
  sudo xdg-icon-resource install --noupdate --context mimetypes --size $SIZE application-vnd.doxygen.png; 
  sudo xdg-icon-resource install --noupdate --context apps --size $SIZE application-vnd.doxygen.png; 
done

sudo gtk-update-icon-cache /usr/share/icons/hicolor/

# Ajout du type mime pour le script Doxyfile
cat > application-vnd.doxygen.xml <<EOF
<?xml version="1.0" encoding="utf-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/vnd.doxygen">
    <comment>Doxygen script</comment>
    <sub-class-of type="text/plain"/>
    <glob pattern="*.Doxyfile"/>
    <glob pattern="Doxyfile"/>
  </mime-type>
</mime-info>
EOF

sudo xdg-mime install application-vnd.doxygen.xml 

# Ajouter l'entrée dans le menu

cat > doxywizard.desktop <<EOF
[Desktop Entry]
Type=Application
Exec=doxywizard
Name=Doxygen Wizard
Icon=application-vnd.doxygen
Categories=Development;
MimeType=application/vnd.doxygen;
EOF

sudo mv doxywizard.desktop /usr/share/applications/doxywizard.desktop
sudo chown root:root /usr/share/applications/doxywizard.desktop

# Mettre à jour le cache des applications
sudo update-desktop-database

rm application-vnd.doxygen.xml 
rm application-vnd.doxygen.png
rm doxygen48.png
rm doxygen32.png
