import 'package:cook_book/feature/home/data/category_data_model.dart';
import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cook_book/feature/home/presentation/widget/item_category_widget.dart';
import 'package:flutter/material.dart';

class CategorySucceedWidget extends StatelessWidget {
  const CategorySucceedWidget({super.key, required this.categories});

  final List<CategoryDataModel> categories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Center(
          child: InkWell(
            onTap: () async {
              // print(category.categoryName);
              if (category.categoryName == "General") {
                HomeCubit.get(context).getRecipe();
              }else{
                HomeCubit.get(context).getRecipeByCategory(category.categoryName);
              }
            },
            child: ItemCategoryWidget(
              categoryDataModel: category,
            ),
          ),
        );
      },
    );
  }
}
