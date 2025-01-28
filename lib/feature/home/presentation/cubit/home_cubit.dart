import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/home/presentation/cubit/home__state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/database/data_base.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);


  List<RecipeModel> recipes = [];


  Future<void> getRecipe() async {
    emit(HomeLoading());
    try {
      List<RecipeModel> recipes = await DatabaseHelper().getRecipes();
      emit(HomeSucceed(recipes));
    } catch (e) {
      print(e);
    }
  }


  updateRecipe(RecipeModel recipe)async{
    await DatabaseHelper().updateRecipe(recipe);
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





  Future<void> updateFavoriteStatus(RecipeModel recipe, int newFavoriteValue) async {
    try {
      // تحديث قاعدة البيانات
      RecipeModel updatedRecipe = RecipeModel(
        id: recipe.id,
        nameRecipe: recipe.nameRecipe,
        category: recipe.category,
        image: recipe.image,
        instructions: recipe.instructions,
        ingredients: recipe.ingredients,
        prepTime: recipe.prepTime,
        cookTime: recipe.cookTime,
        isFavorite: newFavoriteValue,
      );
      await DatabaseHelper().updateRecipe(updatedRecipe);

      // تحديث العنصر في القائمة الحالية
      for (int i = 0; i < recipes.length; i++) {
        if (recipes[i].id == recipe.id) {
          recipes[i] = updatedRecipe;
          break;
        }
      }

      emit(HomeSucceed(recipes)); // إعادة بناء الحالة
    } catch (e) {
      print(e);
    }
  }







  deleteItem(int id) async {
    await DatabaseHelper().deleteRecipe(id);
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


}
