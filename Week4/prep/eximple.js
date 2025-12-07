// 1. Коллекция recipes (рецепты) --- collection recipes
db.recipes.insertOne({
  _id: ObjectId(),
  name: "Tamagoyaki Japanese Omelette",
  cuisine: "Japanese",
  main_ingredient: "Eggs",
  categories: ["Vegetarian", "Japanese"],
  cooking_methods: ["frying"],
  ingredients: [
    { name: "Eggs", amount: "4", unit: "pieces" },
    { name: "Soy sauce", amount: "1", unit: "tbsp" },
    { name: "Sugar", amount: "1", unit: "tsp" },
    { name: "Salt", amount: "1", unit: "tsp" },
    { name: "Olive oil", amount: "1", unit: "tbsp" }
  ],
  instructions: [
    "Beat eggs with soy sauce, sugar and salt",
    "Heat oil in pan",
    "Pour thin layer of egg mixture",
    "Roll and repeat"
  ]
});

// 2. Коллекция cuisines (кухни) --- collection cuisines
db.cuisines.insertOne({
  _id: ObjectId("japanese_cuisine"),
  name: "Japanese",
  description: "Traditional Japanese cuisine",  // additional info
  region: "Asia"                                // additional info
});

// 3. Коллекция ingredients (ингредиенты) --- collection ingredients
db.ingredients.insertMany([
  {
    _id: ObjectId("eggs_ingredient"),
    name: "Eggs",
    type: "protein",
    storage: "refrigerated"
  },
  {
    _id: ObjectId("soy_sauce_ingredient"),
    name: "Soy sauce", 
    type: "sauce",
    storage: "room_temperature"
  }
]);