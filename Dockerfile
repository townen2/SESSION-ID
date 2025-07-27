# Utilise une version stable de Debian
FROM node:lts-bullseye

# Mise à jour et installation minimale des dépendances système
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg imagemagick webp && \
    rm -rf /var/lib/apt/lists/*

# Définir le répertoire de travail
WORKDIR /usr/src/app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances Node.js du projet
RUN npm install

# Installer les packages globaux
RUN npm install -g qrcode-terminal pm2

# Copier le reste de l'application
COPY . .

# Exposer le port utilisé par l'application
EXPOSE 8000

# Lancer l'application
CMD ["npm", "start"]
