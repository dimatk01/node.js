import mysqldump from 'mysqldump';
import path = require('path');

module.exports = {dump: async function() {
    await mysqldump({
        connection: {
            host: 'localhost',
            user: 'root',
            password: 'root',
            database: 'library',
        },
        dumpToFile:path.join(__dirname+`/backup/${new Date().toLocaleDateString()}.sql`),
    });
}}