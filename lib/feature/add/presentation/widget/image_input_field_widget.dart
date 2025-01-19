import 'dart:io';
import 'package:cook_book/feature/add/cubit/add_cubit.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInputField extends StatefulWidget {
  const ImageInputField({super.key});

  @override
  _ImageInputFieldState createState() => _ImageInputFieldState();
}

class _ImageInputFieldState extends State<ImageInputField> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _imageFile != null?    Image.file(
            _imageFile!,
            height: 100,
            width: 100,
            fit: BoxFit.fill,
          )
              :
          const Text('No image selected yet.'),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  try {
                    _pickImage(ImageSource.camera).then((value) {
                      if (_imageFile!.path.isNotEmpty) {
                        if (context.mounted) {
                          AddCubit.get(context).pathImage = _imageFile!.path;
                        }
                        print(_imageFile!.path);
                      }
                    },);

                  } on Exception catch (e) {
                 print(e);
                  }
                },
                child: const Text('camera'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {

                  try {
                    _pickImage(ImageSource.gallery);
                    AddCubit.get(context).pathImage=_imageFile!.path;
                    print(_imageFile!.path);
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}