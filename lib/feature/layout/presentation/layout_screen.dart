import 'package:cook_book/core/utils/app_color.dart';
import 'package:cook_book/feature/favorite/cubit/fav_cubit.dart';
import 'package:cook_book/feature/layout/presentation/control/layout_cubit.dart';
import 'package:cook_book/feature/layout/presentation/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayOutCubit, int>(
  builder: (context, state) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body:LayOutCubit.get(context).screen[state],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: state,
          onTap: (value) {
            LayOutCubit.get(context).changeIndex(i: value);

          },
          backgroundColor: AppColor.listItemColor,
          selectedItemColor: AppColor.bottom,
          unselectedItemColor: Colors.black87,
          selectedLabelStyle: const TextStyle(color: Colors.black),
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/all_recipe.png",
                  height: 30,
                  color: LayOutCubit.get(context).state == 0 ? AppColor.bottom : null,
                ),
                label: "Home"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                label: "Favorite"),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
                label: "Add Recipe"),
          ]),
    );
  },
);
  }
}
