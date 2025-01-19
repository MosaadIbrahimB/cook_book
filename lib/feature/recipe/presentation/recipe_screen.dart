import 'package:cook_book/feature/recipe/data/data.dart';
import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/recipe/presentation/widget/card_widget.dart';
import 'package:cook_book/feature/recipe/presentation/widget/cook_time_and_prep_time_widget.dart';
import 'package:cook_book/feature/recipe/presentation/widget/image_recipe_widget.dart';
import 'package:flutter/material.dart';

class ListRecipeWidget extends StatelessWidget {
  const ListRecipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(

      itemCount: DataModel().recipes.length,
      itemBuilder: (context, index) {
        List<RecipeModel> list = DataModel().recipes;
        return Padding(
          padding: const EdgeInsets.all(8),
          child: CardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة الوصفة
                ImageRecipeWidget(recipeModel:list[index]),
                // معلومات الوصفة
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // اسم الوصفة
                      Text(
                        list[index].nameRecipe,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // وقت التحضير والطهي
                      CookTimeAndPrepTimeWidget(recipeModel: list[index]),
                      const SizedBox(height: 8),
                      // فئة الوصفة
                      Chip(
                        label: Text(list[index].category),
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
                        children: list[index]
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
                      Text(list[index].instructions ??
                          "لا توجد تعليمات متاحة."),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


