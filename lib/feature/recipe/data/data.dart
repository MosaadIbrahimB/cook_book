

import 'package:cook_book/core/utils/app_image_path.dart';
import 'package:cook_book/core/database/model/recipe_model.dart';

class DataModel{
  List<String> categories = ['Appetizers', 'Main Courses', 'Desserts'];


  List<RecipeModel> recipes = [
     RecipeModel(
      nameRecipe: "Vegetable Samosa",
      prepTime: 20,
      cookTime: 15,
      ingredients: ["Samosa dough", "Mixed vegetables", "Oil", "Salt", "Pepper"],
      instructions: "Roll the dough, place the filling in the center, and fry until golden.",
      category: "Appetizers",
      isFavorite: 0,
      image: AppImagePath.f1
    ),
    // const RecipeModel(
    //   recipeName: "Hummus with Tahini",
    //   prepTime: 10,
    //   cookTime: 20,
    //   ingredients: ["Boiled chickpeas", "Tahini", "Olive oil", "Lemon", "Salt"],
    //   instructions: "Mix the chickpeas with tahini, add olive oil, lemon, and salt, then serve with bread.",
    //   category: "Appetizers",
    //   isFavorite: false,
    //     image: AppImagePath.f2
    //
    // ),
    // const RecipeModel(
    //   recipeName: "Lebanese Fattoush",
    //   prepTime: 15,
    //   cookTime: 5,
    //   ingredients: ["Lettuce", "Tomatoes", "Cucumber", "Fried bread", "Pomegranate molasses", "Olive oil", "Salt", "Pepper"],
    //   instructions: "Mix the vegetables with the fried bread and add pomegranate molasses and olive oil.",
    //   category: "Appetizers",
    //   isFavorite: false,
    //     image: AppImagePath.f3
    //
    // ),
    // const RecipeModel(
    //   recipeName: "Chicken Kabsa",
    //   prepTime: 30,
    //   cookTime: 60,
    //   ingredients: ["Chicken", "Rice", "Onion", "Tomatoes", "Kabsa spices", "Oil", "Salt"],
    //   instructions: "Fry the chicken, then add rice, tomatoes, spices, and water, and cook together.",
    //   category: "Main Courses",
    //   isFavorite: false,
    //     image: AppImagePath.mainFood
    //
    // ),
    // const RecipeModel(
    //   recipeName: "Mloukhieh with Rabbit",
    //   prepTime: 15,
    //   cookTime: 45,
    //   ingredients: ["Mloukhieh leaves", "Rabbit meat", "Garlic", "Chicken broth", "Oil", "Salt"],
    //   instructions: "Fry the rabbit with garlic, then add the Mloukhieh and broth, and cook until tender.",
    //   category: "Main Courses",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Grilled Steak with Mashed Potatoes",
    //   prepTime: 15,
    //   cookTime: 25,
    //   ingredients: ["Steak", "Potatoes", "Butter", "Salt", "Pepper", "Oil"],
    //   instructions: "Grill the steak, then serve it with mashed potatoes.",
    //   category: "Main Courses",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Spaghetti Bolognese",
    //   prepTime: 15,
    //   cookTime: 30,
    //   ingredients: ["Spaghetti", "Ground beef", "Tomatoes", "Onion", "Oil", "Garlic", "Spices"],
    //   instructions: "Fry the meat with onion and garlic, then add tomatoes and spices, and cook the pasta.",
    //   category: "Main Courses",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Kunafa with Cream",
    //   prepTime: 20,
    //   cookTime: 30,
    //   ingredients: ["Kunafa dough", "Cream", "Butter", "Sugar syrup", "Pistachios"],
    //   instructions: "Spread the Kunafa dough in the pan, add the cream, bake it, then serve with sugar syrup and pistachios.",
    //   category: "Desserts",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Vanilla Ice Cream with Chocolate",
    //   prepTime: 10,
    //   cookTime: 0,
    //   ingredients: ["Cream", "Milk", "Vanilla", "Chocolate"],
    //   instructions: "Mix the milk, cream, and vanilla, then freeze and serve with chocolate.",
    //   category: "Desserts",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Rice Pudding with Fruits",
    //   prepTime: 10,
    //   cookTime: 15,
    //   ingredients: ["Milk", "Sugar", "Cornstarch", "Mixed fruits"],
    //   instructions: "Mix the milk with sugar and cornstarch, cook until thick, then serve with fruits.",
    //   category: "Desserts",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Falafel",
    //   prepTime: 15,
    //   cookTime: 20,
    //   ingredients: ["Chickpeas", "Onions", "Garlic", "Parsley", "Coriander", "Spices", "Flour"],
    //   instructions: "Mix all ingredients into a dough, form into balls, and fry.",
    //   category: "Appetizers",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Eggplant Parmesan",
    //   prepTime: 25,
    //   cookTime: 40,
    //   ingredients: ["Eggplant", "Tomato sauce", "Mozzarella cheese", "Parmesan cheese", "Breadcrumbs", "Spices"],
    //   instructions: "Layer the eggplant with sauce and cheese, then bake until golden.",
    //   category: "Main Courses",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Chicken Shawarma",
    //   prepTime: 20,
    //   cookTime: 30,
    //   ingredients: ["Chicken", "Garlic", "Yogurt", "Spices", "Lemon", "Tahini", "Pita bread"],
    //   instructions: "Marinate the chicken in yogurt and spices, then grill and serve with tahini and pita bread.",
    //   category: "Main Courses",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Baklava",
    //   prepTime: 30,
    //   cookTime: 40,
    //   ingredients: ["Filo pastry", "Walnuts", "Butter", "Sugar", "Honey"],
    //   instructions: "Layer filo pastry with chopped nuts, bake, and drizzle with honey syrup.",
    //   category: "Desserts",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Lentil Soup",
    //   prepTime: 10,
    //   cookTime: 30,
    //   ingredients: ["Lentils", "Onions", "Tomatoes", "Garlic", "Cumin", "Oil", "Salt"],
    //   instructions: "Cook lentils with onions, garlic, and spices until tender, then blend and serve.",
    //   category: "Appetizers",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Stuffed Grape Leaves",
    //   prepTime: 25,
    //   cookTime: 40,
    //   ingredients: ["Grape leaves", "Rice", "Ground meat", "Onions", "Spices", "Lemon"],
    //   instructions: "Stuff the grape leaves with rice and meat mixture, roll them up, and cook in lemon broth.",
    //   category: "Appetizers",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Chicken Fried Rice",
    //   prepTime: 10,
    //   cookTime: 20,
    //   ingredients: ["Chicken", "Rice", "Carrots", "Peas", "Soy sauce", "Eggs", "Garlic"],
    //   instructions: "Fry chicken with garlic, add rice, vegetables, and soy sauce, then scramble the eggs into the mixture.",
    //   category: "Main Courses",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Chocolate Mousse",
    //   prepTime: 15,
    //   cookTime: 0,
    //   ingredients: ["Dark chocolate", "Cream", "Eggs", "Sugar"],
    //   instructions: "Melt chocolate, whip the cream, and combine with egg yolks and sugar. Chill before serving.",
    //   category: "Desserts",
    //   isFavorite: false,
    // ),
    // const RecipeModel(
    //   recipeName: "Vegetarian Pizza",
    //   prepTime: 15,
    //   cookTime: 25,
    //   ingredients: ["Pizza dough", "Tomato sauce", "Mozzarella cheese", "Vegetables", "Olives", "Oregano"],
    //   instructions: "Spread sauce on the dough, top with cheese and vegetables, then bake.",
    //   category: "Main Courses",
    //   isFavorite: false,
    // ),
  ];

}