class RecipeUsecase {
    constructor(repository) {
        this.repository = repository;
    }
    async create(recipeData){
        const newRecipeId = await this.repository.create(recipeData);
        return newRecipeId;
    }

    async getAll(){
        return this.repository.getAll();
    }
}

module.exports = RecipeUsecase;