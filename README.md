# TP Devops

## Description
Ce TP est une API simple qui renvoie les en-têtes de la requête au format JSON lorsqu'il y a une requête HTTP GET sur `/ping`. Le serveur écoute sur un port configurable via la variable d'environnement `PING_LISTEN_PORT` ou par défaut sur le port 3000.

## Prérequis
- Node.js
- npm (Gestionnaire de paquets Node)

## Installation
1. Clonez le dépôt :
   ```sh
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Installez les dépendances :
   ```sh
   npm install
   ```

## Exécution du TP
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