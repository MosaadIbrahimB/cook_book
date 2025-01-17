import 'package:cook_book/core/utils/app_color.dart';
import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('CookBook',style: TextStyle(
        fontSize: 30
      ),),
backgroundColor: AppColor.backGround,
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.add),
      //     onPressed: () {
      //       // Code to add a new recipe
      //     },
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size(1,55);
}
