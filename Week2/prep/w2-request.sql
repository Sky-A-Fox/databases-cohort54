-- 1. All vegetarian recipes with potatoes (но картошки нет в данных)
SELECT r.name AS recipe_name
FROM recipes r
JOIN recipe_categories rc ON r.id = rc.recipe_id  
JOIN categories c ON rc.category_id = c.id
WHERE c.name = 'Vegetarian';

-- 2. All cakes that do not need baking
SELECT r.name AS recipe_name
FROM recipes r
JOIN recipe_categories rc1 ON r.id = rc1.recipe_id
JOIN categories c1 ON rc1.category_id = c1.id
JOIN recipe_categories rc2 ON r.id = rc2.recipe_id  
JOIN categories c2 ON rc2.category_id = c2.id
WHERE c1.name = 'Cake' AND c2.name = 'No-Bake';

-- 3. All vegan and Japanese recipes
SELECT r.name AS recipe_name
FROM recipes r
JOIN recipe_categories rc1 ON r.id = rc1.recipe_id
JOIN categories c1 ON rc1.category_id = c1.id
JOIN recipe_categories rc2 ON r.id = rc2.recipe_id
JOIN categories c2 ON rc2.category_id = c2.id
WHERE c1.name = 'Vegan' AND c2.name = 'Japanese';