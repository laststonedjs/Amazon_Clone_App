const express = require('express');
const PORT = 3000;

const app = express();

app.get('/', (req, res) => {
  res.json({ name: 'Filip' });
})

app.get('/green-bank', (req, res) => {
  res.send('green bank!');
});


app.listen(PORT, "0.0.0.0", () => {
  console.log(`Connected at PORT ${PORT}`);
});