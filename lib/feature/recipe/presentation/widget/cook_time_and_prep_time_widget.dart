import 'package:cook_book/core/database/data_base.dart';
import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class CookTimeAndPrepTimeWidget extends StatelessWidget {
  final RecipeModel recipeModel;

  const CookTimeAndPrepTimeWidget({super.key, required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.timer, size: 16),
        const SizedBox(width: 4),
        Text("${recipeModel.prepTime} prepTime"),
        const SizedBox(width: 16),
        const Icon(Icons.timer, size: 16),
        const SizedBox(width: 4),
        Text("${recipeModel.cookTime} cookTime"),
        const SizedBox(width: 16),
        recipeModel.isFavorite == 0?
        IconButton(
          icon:  const Icon(
            Icons.favorite_border,

          ),
          onPressed: () {
            print("${recipeModel.id}");
            print("${recipeModel.isFavorite}");
            RecipeModel recipe = RecipeModel(
                id: recipeModel.id,
                nameRecipe: recipeModel.nameRecipe,
                category: recipeModel.category,
                image: recipeModel.image,
                instructions: recipeModel.instructions,
                ingredients
                    : recipeModel.ingredients,
                prepTime
                    : recipeModel.prepTime,
                cookTime
                    : recipeModel.cookTime,
                isFavorite
                :1);
            DatabaseHelper().updateRecipe(recipe);
            HomeCubit.get(context).getRecipe();
          },
        ):
        IconButton(
          icon:  const Icon(
            Icons.favorite,
color: Colors.red,
          ),
          onPressed: () {
            print("${recipeModel.id}");
            print("${recipeModel.isFavorite}");
            RecipeModel recipe = RecipeModel(
                id: recipeModel.id,
                nameRecipe: recipeModel.nameRecipe,
                category: recipeModel.category,
                image: recipeModel.image,
                instructions: recipeModel.instructions,
                ingredients
                    : recipeModel.ingredients,
                prepTime
                    : recipeModel.prepTime,
                cookTime
                    : recipeModel.cookTime,
                isFavorite
                :0);
            DatabaseHelper().updateRecipe(recipe);
            HomeCubit.get(context).getRecipe();

          },
        )
        ,
        const Text("favorite"),

      ],
    );
  }
}
