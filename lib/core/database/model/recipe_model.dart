import 'dart:convert';

class RecipeModel {
  int? id;
  String nameRecipe;
  String? image;
  int? prepTime;
  int? cookTime;
  List<String>? ingredients;
  String? instructions;
  String category;
  int? isFavorite;

  RecipeModel(
      {this.id,
      required this.nameRecipe,
      this.image,
      this.prepTime,
      this.cookTime,
      this.ingredients,
      this.instructions,
      required this.category,
      this.isFavorite = 0});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json["id"],
      nameRecipe: json["nameRecipe"],
      image: json["image"],
      prepTime: json["prepTime"],
      cookTime: json["cookTime"],
      ingredients: json["ingredients"] != null
          ? List<String>.from(jsonDecode(json["ingredients"]))
          : null,
      instructions: json["instructions"],
      category: json["category"],
      isFavorite: json["isFavorite"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nameRecipe": nameRecipe,
      "image": image,
      "prepTime": prepTime,
      "cookTime": cookTime,
      "ingredients": ingredients != null ? jsonEncode(ingredients) : null,
      "instructions": instructions,
      "category": category,
      "isFavorite": isFavorite,
    };
  }
}
