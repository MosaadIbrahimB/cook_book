import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/home/presentation/cubit/home__state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/database/data_base.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  deleteItem(int id) async {
    await DatabaseHelper().deleteRecipe(id);
  }

  Future<void> getRecipe() async {
    emit(HomeLoading());
    try {
      List<RecipeModel> recipeList = await DatabaseHelper().getRecipes();
      emit(HomeSucceed(recipeList));
    } catch (e) {
      print(e);
    }
  }


  Future<void> getRecipeByCategory(String category) async {
    emit(HomeLoading());
    try {
      List<RecipeModel> recipeList = await DatabaseHelper().getRecipesByCategory(category);
      emit(HomeSucceed(recipeList));
    } catch (e) {
      print(e);
    }
  }

  Future<void> searchByNameRecipe(String nameRecipe) async {
    emit(HomeLoading());
    try {
      List<RecipeModel> recipeList = await DatabaseHelper().searchByNameRecipe(nameRecipe);
      emit(HomeSucceed(recipeList));
    } catch (e) {
      print(e);
    }
  }

  updateRecipe(RecipeModel recipe)async{
   await DatabaseHelper().updateRecipe(recipe);
  }


}
