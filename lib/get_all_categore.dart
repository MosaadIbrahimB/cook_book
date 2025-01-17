import 'package:dio/dio.dart';

import 'feature/layout/data/meal_model.dart';

class GetAllCategoryRemote {
  Dio dio = Dio();

 Future<List<CategoryModel>> getAll() async {
    try {
      Response   response = await dio
          .get("https://www.themealdb.com/api/json/v1/1/categories.php");
     Map<String,dynamic> jsonData=response.data;
      List<CategoryModel>listCategory=[];
      for(var e in jsonData["categories"]){
        listCategory.add(CategoryModel.formJson(e));
      }
      return listCategory;
    } catch (e) {
     throw Exception(e);
    }
  }
 Future<List<MealModel>> searchMealByName() async {
    try {
      Response   response = await dio
          .get("https://www.themealdb.com/api/json/v1/1/search.php?s=rice");
     Map<String,dynamic> jsonData=response.data;
      List<MealModel>listCategory=[];
      for(var e in jsonData["meals"]){
        listCategory.add(MealModel.fromJson(e));
      }
      return listCategory;
    } catch (e) {
     throw Exception(e);
    }
  }
}

class CategoryModel {
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;

  CategoryModel(this.idCategory, this.strCategory, this.strCategoryThumb,
      this.strCategoryDescription);

  factory CategoryModel.formJson(json) {
    return CategoryModel(json["idCategory"], json["strCategory"],
        json["strCategoryThumb"], json["strCategoryDescription"]);
  }
}
