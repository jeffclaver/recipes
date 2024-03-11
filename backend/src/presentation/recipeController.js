const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

class RecipeController {
    constructor(usecase) {
        this.usecase = usecase;
        this.create = this.create.bind(this);
    }

    async create(req, res) {
        try {
            const { title, prepTime, difficulty, serving, introPlate, ingredients, steps } = req.body;
            upload.single('imagePath')(req, res, async () => {
                const imagePath = req.file ? req.file.filename : null;
                const recipeData = {
                    title,
                    prepTime,
                    difficulty,
                    serving,
                    introPlate,
                    ingredients,
                    steps,
                    imagePath: imagePath
                };
                const newRecipeId = await this.usecase.create(recipeData);

                res.status(201).json({ message: 'Recipe created successfully', recipeId: newRecipeId });

            });
        }
        catch (err) {
            res.status(500).json({ error: err.message });
        }
    }

    async getAll(req, res) {
        try {
            const recipes = await this.usecase.getAll();
            res.status(200).json({ recipes });
        }
        catch (err) {
            res.status(500).json({ error: err.message });
        }
    }
}

module.exports = RecipeController;
