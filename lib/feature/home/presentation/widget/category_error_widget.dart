import 'package:flutter/material.dart';

class CategoryErrorWidget extends StatelessWidget {
  const CategoryErrorWidget({
    super.key, required this.message,
  });
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade50,
      height: 50,
      child: Center(
          child: Text(
            message,
            style:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
