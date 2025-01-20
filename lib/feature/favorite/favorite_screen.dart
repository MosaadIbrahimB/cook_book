import 'package:cook_book/feature/layout/presentation/control/layout_cubit.dart';
import 'package:flutter/material.dart';
class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            LayOutCubit.get(context).changeIndex(i: 0);

          },
          child: Text("Fav"
              " screen"),
        ),
      ),
    );
  }
}
