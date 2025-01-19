import 'package:cook_book/core/database/data_base_cook_book.dart';
import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:cook_book/feature/add/cubit/add_state.dart';
import 'package:cook_book/feature/add/presentation/widget/drop_down_widget.dart';
import 'package:cook_book/feature/add/presentation/widget/image_input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Recipe',
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: BlocConsumer<AddCubit, AddState>(
          listener: (context, state) {
            if (state is RecipeSaved) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Recipe saved successfully!')),
              );
              Navigator.pop(context); // الرجوع للشاشة السابقة
            } else if (state is RecipeError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
              print(state.message);
            }
          },
          builder: (context, state) {
            final cubit = AddCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: cubit.nameRecipeController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Recipe Name'),
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
                            try {
                                // cubit.saveRecipe();
                             List<RecipeModel>r=    await DatabaseHelperCookBook().getRecipes();

                             for(var x in r){
                               print(x.category);
                             }
                             print("succeed add");
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: const Text("save"),
                        ),
                        // child: ElevatedButton(
                        //   onPressed: state is RecipeSaving ? null : () => cubit.saveRecipe(),
                        //   child: state is RecipeSaving ? const CircularProgressIndicator(
                        //           color: Colors.white,
                        //         ) : const Text('Save Recipe'),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}



/*
Image.file(File("/data/user/0/com.example.cook_book/cache/099fbd53-d977-4927-b8de-eefcd1cb274c1423674212393091533.jpg")),
  const SizedBox(height: 10),
                      Row(
                        children: [
                          const Text('Favorite'),
                          Switch(
                            value: cubit.recipe.isFavorite ?? false,
                            onChanged: (value) => cubit.toggleFavorite(),
                          ),
                        ],
                      ),
 */
