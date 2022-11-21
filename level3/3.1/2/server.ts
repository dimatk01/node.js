import {Response,Request} from 'express'
const express = require( "express" );
const bodyParser = require('body-parser');

const app = express()
const port = 3000
app.use('/', express.static('static'))
enum Button{
  add="add",
  remove ="remove"
}

app.use(bodyParser.urlencoded({ extended: false }))


app.use(bodyParser.json())
let countOfAdd = 0;
let countOfRemove=0;
app.post('/', (req:Request, res:Response) => {
    const body = req.body
    console.log(body);
    
    if(body.button===Button.add)
    res.send({count:++countOfAdd})
 else  res.send({count:++countOfRemove})
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})