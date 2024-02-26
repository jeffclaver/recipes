const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Jeff!123@',
    database: 'recipes'
});

connection.connect((err) => {
    if (err) {
        console.error('Erro ao conectar ao banco de dados:', err);
        return;
    }
    console.log('Conexão estabelecida com o banco de dados MySQL!');
});

module.exports = connection;
