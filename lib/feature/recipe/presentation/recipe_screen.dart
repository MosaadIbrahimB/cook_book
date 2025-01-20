import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cook_book/feature/recipe/presentation/widget/card_widget.dart';
import 'package:cook_book/feature/recipe/presentation/widget/cook_time_and_prep_time_widget.dart';
import 'package:cook_book/feature/recipe/presentation/widget/image_recipe_widget.dart';
import 'package:flutter/material.dart';

class ListRecipeWidget extends StatelessWidget {
 final List<RecipeModel>recipeList;
  const ListRecipeWidget({super.key, required this.recipeList});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: recipeList.length,
      itemBuilder: (context, index) {

        return InkWell(
          onTap: () {
            HomeCubit.get(context).deleteItem(recipeList[index].id??0);
            HomeCubit.get(context).getRecipe();
            print("delete ${recipeList[index].image}");
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CardWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة الوصفة
                  ImageRecipeWidget(recipeModel:recipeList[index]),
                  // معلومات الوصفة
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // اسم الوصفة
                        Text(
                          recipeList[index].nameRecipe,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // وقت التحضير والطهي
                        CookTimeAndPrepTimeWidget(recipeModel: recipeList[index]),
                        const SizedBox(height: 8),
                        // فئة الوصفة
                        Chip(
                          label: Text(recipeList[index].category),
                          backgroundColor: Colors.orange.withOpacity(0.2),
                        ),
                        const SizedBox(height: 16),
                        // المكونات
                        const Text(
                          "ingredient:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: recipeList[index]
                                  .ingredients
                                  ?.map((ingredient) => Text("• $ingredient"))
                                  .toList() ??
                              [],
                        ),
                        const SizedBox(height: 16),
                        // طريقة التحضير
                        const Text(
                          "instructions:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(recipeList[index].instructions ??
                            "لا توجد تعليمات متاحة."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


