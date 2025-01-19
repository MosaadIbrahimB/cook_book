


import '../../../../core/database/model/recipe_model.dart';

class HomeState {}

class HomeInitialState extends HomeState {}
class HomeSucceedState extends HomeState {
  List<RecipeModel> recipeList;

  HomeSucceedState({required this.recipeList});
}

