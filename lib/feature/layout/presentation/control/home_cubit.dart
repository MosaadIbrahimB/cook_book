import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../recipe/data/data.dart';
import '../../../recipe/data/recipe_model.dart';
import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());
static DataModel dataModel=DataModel();
  static HomeCubit get(context) => BlocProvider.of<HomeCubit>(context);
  List<String> categories = dataModel.categories;
  final TextEditingController searchController = TextEditingController();

  getRecipes(String category) {
    List<RecipeModel>recipeList=
    dataModel.recipes.where(
      (recipe) {
        return recipe.category==category;
      },
    ).toList();
    emit(HomeSucceedState(recipeList: recipeList));
  }


  // List<RecipeModel> get filteredRecipes {
  //   return recipes.where((recipe) {
  //     bool matchesCategory =
  //         selectedCategory == 'All' || recipe.category == selectedCategory;
  //     bool matchesSearch = recipe.recipeName
  //         .toLowerCase()
  //         .contains(_searchController.text.toLowerCase());
  //     return matchesCategory && matchesSearch;
  //   }).toList();
  // }
}
// final TextEditingController _searchController = TextEditingController();
// List<String> categories = DataMode().categories;
// List<RecipeModel> recipes =DataMode().recipes;
// String selectedCategory = 'All';
//
// List<RecipeModel> get filteredRecipes {
//   return recipes.where((recipe) {
//     bool matchesCategory = selectedCategory == 'All' || recipe.category== selectedCategory;
//     bool matchesSearch = recipe.recipeName.toLowerCase().contains(_searchController.text.toLowerCase());
//     return matchesCategory && matchesSearch;
//   }).toList();
// }



// Recipe List
// Expanded(
//   child: ListView.builder(
//     itemCount: filteredRecipes.length,
//     itemBuilder: (context, index) {
//       var recipe = filteredRecipes[index];
//       return Card(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         child: ListTile(
//           title: Text(
//             recipe.recipeName!,
//             style: const TextStyle(
//               color: Color(0xFFD2691E),
//               // Chocolate color for titles
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//           subtitle: Text(recipe.category!),
//           onTap: () {
//             print("object");
//           },
//         ),
//       );
//     },
//   ),
// ),
