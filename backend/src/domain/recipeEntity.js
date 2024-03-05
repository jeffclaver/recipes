class Recipe{
    constructor(id, title, prepTime, difficulty, serving, introPlate, ingredients, steps, imagePath) {
        this.id = id;
        this.title = title;
        this.prepTime = prepTime;
        this.difficulty = difficulty;
        this.serving = serving;
        this.introPlate = introPlate;
        this.ingredients = ingredients;
        this.steps = steps;
        this.imagePath = imagePath;
    }
}

module.exports = Recipe;