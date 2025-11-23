-- Очищаем существующие таблицы (для повторного запуска) -- Drop existing tables (for re-running the script)
DROP TABLE IF EXISTS cuisines CASCADE;
DROP TABLE IF EXISTS main_ingredients CASCADE;
DROP TABLE IF EXISTS ingredients CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS cooking_methods CASCADE;
DROP TABLE IF EXISTS recipes CASCADE;
DROP TABLE IF EXISTS recipe_categories CASCADE;
DROP TABLE IF EXISTS recipe_ingredients CASCADE;
DROP TABLE IF EXISTS recipe_methods CASCADE;
DROP TABLE IF EXISTS recipe_ingredient_amounts CASCADE;



---------------------------------------------------------
-- 1. Таблица кухонь (Italian, Chinese, Japanese…) -- Table of Cuisines (Italian, Chinese, Japanese…)
---------------------------------------------------------
CREATE TABLE cuisines (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

---------------------------------------------------------
-- 2. Таблица основных ингредиентов (мясо, рыба, овощи) -- Table of Main Ingredients (meat, fish, vegetables)
---------------------------------------------------------
CREATE TABLE main_ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
);

---------------------------------------------------------
-- 3. Таблица всех возможных ингредиентов (морковь, масло, соль) -- Table of All Possible Ingredients (carrot, oil, salt)
---------------------------------------------------------
CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE
);

---------------------------------------------------------
-- 4. Таблица категорий (суп, салат, десерт, завтрак) -- Table of Categories (soup, salad, dessert, breakfast)
---------------------------------------------------------
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

---------------------------------------------------------
-- 5. Таблица методов приготовления (жарка, запекание, варка) -- Table of Cooking Methods (frying, baking, boiling)
---------------------------------------------------------
CREATE TABLE cooking_methods (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

---------------------------------------------------------
-- 6. Главная таблица рецептов -- Main Recipes Table
---------------------------------------------------------
CREATE TABLE recipes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    cuisine_id INT,
    main_ingredient_id INT,
    FOREIGN KEY (cuisine_id) REFERENCES cuisines(id),
    FOREIGN KEY (main_ingredient_id) REFERENCES main_ingredients(id)
);

---------------------------------------------------------
-- 7. Связь рецепт ↔ категории (many-to-many) -- Recipe ↔ Categories Relationship (many-to-many)
---------------------------------------------------------
CREATE TABLE recipe_categories (
    recipe_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (recipe_id, category_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

---------------------------------------------------------
-- 8. Связь рецепт ↔ ингредиенты (many-to-many) -- Recipe ↔ Ingredients Relationship (many-to-many)
---------------------------------------------------------
CREATE TABLE recipe_ingredients (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    amount VARCHAR(50),  -- например "200 г", "1 ст.л."
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);

---------------------------------------------------------
-- 9. Связь рецепт ↔ методы приготовления (many-to-many) -- Recipe ↔ Cooking Methods Relationship (many-to-many)
---------------------------------------------------------
CREATE TABLE recipe_methods (
    recipe_id INT NOT NULL,
    method_id INT NOT NULL,
    PRIMARY KEY (recipe_id, method_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (method_id) REFERENCES cooking_methods(id)
);

---------------------------------------------------------
-- 10. кол-во ингредиентов в рецепте -- Quantity of Ingredients in Recipe
---------------------------------------------------------
CREATE TABLE recipe_ingredient_amounts (
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    amount VARCHAR(50) NOT NULL,  -- например "200 г", "1 ст.л."
    PRIMARY KEY (recipe_id, ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES recipes(id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
);  