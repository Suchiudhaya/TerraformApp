const express = require('express');
const app = express();
const port = 3002;

app.get('/api/service-b', (req, res) => {
  res.json({ service: 'B', ts: new Date().toISOString() });
});

app.listen(port, () => console.log(`service-b listening on ${port}`));