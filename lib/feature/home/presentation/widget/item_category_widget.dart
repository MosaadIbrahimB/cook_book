import 'package:cook_book/core/utils/app_color.dart';
import 'package:cook_book/core/utils/app_image_path.dart';
import 'package:flutter/material.dart';

import '../../data/category_data_model.dart';

class ItemCategoryWidget extends StatelessWidget {
  const ItemCategoryWidget({super.key, required this.categoryDataModel});

  final CategoryDataModel categoryDataModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        // shape: BoxShape.circle,
      borderRadius: BorderRadius.circular(25),
        color: AppColor.listItemColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              categoryDataModel.image ?? AppImagePath.f1,
              width: 40,
            ),
            const SizedBox(
              width: 25,
            ),
            FittedBox(
              child: Text(
                categoryDataModel.categoryName,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),

            // Container(
            //     padding: const EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: AppColor.recipeTitles,
            //     ),
            //     child: const Icon(
            //       Icons.add,
            //       color: Colors.white,
            //     )),
          ],
        ),
      ),
    );
  }
}

/*
Card(
      color: AppColor.listItemColor,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
            categoryDataModel.image??AppImagePath.f1,
              width: 40,
            ),
            const SizedBox(
              width: 25,
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 categoryDataModel.categoryName,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ],
            ),
            const Expanded(
                child: SizedBox(
                  width: 25,
                )),
            // Container(
            //     padding: const EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       color: AppColor.recipeTitles,
            //     ),
            //     child: const Icon(
            //       Icons.add,
            //       color: Colors.white,
            //     )),
          ],
        ),
      ),
    );
 */
