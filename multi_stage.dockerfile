# Étape 1 : Build
FROM node:18-slim AS builder

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

# Debug: Lister les fichiers dans le répertoire app
RUN echo "Contents of /app:" && ls -l /app

# Debug: Lister les fichiers dans le répertoire dist
RUN echo "Contents of /app/dist:" && ls -l /app/dist

# Étape 2 : Exécution
FROM node:18-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier uniquement les fichiers compilés depuis l'étape de build
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules

# Création d'un utilisateur spécifique pour exécuter le serveur
RUN groupadd -r appgroup && useradd -r -g appgroup appuser && \
    chown -R appuser:appgroup /app

# Passer à l'utilisateur non-root
USER appuser

# Exposer le port de l'application
EXPOSE 5000

# Commande par défaut pour démarrer l'application
CMD ["node", "dist/app.js"]