-- ==========================================
-- Mock data inserts for Week 2 Prep Exercise
-- ==========================================

-- 1. Cuisines
INSERT INTO cuisines (name) VALUES
('Japanese')
ON CONFLICT (name) DO NOTHING;

-- 2. Main ingredients
INSERT INTO main_ingredients (name) VALUES
('Cheese'),
('Vegetables'),
('Pasta'),
('Eggs')
ON CONFLICT (name) DO NOTHING;

-- 3. Categories
INSERT INTO categories (name) VALUES
('Cake'),
('No-Bake'),
('Vegetarian'),
('Vegan'),
('Gluten-Free'),
('Japanese')
ON CONFLICT (name) DO NOTHING;

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
('Soy sauce'),
('Sugar')
ON CONFLICT (name) DO NOTHING;

-- 5. Recipes
INSERT INTO recipes (name, cuisine_id, main_ingredient_id) VALUES
('No-Bake Cheesecake', NULL, 1),
('Roasted Brussels Sprouts', NULL, 2),
('Mac & Cheese', NULL, 3),
('Tamagoyaki Japanese Omelette', 1, 4)
ON CONFLICT DO NOTHING;

-- 6. Recipe ↔ Categories
INSERT INTO recipe_categories (recipe_id, category_id) VALUES
(1, 1), (1, 2), (1, 3),
(2, 4), (2, 5),
(3, 3),
(4, 3), (4, 6)
ON CONFLICT DO NOTHING;

-- 7. Recipe ↔ Ingredients
INSERT INTO recipe_ingredients (recipe_id, ingredient_id, amount) VALUES
-- No-Bake Cheesecake
(1, 5, '200 ml'),
(1, 6, '250 g'),
(1, 7, '1 tbsp'),
(1, 8, '1 crust'),
(1, 9, '2 tbsp'),
-- Roasted Brussels Sprouts
(2, 10, '500 g'),
(2, 7, '1 tbsp'),
(2, 11, '1 tsp'),
(2, 12, '1 tsp'),
(2, 13, '1 tsp'),
(2, 14, '2 tbsp'),
-- Mac & Cheese
(3, 15, '200 g'),
(3, 16, '50 g'),
(3, 17, '2 tbsp'),
(3, 13, '1 tsp'),
(3, 12, '1 tsp'),
(3, 18, '200 ml'),
(3, 19, '150 g'),
-- Tamagoyaki Japanese Omelette
(4, 4, '4'),
(4, 20, '1 tbsp'),
(4, 21, '1 tsp'),
(4, 13, '1 tsp'),
(4, 14, '1 tbsp')
ON CONFLICT DO NOTHING;