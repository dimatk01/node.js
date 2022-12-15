const mysql = require('mysql');
const fs = require('fs')
const path= require('path')
const connect= mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library',
    multipleStatements:true
});
type Migration = { migration_id:number,migration_up: string, migration_isDo: number,migration_down:string }
connect.query("SELECT * FROM `migrations`", async function (error: string, results: Array<Migration>) {
    if (error) console.log(error);
    await results.map(async item => {
        if (item.migration_isDo!==1){
            const res =await connect.query(fs.readFileSync(path.join(__dirname,item.migration_up),
             { encoding: 'utf8', flag: 'r' }),
              function (error: string, results: Array<Migration>) {
                if (error){ console.log(error);
                return false}
                return true;
            });
            if(res){
           await connect.query(`UPDATE migrations SET migration_isDo = 1 WHERE ${item.migration_id}`, function (error: string, results: Array<Migration>) {
                if (error) console.log(error);
              
            })}}
    })
    connect.end()
   
})


export { }