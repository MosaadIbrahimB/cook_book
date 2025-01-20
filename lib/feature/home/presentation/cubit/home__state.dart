
import 'package:cook_book/core/database/model/recipe_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSucceed extends HomeState {
  final List<RecipeModel> recipeModel;

  HomeSucceed(this.recipeModel);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
