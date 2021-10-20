wget https://www.der-hammer.info/terminal/hterm-linux-64.tgz
#installer les fichiers dans le dossiers /opt/hterm
sudo mkdir /opt/hterm
sudo tar xvf hterm-linux-64.tgz -C /opt/hterm
sudo chmod +x /opt/hterm/hterm
sudo cp hterm.png /opt/hterm

#créer le lanceur
sudo tee /usr/share/applications/hterm.desktop <<-EOF
[Desktop Entry]
Type=Application
Categories=Development;
Name=HTerm
Comment=Terminal Emulator
Icon=/opt/hterm/hterm.png
Exec=/opt/hterm/hterm
Terminal=false
EOF

rm hterm-linux-64.tgz
