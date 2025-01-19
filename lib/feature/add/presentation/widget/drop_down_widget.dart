import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: AddCubit.get(context).selectedCategory,
      decoration:
      const InputDecoration(labelText: 'Category'),
      items: AddCubit.get(context).categoryList
          .map((category) => DropdownMenuItem(
        value: category,
        child: Text(category),
      ))
          .toList(),
      onChanged: (value) {
        AddCubit.get(context).selectedCategory=value;
      },
    );
  }
}
