import 'package:cook_book/core/utils/app_image_path.dart';
import 'package:cook_book/feature/recipe/data/recipe_model.dart';
import 'package:flutter/material.dart';

class ImageRecipeWidget extends StatelessWidget {
  ImageRecipeWidget({
    super.key,
    required this.recipeModel,
  });

  RecipeModel recipeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            recipeModel.image ?? AppImagePath.dessert,
          ),
        ),
        color: Colors.orange,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }
}
