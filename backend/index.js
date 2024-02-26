const express = require('express');
const bodyParser = require('body-parser');
const db = require ('./src/database/db');
const recipeController = require('./src/controllers/recipeController');

const app = express();
const port = 3000;

app.use(bodyParser.json());

app.use('/api/receitas', recipeController);

app.listen(port, () => {
    console.log(`Servidor escutando na porta ${port}`);
});
