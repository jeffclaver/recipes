const express = require('express');
const router = express.Router();
const db = require('../database/db');


router.post('/', (req, res) => {
    const { titulo, texto_receita } = req.body;
    const sql = `INSERT INTO receitas (titulo, texto_receita) VALUES (?, ?)`;

    db.query(sql, [titulo, texto_receita], (error, results, fields) => {
        if (error) {
            res.status(500).json({ error: 'Erro ao inserir receita no banco de dados.' });
            return;
        }
        res.status(200).json({ message: 'Receita inserida com sucesso!' });
    });
});

router.get('/', (req, res) => {
    const sql = `SELECT * FROM receitas`;

    db.query(sql, (error, results, fields) => {
        if (error) {
            res.status(500).json({ error: 'Erro ao buscar receitas no banco de dados.' });
            return;
        }
        res.status(200).json(results);
    });
});

module.exports = router;
