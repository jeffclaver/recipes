const express = require('express');
const routes = require('./src/presentation/routes');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

app.use('/api', routes);

app.listen(PORT, ()=>{
    console.log(`Server is running on port ${PORT}`)
});