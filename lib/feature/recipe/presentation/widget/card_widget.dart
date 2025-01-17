import 'package:cook_book/core/utils/app_color.dart';
import 'package:flutter/material.dart';
class CardWidget extends StatelessWidget {
  Widget child;
  CardWidget({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: AppColor.listItemColor,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ), ),
        child:child);
  }
}
