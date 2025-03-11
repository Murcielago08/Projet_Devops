# Projet Devops

## Description
This project is a simple API that returns the headers of the request in JSON format when there is an HTTP GET request on `/ping`. The server listens on a configurable port via the environment variable `PING_LISTEN_PORT` or defaults to port 3000.

## Prerequisites
- Node.js
- npm (Node package manager)

## Installation
1. Clone the repository:
   ```sh
   git clone <repository-url>
   cd <repository-directory>
   ```

2. Install dependencies:
   ```sh
   npm install
   ```

## Running the Project
1. Set the environment variable `PING_LISTEN_PORT` (optional):
   ```sh
   export PING_LISTEN_PORT=4000
   ```

2. Start the server:
   ```sh
   npm start
   ```

3. The server will be running on `http://localhost:3000` (or the port you configured).

## API Endpoints
- `GET /ping`: Returns the headers of the request in JSON format.
- Any other request will return a 404 status code.


curl -X GET http://localhost:3000/ping

npm install axios

node test.js