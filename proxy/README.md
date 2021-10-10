# Proxy

## Sous Linux Mint
Aller dans Menu > Préférences > Réseau

Sous serveur mandataire, choisir méthode Manuelle
Configurer le proxy https : 172.16.0.1 port 3128
Dans ignorer les hôtes, spécifier :
localhost, 127.0.0.0/8, ::1, *.ir.lan, 192.168.0.0/16

## Configuration pour apt
Créer /etc/apt/apt.conf.d/proxy
```
sudo nano /etc/apt/apt.conf.d/proxy
```
Ajouter le contenu :
```
Acquire::https::Proxy "http://172.16.0.1:3128";
Acquire::http::Proxy "http://172.16.0.1:3128";
Acquire::ftp::Proxy "http://172.16.0.1:3128";
```

## Configuration wget

Editer /etc/wgetrc :
```
sudo nano /etc/wgetrc
```
Corriger les lignes suivantes. Enlever le # au début.
```
# You can set the default proxies for Wget to use for http, https, and ftp.
# They will override the value in the environment.
https_proxy = http://172.16.0.1:3128/
http_proxy = http://172.16.0.1:3128/
ftp_proxy = http://172.16.0.1:3128/
# If you do not want to use proxy at all, set this to off.
use_proxy = on
```
## Variables d'environnement

Editer le fichier /etc/environment
```
sudo nano /etc/environment
```
Ajouter les lignes :
```
HTTP_PROXY="http://172.16.0.1:3128/";
HTTPS_PROXY="http://172.16.0.1:3128/";
FTP_PROXY="http://172.16.0.1:3128/";
```
## Configuration git

```
sudo apt install git
git config --global http.proxy http://172.16.0.1:3128
```

Si besoin, pour désactiver le proxy pour git :

```
git config --global --unset http.proxy
```

