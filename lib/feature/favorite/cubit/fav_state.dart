import 'package:cook_book/core/database/model/recipe_model.dart';

abstract class FavState {}

class FavInitialState extends FavState {}

class FavLoadingState extends FavState {}

class FavErrorState extends FavState {
  String messageError;

  FavErrorState({required this.messageError});
}

class FavSucceedState extends FavState {
  List<RecipeModel> recipeList;

  FavSucceedState({required this.recipeList});
}
