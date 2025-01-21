import 'package:bloc/bloc.dart';
import 'package:cook_book/core/database/data_base.dart';
import 'package:cook_book/core/utils/app_image_path.dart';
import 'package:cook_book/feature/add/cubit/add_state.dart';
import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/home/data/category_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_cubit.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit() : super(RecipeInitial());

  static AddCubit get(context) => BlocProvider.of(context);
  TextEditingController? nameRecipeController = TextEditingController();
  TextEditingController? preparationTimeController = TextEditingController();
  TextEditingController? cookingTimeController = TextEditingController();
  TextEditingController? ingredientTimeController = TextEditingController();
  TextEditingController? instructionsTimeController = TextEditingController();
  TextEditingController? isFavoriteTimeController = TextEditingController();
  TextEditingController? imageTimeController = TextEditingController();
  String? selectedCategory = 'Main Course';
  String? pathImage;

  final List<CategoryDataModel> categoryList = [
    CategoryDataModel(
        image: AppImagePath.general, categoryName: 'General'),
    CategoryDataModel(
        image: AppImagePath.mainFood, categoryName: 'Main Course'),
    CategoryDataModel(image: AppImagePath.dessert, categoryName: 'Dessert'),
    CategoryDataModel(image: AppImagePath.appetizers, categoryName: 'Appetizer')
  ];



  Future<void> saveRecipe() async {
print("in $pathImage");
    try {
      await DatabaseHelper().insertRecipe(
        RecipeModel(
            nameRecipe: nameRecipeController!.text,
            category: selectedCategory ?? "Main Course",
            cookTime: int.parse(cookingTimeController!.text.isEmpty
                ? "0"
                : cookingTimeController!.text),
            prepTime: int.parse(preparationTimeController!.text.isEmpty
                ? "0"
                : preparationTimeController!.text),
            ingredients: ingredientTimeController!.text.split("\n"),
            instructions: instructionsTimeController!.text,
            isFavorite: int.parse(isFavoriteTimeController!.text.isEmpty
                ? "0"
                : isFavoriteTimeController!.text),
            image: pathImage ?? "/data/user/0/com.example.cook_book/cache/f43cf834-0150-4239-adeb-56690ce8f8e33050916381320516214.jpg"),
      ).then((value) {
        clearController();
      },);
      
      
      
      
    } catch (e) {
      print(e);
    }
  }

  clearController(){
    nameRecipeController?.clear();
    preparationTimeController?.clear();
    cookingTimeController?.clear();
    ingredientTimeController?.clear();
    instructionsTimeController?.clear();
    isFavoriteTimeController?.clear();
    imageTimeController?.clear();
    selectedCategory='Main Course';


  }


}
// void updateRecipeName(String value) {
//   recipe = recipe.copyWith(name: value);
//   emit(RecipeUpdated(recipe));
// }
//
// void updatePrepTime(String value) {
//   recipe = recipe.copyWith(prepTime: int.parse(value));
//   emit(RecipeUpdated(recipe));
// }
//
// void updateCookTime(String value) {
//   recipe = recipe.copyWith(cookTime: int.parse(value));
//   emit(RecipeUpdated(recipe));
// }
//
// void updateIngredients(String value) {
//   recipe = recipe.copyWith(ingredients: value.split('\n'));
//   emit(RecipeUpdated(recipe));
// }
//
// void updateInstructions(String value) {
//   recipe = recipe.copyWith(instructions: value);
//   emit(RecipeUpdated(recipe));
// }
//
// void updateCategory(String value) {
//   recipe = recipe.copyWith(category: value);
//   print(value);
//   emit(RecipeUpdated(recipe));
// }
//
// void toggleFavorite() {
//   recipe = recipe.copyWith(isFavorite: (recipe.isFavorite ?? 0));
//   emit(RecipeUpdated(recipe));
// }
//
