import 'package:cook_book/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class FABWidget extends StatelessWidget {
  const FABWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: AppColor.bottom,
      onPressed: () {
        print("object");
        // BlocProvider.of<CategoryCubit>(context).addCategory(
        //   CategoryDataModel(
        //       categoryName: "Desserts", image: AppImagePath.dessert),
        // );
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
