QUESTIONS
1 - Was your database already in 2NF / 3 NF?
2 - What changes did you have to do to normalize your database?


ANSWERS
1 - 2NF is observed: In tables with composite keys (recipe_ingredients, recipe_categories), all non-key fields depend on the entire primary key.
3NF is observed: There are no transitive dependencies. All fields in the tables depend only on the primary key, not on other non-key fields.


2.1 In theory: I could remove repeting for next tables

=> *main_ingredients*
=> *ingredients*

In practice: The original idea was for thousands of recipes, and the ingredients table would list every single ingredient, right down to sugar, pepper, and vanilla sugar for baking.
But in the main ingredient table, only ingredients essential for certain dishes are listed. For example, you can't make scrambled eggs without eggs, or barbecue without meat.


2.2 In theory: Remove the redundant table

=> *recipe_ingredient_amounts*

In practice: The original idea was for thousands of recipes, and the ingredients table would list every single ingredient, right down to sugar, pepper, and vanilla sugar for baking.
But in the main ingredient table, only ingredients essential for certain dishes are listed. For example, you can't make scrambled eggs without eggs, or barbecue without meat.

2.3 In theory: add table.

=> *cooking steps*

In practice: Adding this table is purely a matter of adjusting the tables to the mock data provided. I find sorting them by cooking steps in a real recipe book strange.



EXTRA: FUTURE PROBLEMS
If you want to add thousands of recipes to your database, what challenges do you foresee?

 => JOIN Query Performance
- Queries with multiple JOINs (e.g., searching for vegan Japanese recipes) will slow down.
- Each JOIN between recipes, recipe_categories, and categories requires a full table scan.

=> Backup and recovery:
- Complex network connections complicate partial data recovery.
- Full database backup time increases.

=> Transaction Management:
- Adding a single recipe requires inserting into 3+ tables.
- Requires transactions to ensure data integrity.

=> Indexing Requirements:
- Without indexes, searching for a recipe by name will scan the entire recipes table.
- Create indexes on frequently accessed fields: recipes(name), recipe_categories(category_id).
- Indexes will speed up searches but will slow down adding new recipes.