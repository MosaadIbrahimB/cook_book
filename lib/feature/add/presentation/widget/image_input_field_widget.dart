import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:cook_book/feature/add/cubit/image_cubit.dart';
import 'package:cook_book/feature/add/cubit/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';



class ImageInputField extends StatelessWidget {
  const ImageInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<ImageCubit, ImageState>(
        builder: (context, state) {
          if (state is ImageLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ImageSucceed) {
            return Image.file(
              state.file,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            );
          }
          if (state is ImageInitial) {
            return Column(
              children: [
                const Text('No image selected yet.'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        ImageCubit.get(context)
                            .pickImage(ImageSource.camera)
                            .then((value) {
                          if (context.mounted) {
                            AddCubit.get(context).pathImage = value;

                            print("source.name $value");
                          }
                        });
                      },

                      child: const Text('camera'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        ImageCubit.get(context)
                            .pickImage(ImageSource.gallery)
                            .then((value) {
                          if (context.mounted) {
                            AddCubit.get(context).pathImage = value;
                            print("source.name $value");
                          }
                        });
                      },
                      child: const Text('gallery'),
                    ),
                  ],
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
