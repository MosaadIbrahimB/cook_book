import 'package:bloc/bloc.dart';
import 'package:cook_book/core/database/data_base_cook_book.dart';
import 'package:cook_book/feature/add/cubit/add_state.dart';
import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  String? selectedCategory='Main Course';
  String? pathImage;

  final List<String> categoryList = ['Main Course', 'Dessert', 'Appetizer'];


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
  Future<void> saveRecipe() async {
    try {
      await DatabaseHelperCookBook().insertRecipe(
        RecipeModel(
          nameRecipe: nameRecipeController!.text,
          category: selectedCategory??"Main Course",
          cookTime: int.parse(cookingTimeController!.text),
          prepTime: int.parse(preparationTimeController!.text),
          ingredients: ingredientTimeController!.text.split("\n"),
          instructions: instructionsTimeController!.text,
          isFavorite: int.parse(isFavoriteTimeController!.text.isEmpty
              ? "0"
              : isFavoriteTimeController!.text),
          image: pathImage??"/data/user/0/com.example.cook_book/cache/f43cf834-0150-4239-adeb-56690ce8f8e33050916381320516214.jpg"
        ),
      );
    } catch (e) {
      print(e);
    }

    // emit(RecipeSaving());
    // try {
    //   final id = await DatabaseHelper.instance.insertRecipe(recipe);
    //   recipe = recipe.copyWith(id: id); // تحديث الـ id
    //   emit(RecipeSaved(recipe));
    // } catch (e) {
    //   emit(RecipeError('Failed to save recipe: $e'));
    // }
  }
}
