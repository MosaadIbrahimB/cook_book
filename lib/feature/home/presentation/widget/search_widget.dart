import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8.0),
      sliver: SliverToBoxAdapter(
        child: TextField(
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
            HomeCubit.get(context).searchByNameRecipe(value);
          },
        ),
      ),
    );
  }
}
