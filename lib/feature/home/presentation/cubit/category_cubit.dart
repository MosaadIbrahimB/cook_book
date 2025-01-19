import 'package:cook_book/feature/home/data/category_data_model.dart';
import 'package:cook_book/core/database/data_base.dart';
import 'package:cook_book/feature/home/presentation/cubit/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  // دالة لتحميل الفئات من قاعدة البيانات
  Future<void> loadCategories() async {
    emit(CategoryLoading());
    try {
      List<CategoryDataModel> categories = await DatabaseHelper.instance.fetchCategories();
      if(categories.isNotEmpty){
      emit(CategorySucceed(categories));
      }else{
        emit(CategoryError("Not Found Categories"));

      }
    } catch (e) {
      emit(CategoryError("Error get Categories , try again"));
    }
  }

  // دالة لإضافة فئة جديدة
  Future<void> addCategory(CategoryDataModel category) async {
    try {
      await DatabaseHelper.instance.insertCategory(category);
      loadCategories();  // إعادة تحميل الفئات بعد الإضافة
    } catch (e) {
      emit(CategoryError("فشل في إضافة الفئة"));
    }
  }

  // دالة لحذف فئة
  Future<void> deleteCategory(int id) async {
    try {
      await DatabaseHelper.instance.deleteCategory(id);
      loadCategories();  // إعادة تحميل الفئات بعد الحذف
    } catch (e) {
      emit(CategoryError("فشل في حذف الفئة"));
    }
  }
}
