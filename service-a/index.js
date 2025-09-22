const express = require('express');
const app = express();
const port = 3001;


app.get('/api/service-a', (req, res) => {
res.json({ service: 'A', ts: new Date().toISOString() });
});


app.listen(port, () => console.log(`service-a listening on ${port}`));
