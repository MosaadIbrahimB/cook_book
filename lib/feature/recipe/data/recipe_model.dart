class RecipeModel {
  int? id; // إضافة id كخاصية اختيارية
  String recipeName;
  String? image;
  int? prepTime;
  int? cookTime;
  List<String>? ingredients; // مكونات
  String? instructions; // تعليمات
  String category;
  bool? isFavorite;

  RecipeModel({
    this.id, // id اختياري
    required this.recipeName,
    this.image,
    this.prepTime,
    this.cookTime,
    this.ingredients,
    this.instructions,
    required this.category,
    this.isFavorite = false,
  });

  // تحويل الوصفة إلى خريطة Map لتخزينها في قاعدة البيانات أو إرسالها عبر API
  Map<String, dynamic> toJson() {
    return {
      'id': id, // إضافة id هنا
      'recipeName': recipeName,
      'image': image,
      'prepTime': prepTime,
      'cookTime': cookTime,
      'ingredients': ingredients != null ? ingredients!.join(',') : null,
      'instructions': instructions,
      'category': category,
      'isFavorite': isFavorite == true ? 1 : 0, // تخزين كـ 0 أو 1
    };
  }

  // إنشاء الوصفة من خريطة Map
  factory RecipeModel.fromJson(Map<String, dynamic> map) {
    return RecipeModel(
      id: map['id'], // قراءة id من الخريطة
      recipeName: map['recipeName'],
      image: map['image'],
      prepTime: map['prepTime'],
      cookTime: map['cookTime'],
      ingredients: map['ingredients'] != null
          ? map['ingredients'].split(',')
          : null, // فصل المكونات إلى قائمة
      instructions: map['instructions'],
      category: map['category'],
      isFavorite: map['isFavorite'] == 1, // تحويل من 0 أو 1 إلى true/false
    );
  }
}
