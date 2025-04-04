import express from 'express';

const app = express();
const port = process.env.PING_LISTEN_PORT || 3000;

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.get('/ping', (req, res) => {
  res.json(req.headers);
});

// Retourne 404 pour toute autre requête
app.use((req, res) => {
  res.status(404).send();
});

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});