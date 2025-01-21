import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cook_book/feature/home/presentation/cubit/home__state.dart';
import 'package:cook_book/feature/home/presentation/widget/categories_text_widget.dart';
import 'package:cook_book/feature/home/presentation/widget/category_succeed_widget.dart';
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
        const SearchWidget(),
        // النص الخاص بالفئات
        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          sliver: SliverToBoxAdapter(
            child: CategoriesTextWidget(),
          ),
        ),
        // قائمة الفئات
        const CategoryBannerWidget(),
        // قائمة الوصفات
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeSucceed) {
              return ListRecipeWidget(recipeList: state.recipeModel);
            }
            if (state is HomeLoading) {
              return const SliverToBoxAdapter(
                child: Center(child: Text("Loading data")),
              );
            }
            return const SliverToBoxAdapter(
              child: Center(child: Text("No data")),
            );
          },
        ),
      ],
    );
  }
}


class CategoryBannerWidget extends StatelessWidget {
  const CategoryBannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
            height: 100,
            child: CategorySucceedWidget(
                categories: AddCubit.get(context).categoryList)),
      ),
    );
  }
}
