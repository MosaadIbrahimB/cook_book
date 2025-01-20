import 'dart:io';
import 'package:cook_book/feature/add/cubit/image_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  static ImageCubit get(context) => BlocProvider.of(context);

  void initialCubit() {
    emit(ImageInitial());
  }

  Future<String> pickImage(ImageSource source) async {
    emit(ImageLoading());
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        emit(ImageSucceed(file: File(pickedFile.path)));
        return pickedFile.path;

      } else {

        emit(ImageError(msg: "image error"));
      }
    } catch (e) {
      emit(ImageError(msg: e.toString()));
    }
    return "";
  }
}

