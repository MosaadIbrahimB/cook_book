import 'package:cook_book/feature/home/presentation/cubit/category_cubit.dart';
import 'package:cook_book/feature/home/presentation/cubit/category_state.dart';
import 'package:cook_book/feature/home/presentation/widget/categories_text_widget.dart';
import 'package:cook_book/feature/home/presentation/widget/category_error_widget.dart';
import 'package:cook_book/feature/home/presentation/widget/category_succeed_widget.dart';
import 'package:cook_book/feature/layout/presentation/control/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../recipe/presentation/recipe_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // شريط البحث
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverToBoxAdapter(
            child: TextField(
              controller: HomeCubit.get(context).searchController,
              decoration: const InputDecoration(
                hintText: 'Search for recipes...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                prefixIcon: Icon(Icons.search),
                fillColor: Colors.white,
                filled: true,
              ),
              onChanged: (value) {
                print(value);
              },
            ),
          ),
        ),
        // النص الخاص بالفئات
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          sliver: SliverToBoxAdapter(
            child: const CategoriesTextWidget(),
          ),
        ),
        // قائمة الفئات
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (state is CategoryError) {
                    return CategoryErrorWidget(message: state.message);
                  }
                  if (state is CategorySucceed) {
                    return CategorySucceedWidget(categories: state.categories);
                  }
                  return const CategoryErrorWidget(
                      message: "No result, try again...");
                },
              ),
            ),
          ),
        ),
        // قائمة الوصفات
        const ListRecipeWidget(),
      ],
    );
  }
}
