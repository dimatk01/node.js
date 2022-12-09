import express, { Express, NextFunction } from 'express';
const app: Express = express()
const port: number = 3000
const backup = require('./cronFiles/backup.js')
const softDelete = require('./cronFiles/softDelete.js')
const router = require('./routers/router.js')
var cors = require('cors')
const fileUpload = require('express-fileupload')
const cron = require('node-cron');
cron.schedule('00 00 * * *', async () => {
    backup.dump()
    softDelete()
});

app.use(fileUpload());
app.use(cors({
    origin: true,
    credentials: true
}))
app.set('view engine', 'ejs')

app.use((express.static(`${__dirname}/views`)))
app.use(router)


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)

})