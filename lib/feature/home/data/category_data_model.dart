class CategoryDataModel {
  final int? id; // إضافة id كخاصية اختيارية
  final String categoryName;
  final String? image;

  CategoryDataModel({
    this.id, // اجعل id اختيارياً
    required this.categoryName,
    this.image,
  });

  // تحويل الكائن إلى خريطة (Map) للتخزين في قاعدة البيانات
  Map<String, dynamic> toJson() {
    return {
      'id': id, // إضافة id هنا
      'name': categoryName,
      'image': image,
    };
  }

  // تحويل الخريطة (Map) إلى كائن
  factory CategoryDataModel.fromJson(Map<String, dynamic> json) {
    return CategoryDataModel(
      id: json['id'], // قراءة id من الخريطة
      categoryName: json['name'],
      image: json['image'],
    );
  }
}

