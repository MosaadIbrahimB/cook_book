import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:cook_book/feature/add/cubit/add_state.dart';
import 'package:cook_book/feature/add/presentation/widget/drop_down_widget.dart';
import 'package:cook_book/feature/add/presentation/widget/image_input_field_widget.dart';
import 'package:cook_book/feature/home/presentation/cubit/home_cubit.dart';
import 'package:cook_book/feature/layout/presentation/control/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/image_cubit.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCubit, AddState>(
      builder: (context, state) {
        final cubit = AddCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: cubit.keyForm,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20,),
                  TextFormField(
                    validator: (value) {
                      if(value?.trim()==''){
                        return "Enter name recipe";
                      }
                      return null;
                    },
                    controller: cubit.nameRecipeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Recipe Name'),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cubit.preparationTimeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Preparation Time (minutes)'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cubit.cookingTimeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Cooking Time (minutes)'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cubit.ingredientTimeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Ingredients (one per line)'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cubit.instructionsTimeController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Instructions'),
                    keyboardType: TextInputType.multiline,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 10),
                  const DropDownWidget(),
                  const SizedBox(height: 20),
                  const ImageInputField(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        bool b=cubit.keyForm.currentState!.validate();
                        if (b) {
                          cubit.saveRecipe().then(
                                (value) {
                              if (context.mounted) {
                                LayOutCubit.get(context).changeIndex(i: 0);
                                HomeCubit.get(context).getRecipe();
                                AddCubit.get(context).pathImage = null;
                                ImageCubit.get(context).initialCubit();
                              }
                            },
                          );
                        }


                      },
                      child: const Text("save"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
