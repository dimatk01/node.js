const express = require('express')
const app = express()
const port = 3000
let counter = 0;

app.get('/hello', (req, res) => {
  res.send(` <div><center>Кількість відвідувань сторінки - ${++counter}</center></div>`)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})