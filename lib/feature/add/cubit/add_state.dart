import 'package:cook_book/core/database/model/recipe_model.dart';

abstract class AddState {}

class RecipeInitial extends AddState {}

class RecipeUpdated extends AddState {
  final RecipeModel recipe;

  RecipeUpdated(this.recipe);
}

class RecipeSaving extends AddState {}

class RecipeSaved extends AddState {
  final RecipeModel recipe;

  RecipeSaved(this.recipe);
}

class RecipeError extends AddState {
  final String message;

  RecipeError(this.message);
}
