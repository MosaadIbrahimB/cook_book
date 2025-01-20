import 'dart:io';

abstract class ImageState {}

class ImageInitial extends ImageState {}

class ImageLoading extends ImageState {}

class ImageSucceed extends ImageState {
  File file;

  ImageSucceed({required this.file});
}

class ImageError extends ImageState {
  String msg;

  ImageError({required this.msg});
}
