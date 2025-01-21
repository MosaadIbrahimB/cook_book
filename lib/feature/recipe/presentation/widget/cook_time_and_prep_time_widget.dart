import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:flutter/material.dart';
class CookTimeAndPrepTimeWidget extends StatelessWidget {
 final RecipeModel recipeModel;
  const CookTimeAndPrepTimeWidget({super.key,required this.recipeModel});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(Icons.timer, size: 16),
        const SizedBox(width: 4),
        Text("${recipeModel.prepTime} prepTime"),
        const SizedBox(width: 16),
        const Icon(Icons.timer, size: 16),
        const SizedBox(width: 4),
        Text("${recipeModel.cookTime} cookTime"),
        const SizedBox(width: 16),

        IconButton (
          icon: const Icon(Icons.favorite_border,
            // recipe.isFavorite == true
            //     ? Icons.favorite
            //     : Icons.favorite_border,
          ),
          onPressed: () {
           print("ssssssssssssss");
          },
        ),
        const Text("favorite"),

      ],
    );
  }
}
