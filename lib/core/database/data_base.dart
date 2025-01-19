import 'package:cook_book/core/database/model/recipe_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../feature/home/data/category_data_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('recipes.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE categories (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nameCategory TEXT NOT NULL,
      image TEXT
    )
    ''');

    await db.execute('''
    CREATE TABLE recipes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      categoryId INTEGER NOT NULL,
      category TEXT,
      name TEXT,
      ingredients TEXT,
      instructions TEXT,
      image TEXT,
      prepTime INTEGER,
      cookTime INTEGER,
      isFavorite INTEGER DEFAULT 0,
      FOREIGN KEY (categoryId) REFERENCES categories (id)
    )
    ''');
  }

  Future<void> deleteDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'recipes.db');

    await deleteDatabase(path); // حذف قاعدة البيانات
    _database = null; // التأكد من أن الإشارة إلى قاعدة البيانات تم إزالتها
    print('Database deleted');
  }

  //------------------- وصفات -------------------

  Future<int> insertRecipe(RecipeModel recipe) async {
    final db = await instance.database;
    final id = await db.insert(
      'recipes',
      recipe.toJson()..remove('id'), // حذف id لأنه يتم توليده تلقائيًا
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id; // إرجاع id الذي تم إنشاؤه
  }

  Future<void> updateRecipe(RecipeModel recipe) async {
    final db = await instance.database;
    await db.update(
      'recipes',
      recipe.toJson(),
      where: 'id = ?',
      whereArgs: [recipe.id],
    );
  }

  Future<void> deleteRecipe(int id) async {
    final db = await instance.database;
    await db.delete(
      'recipes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<RecipeModel>> fetchRecipes() async {
    final db = await instance.database;

    // استعلام لجلب جميع الوصفات
    final List<Map<String, dynamic>> result = await db.query('recipes');

    // تحويل النتائج إلى قائمة من RecipeModel
    return result.map((json) => RecipeModel.fromJson(json)).toList();
  }

  //------------------- التصنيفات -------------------

  Future<int> insertCategory(CategoryDataModel category) async {
    final db = await instance.database;
    final id = await db.insert(
      'categories',
      category.toJson()..remove('id'), // حذف id لأنه يتم توليده تلقائيًا
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id; // إرجاع id الذي تم إنشاؤه
  }

  Future<void> updateCategory(CategoryDataModel category) async {
    final db = await instance.database;
    await db.update(
      'categories',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<void> deleteCategory(int id) async {
    final db = await DatabaseHelper.instance.database;
    final count = await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
    print('$count category deleted');
  }

  Future<List<CategoryDataModel>> fetchCategories() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> result = await db.query('categories'); // جلب البيانات من قاعدة البيانات
    return result.map((json) => CategoryDataModel.fromJson(json)).toList(); // تحويل النتائج إلى قائمة من الكائنات
  }
}
