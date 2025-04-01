# Utilisation d'une image de base légère
FROM node:18-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier uniquement le fichier package.json et package-lock.json pour installer les dépendances Node.js
COPY package.json package-lock.json ./

# Installer les dépendances Node.js
RUN npm install

# Copier le reste du code source
COPY . .

# Compiler le code TypeScript en JavaScript
RUN npm run build || (echo "Build failed. Logs:" && cat /app/tsconfig.json && exit 1)

# Création d'un utilisateur spécifique pour exécuter le serveur
RUN groupadd -r appgroup && useradd -r -g appgroup appuser && \
    chown -R appuser:appgroup /app

# Passer à l'utilisateur non-root
USER appuser

# Exposer le port de l'application
EXPOSE 5000

# Commande par défaut pour démarrer l'application
CMD ["node", "app.js"]