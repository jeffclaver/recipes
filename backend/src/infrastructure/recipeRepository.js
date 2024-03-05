const Database = require('./database');

class RecipeRepository{
    constructor(){
        this.database = new Database();
    }

    async create(recipeData){
        const { title, prepTime, difficulty, serving, introPlate, ingredients, steps, imagePath } = recipeData;
        const query = 'INSERT INTO recipes (title, prepTime, difficulty, serving, introPlate, ingredients, steps, imagePath) VALUES (?, ?, ?, ?, ?, ?, ?, ?)';
        const values = [title, prepTime, difficulty, serving, introPlate, ingredients, steps, imagePath];
        const result = await this.database.query(query, values);
        return result.insertId;
    }

    async getAll(){
        const query = 'SELECT * FROM recipes';
        const recipes = await this.database.query(query);
        return recipes;
    }
}

module.exports = RecipeRepository;