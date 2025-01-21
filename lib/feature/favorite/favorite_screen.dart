import 'package:cook_book/feature/recipe/presentation/recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/database/model/recipe_model.dart';
import 'cubit/fav_cubit.dart';
import 'cubit/fav_state.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          if (state is FavLoadingState) {
            return const SliverToBoxAdapter(
              child: Center(child: Text("Loading data")),
            );
          }
          if (state is FavSucceedState) {
            List<RecipeModel> recipeList=state.recipeList;
            if(recipeList.isEmpty){
              return const SliverToBoxAdapter(child: Center(child: Text("No Favorite Recipe yet"),));
            }
            return ListRecipeWidget(
              recipeList: state.recipeList,
            );
          }

          if (state is FavErrorState) {
            return SliverToBoxAdapter(
                child: Center(child: Text(state.messageError)));
          }
          return const SliverToBoxAdapter(
            child: Center(
              child: Text("Error Favorite Recipe"),
            ),
          );
        },
      ),
    ]);
  }
}



