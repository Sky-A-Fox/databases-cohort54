
-- I will use MOCK data so we made id manually for clarity.

-- 1. Cuisines (только японская встречается явно) -- Cuisines (only Japanese is explicitly mentioned)
INSERT INTO cuisines (name) VALUES
('Japanese');

-- 2. Main ingredients (по твоим рецептам выделим примерные) -- Main ingredients (based on your recipes, approximate)
INSERT INTO main_ingredients (name) VALUES
('Cheese'),
('Vegetables'),
('Pasta'),
('Eggs');

-- 3. Categories
INSERT INTO categories (name) VALUES
('Cake'),
('No-Bake'),
('Vegetarian'),
('Vegan'),
('Gluten-Free'),
('Japanese');

-- 4. Ingredients
INSERT INTO ingredients (name) VALUES
('Cheese'),
('Vegetables'),
('Pasta'),
('Eggs'),
('Condensed milk'),
('Cream Cheese'),
('Lemon Juice'),
('Pie Crust'),
('Cherry Jam'),
('Brussels Sprouts'),
('Sesame seeds'),
('Pepper'),
('Salt'),
('Olive oil'),
('Macaroni'),
('Butter'),
('Flour'),
('Milk'),
('Shredded Cheddar cheese'),
('Eggs'),
('Soy sauce'),
('Sugar');

-- 5. Recipes
INSERT INTO recipes (name, cuisine_id, place_id, main_ingredient_id) VALUES
('No-Bake Cheesecake', NULL, NULL, 1),
('Roasted Brussels Sprouts', NULL, NULL, 2),
('Mac & Cheese', NULL, NULL, 3),
('Tamagoyaki Japanese Omelette', 1, NULL, 4);

-- 6. Recipe ↔ Categories
-- No-Bake Cheesecake
INSERT INTO recipe_categories (recipe_id, category_id) VALUES
(1, 1), -- Cake
(1, 2), -- No-Bake
(1, 3); -- Vegetarian

-- Roasted Brussels Sprouts
INSERT INTO recipe_categories (recipe_id, category_id) VALUES
(2, 4), -- Vegan
(2, 5); -- Gluten-Free

-- Mac & Cheese
INSERT INTO recipe_categories (recipe_id, category_id) VALUES
(3, 3); -- Vegetarian

-- Tamagoyaki Japanese Omelette
INSERT INTO recipe_categories (recipe_id, category_id) VALUES
(4, 3), -- Vegetarian
(4, 6); -- Japanese

-- 7. Recipe ↔ Ingredients
-- No-Bake Cheesecake
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, amount) VALUES
(1, 1, '200 ml'), -- Condensed milk
(1, 2, '250 g'), -- Cream Cheese
(1, 3, '1 tbsp'), -- Lemon Juice
(1, 4, '1 crust'), -- Pie Crust
(1, 5, '2 tbsp'); -- Cherry Jam

-- Roasted Brussels Sprouts
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, amount) VALUES
(2, 6, '500 g'), -- Brussels Sprouts
(2, 3, '1 tbsp'), -- Lemon Juice
(2, 7, '1 tsp'), -- Sesame seeds
(2, 8, '1 tsp'), -- Pepper
(2, 9, '1 tsp'), -- Salt
(2, 10, '2 tbsp'); -- Olive oil

-- Mac & Cheese
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, amount) VALUES
(3, 11, '200 g'), -- Macaroni
(3, 12, '50 g'), -- Butter
(3, 13, '2 tbsp'), -- Flour
(3, 9, '1 tsp'), -- Salt
(3, 8, '1 tsp'), -- Pepper
(3, 14, '200 ml'), -- Milk
(3, 15, '150 g'); -- Shredded Cheddar cheese

-- Tamagoyaki Japanese Omelette
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, amount) VALUES
(4, 16, '4'), -- Eggs
(4, 17, '1 tbsp'), -- Soy sauce
(4, 18, '1 tsp'), -- Sugar
(4, 9, '1 tsp'), -- Salt
(4, 10, '1 tbsp'); -- Olive oil
