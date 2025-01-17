import 'package:flutter/material.dart';
class CategoriesTextWidget extends StatelessWidget {
  const CategoriesTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: const Text(
        "Categories",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
