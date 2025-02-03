import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/home/presentation/cubit/home__state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/data_base.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<RecipeModel> recipes = [];

  Future<void> getRecipe() async {
    emit(HomeLoading());
    try {
     recipes = await DatabaseHelper().getRecipes();
      emit(HomeSucceed(recipes));
    } catch (e) {
      print(e);
    }
  }



  Future<void> updateRecipeFavoriteStatus(int id, int isFavorite) async {
    try {
      // تحديث العنصر في قاعدة البيانات
      await DatabaseHelper().updateRecipeFavoriteStatus(id, isFavorite);

      // تحديث العنصر داخل القائمة
      int index = recipes.indexWhere((recipe) => recipe.id == id);
      if (index != -1) {
        recipes[index] = recipes[index].copyWith(isFavorite: isFavorite); // تعديل العنصر
        emit(HomeSucceed(List.from(recipes))); // إرسال الحالة الجديدة
      }
    } catch (e) {
      print(e);
    }
  }






  // updateRecipe(RecipeModel recipe)async{
  //   await DatabaseHelper().updateRecipe(recipe);
  // }

  Future<void> searchByNameRecipe(String nameRecipe) async {
    emit(HomeLoading());
    try {
      List<RecipeModel> recipeList = await DatabaseHelper().searchByNameRecipe(nameRecipe);
      emit(HomeSucceed(recipeList));
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
