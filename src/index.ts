import express from 'express';

const app = express();
const port = process.env.PING_LISTEN_PORT || 3000;

app.get('/ping', (req, res) => {
  res.json(req.headers);
});

app.use((req, res) => {
  res.sendStatus(404);
});

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});
