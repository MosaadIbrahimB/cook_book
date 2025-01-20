import 'package:cook_book/core/utils/app_color.dart';
import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:cook_book/feature/add/presentation/add_screen.dart';
import 'package:cook_book/feature/favorite/favorite_screen.dart';
import 'package:cook_book/feature/home/home_screen.dart';
import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cook_book/feature/layout/presentation/control/layout_cubit.dart';
import 'package:cook_book/feature/layout/presentation/widget/app_bar_widget.dart';
import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayOutCubit, int>(
  builder: (context, state) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body:LayOutCubit.get(context).screen[state],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: state,
          onTap: (value) {
            print(value);
            LayOutCubit.get(context).changeIndex(i: value);
          },
          backgroundColor: AppColor.listItemColor,
          selectedItemColor: AppColor.bottom,
          unselectedItemColor: Colors.black87,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/all_recipe.png",
                  height: 30,
                  color: LayOutCubit.get(context).state == 0 ? AppColor.bottom : null,
                ),
                label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                label: "Favorite"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
                label: "Add Recipe"),

            // BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          ]),
    );
  },
);
  }
}

/*
  SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: HomeCubit.get(context).categories.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFFFFA07A) // salmon color for categories
                        ),
                    onPressed: () {
                      String category =
                          HomeCubit.get(context).categories[index];
                      HomeCubit.get(context).getRecipes(category);
                    },
                    child: Text(HomeCubit.get(context).categories[index]),
                  ),
                ),
              ),
            ),
            FutureBuilder(
              future: GetAllCategoryRemote().searchMealByName(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data![0].strMeal ?? "");
                }
                return Text("data");
              },
            ),
            // BlocBuilder<HomeCubit, HomeState>(
            //   builder: (context, state) {
            //     if (state is HomeSucceedState) {
            //       List<RecipeModel> listRecipe = state.recipeList;
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: listRecipe.length,
            //           itemBuilder: (context, index) {
            //
            //             return RecipeUIWidget(recipeModel: listRecipe[index]);
            //           },
            //         ),
            //       );
            //     }
            //     return const SizedBox();
            //   },
            // ),
            ElevatedButton(
                onPressed: () async {
                  List l = await GetAllCategoryRemote().searchMealByName();
                  print(l);
                },
                child: Text("data")),
            const SizedBox(height: 10),
 */
class RecipeUIWidget extends StatelessWidget {
  RecipeModel recipeModel;

  RecipeUIWidget({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(recipeModel.nameRecipe),
      ],
    );
  }
}

// class CategoryRecipesWidget extends StatefulWidget {
//   List listCategories;
//   String selectedCategory;
//
//   CategoryRecipesWidget(
//       {super.key,
//       required this.listCategories,
//       required this.selectedCategory});
//
//   @override
//   State<CategoryRecipesWidget> createState() => _CategoryRecipesWidgetState();
// }
//
// class _CategoryRecipesWidgetState extends State<CategoryRecipesWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: widget.listCategories.map((category) {
//           return ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor:
//                   const Color(0xFFFFA07A), // salmon color for categories
//             ),
//             onPressed: () {
//               setState(() {
//                 widget.selectedCategory = category;
//               });
//             },
//             child: Text(category),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: categories.map((category) {
//       return ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(
//               0xFFFFA07A), // salmon color for categories
//         ),
//         onPressed: () {
//           setState(() {
//             selectedCategory = category;
//           });
//         },
//         child: Text(category),
//       );
//     }).toList(),
//   ),
// ),

/*
 BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                List<String> listCat = HomeCubit.get(context).categories;
                return SizedBox();
              },
            ),
 */
