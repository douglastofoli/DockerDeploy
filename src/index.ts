import express, { Request, Response } from 'express';

const PORT = 3000;
const HOST = '0.0.0.0';

const app = express();

app.get('/', (request: Request, response: Response) => {
  response.send('Hello world');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
