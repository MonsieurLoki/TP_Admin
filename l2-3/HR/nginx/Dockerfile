# Utilisation de l'image NGINX officielle
FROM nginx:latest



RUN apt update
RUN apt upgrade -y

RUN apt install -y nano net-tools iputils-ping curl iproute2 htop vim lynx certbot python3-certbot-nginx

# Création d'un répertoire pour stocker les fichiers HTML du site web
# RUN mkdir -p /var/www/html/www

# Copier le fichier de configuration personnalisé dans le conteneur
# COPY nginx.conf /etc/nginx/nginx.conf

# Définir la page d'accueil personnalisée
# COPY index.html /var/www/html/www/

# Exposer le port 80
EXPOSE 80

# Commande par défaut pour démarrer NGINX
# CMD ["nginx", "-g", "daemon off;"]





