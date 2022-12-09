const mysql = require('mysql');
const fs = require('fs')
const connect = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'library'
});

type Migration = { migration_id:number,migration_up: string, migration_isDo: number,migration_down:string }
connect.query("SELECT * FROM `migrations`", async function (error: string, results: Array<Migration>) {
    if (error) console.log(error);
    if(results) {
        const item = results[results.length-1]
        if (item.migration_isDo!==0){
        const res =await connect.query(fs.readFileSync('./'+item.migration_down,
             { encoding: 'utf8', flag: 'r' }),
              function (error: string, results: Array<Migration>) {
                if (error) console.log(error);
                return true
            });
            if(res)
            connect.query(`UPDATE migrations SET migration_isDo = 0 WHERE ${item.migration_id}`, function (error: string, results: Array<Migration>) {
                if (error) console.log(error);
            })}
    }

    connect.end();
})


export { }