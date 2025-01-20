
import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/home/presentation/cubit/home__state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../core/database/data_base.dart';



class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
deleteItem(int id)async{
  await DatabaseHelper().deleteRecipe(id);
}

  Future<void> getRecipe()async{
  emit(HomeLoading());
    try {
    List<RecipeModel> recipeList=await  DatabaseHelper().getRecipes();
    for(var x in recipeList){
      print(x.image);
    }
    emit(HomeSucceed(recipeList));
  } catch (e) {
print(e);
  }

}
}
