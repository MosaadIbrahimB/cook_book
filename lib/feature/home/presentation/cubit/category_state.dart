import 'package:cook_book/feature/home/data/category_data_model.dart';

abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySucceed extends CategoryState {
  final List<CategoryDataModel> categories;

  CategorySucceed(this.categories);
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}
