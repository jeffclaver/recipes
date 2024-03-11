const express = require('express');
const router = express.Router();
const multer = require('multer');
const path = require('path');
const RecipeController = require('./recipeController');
const RecipeUsecase = require('../application/recipeUsecase');
const RecipeRepository = require('../infrastructure/recipeRepository');

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, 'D:/estudos/frontend/recipes/assets/uploads/');
    },
    filename: function (req, file, cb) {
        cb(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname));
    }
});

const upload = multer({ storage: storage });

const repository = new RecipeRepository();
const usecase = new RecipeUsecase(repository);
const controller = new RecipeController(usecase);

router.post('/recipe', upload.single('imagePath'), (req, res) => controller.create(req, res));
router.get('/recipe', (req, res) => controller.getAll(req, res));

module.exports = router;
