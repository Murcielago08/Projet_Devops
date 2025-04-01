# TP Devops

## Description
Ce TP est une API simple qui renvoie les en-têtes de la requête au format JSON lorsqu'il y a une requête HTTP GET sur `/ping`. Le serveur écoute sur un port configurable via la variable d'environnement `PING_LISTEN_PORT` ou par défaut sur le port 3000.

## Prérequis
- Node.js
- npm (Gestionnaire de paquets Node)
- Docker (pour exécuter avec conteneurs)

## Installation
1. Clonez le dépôt :
   ```sh
   git clone <repository-url>
   cd <repository-directory>/Projet_Devops
   ```

2. Installez les dépendances :
   ```sh
   npm install
   ```

## Exécution du TP

### Avec Docker

1. Construisez l'image Docker :
   ```sh
   docker build -t tp-devops:latest -f single_stage.dockerfile .
   ```

2. Lancez un conteneur Docker :
   ```sh
   docker run -d -p 3000:5000 --name tp-devops tp-devops:latest
   ```

   - Le serveur sera accessible sur `http://localhost:3000`.
   - Si vous souhaitez utiliser un port différent, utilisez l'option `-p` pour mapper un autre port local au port 5000 du conteneur :
     ```sh
     docker run -d -p 4000:5000 --name tp-devops tp-devops:latest
     ```

3. Arrêtez et supprimez le conteneur :
   ```sh
   docker stop tp-devops
   docker rm tp-devops
   ```

### Vérification des vulnérabilités dans l'image Docker

1. Installez `docker scan` si ce n'est pas déjà fait (inclus dans Docker Desktop ou disponible via CLI).
2. Scannez l'image Docker pour détecter les vulnérabilités :
   ```sh
   docker scan tp-devops:latest
   ```

   Cela affichera un rapport des vulnérabilités connues dans l'image.

3. Pour un scan plus détaillé, vous pouvez utiliser des outils comme [Trivy](https://github.com/aquasecurity/trivy) :
   ```sh
   trivy image tp-devops:latest
   ```

   ou

   ```sh
   trivy image --scanners vuln tp-devops:latest
   ```

   Installez Trivy si nécessaire en suivant les instructions sur leur site officiel.

### Sans Docker
1. Définissez la variable d'environnement `PING_LISTEN_PORT` (optionnel) :
   ```sh
   export PING_LISTEN_PORT=4000
   ```

2. Démarrez le serveur :
   ```sh
   npm start
   ```

3. Le serveur sera en cours d'exécution sur `http://localhost:3000` (ou le port que vous avez configuré).

## Points de terminaison de l'API
- `GET /ping` : Renvoie les en-têtes de la requête au format JSON.
- Toute autre requête renverra un code de statut 404.

```sh
curl -X GET http://localhost:3000/ping
```
ou directement sur le lien

*commande test perso :*
```sh
npm install axios
```

```sh
node test.js
```

# code_rust

## Configuration du TP

1. Assurez-vous d'avoir installé [Rust](https://www.rust-lang.org/tools/install).
2. Assurez-vous d'avoir installé [Visual Studio Build Tools](https://visualstudio.microsoft.com/visual-cpp-build-tools/) avec la charge de travail "Développement desktop avec C++".

## Exécution du TP

1. Naviguez vers le répertoire du TP :
    ```sh
    cd <repository-directory>/code_rust
    ```

2. **Assurez-vous que le serveur est en cours d'exécution** sur `http://localhost:3000`.

3. Compilez et exécutez le TP en utilisant Cargo :
    ```sh
    cargo run
    ```

Cela compilera et exécutera le TP Rust, en exécutant la fonction principale définie dans `src/main.rs`.