import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:cook_book/feature/home/presentation/widget/category_succeed_widget.dart';
import 'package:flutter/material.dart';

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
