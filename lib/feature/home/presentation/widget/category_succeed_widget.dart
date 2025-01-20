import 'package:cook_book/feature/home/data/category_data_model.dart';
import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cook_book/feature/home/presentation/widget/item_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySucceedWidget extends StatelessWidget {
  const CategorySucceedWidget({super.key, required this.categories});
  final List<CategoryDataModel> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category=categories[index];
        return Center(
          child: InkWell(
            onTap: () async{
              print("object $index");
              // await  DatabaseHelper.instance.deleteDB();
              // print(category.id);
              // BlocProvider.of<CategoryCubit>(context).deleteCategory(category.id??0);
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
