const mysql = require('mysql');

class Database{
    constructor(){
        this.connection = mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: 'Jeff!123@',
            database: 'foods'
        });

        this.connection.connect((err) =>{
            if(err){
                console.error('Error to connect in database', err);
                return;
            }
            console.log('Connect to database sucessfully');
        });
    }
    query(sql, values) {
        return new Promise((resolve, reject) => {
            this.connection.query(sql, values, (err, results) => {
                if (err) {
                    reject(err);
                    return;
                }
                resolve(results);
            });
        });
    }

    close() {
        this.connection.end();
    }
}

module.exports = Database;