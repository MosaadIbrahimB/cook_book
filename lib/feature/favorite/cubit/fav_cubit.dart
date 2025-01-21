import 'package:bloc/bloc.dart';
import 'package:cook_book/core/database/data_base.dart';
import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitialState());
  static FavCubit get(BuildContext context)=>BlocProvider.of(context);

  Future<List<RecipeModel>> getFvaRecipe() async {
    try {
      List<RecipeModel> recipeList = await DatabaseHelper().getFavRecipes();
      emit(FavSucceedState(recipeList: recipeList));
    } catch (e) {
      emit(FavErrorState(messageError: e.toString()));
    }
    return [];
  }
}
