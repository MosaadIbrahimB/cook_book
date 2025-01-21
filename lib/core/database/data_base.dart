import 'package:cook_book/feature/home/data/category_data_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model/recipe_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'cookbook.db');
    return await openDatabase(
      path,
      version: 5,
      onCreate: _onCreate,
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 6) {
          await db.execute('''
       CREATE TABLE IF NOT EXISTS recipes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nameRecipe TEXT NOT NULL,
        image TEXT,
        prepTime INTEGER,
        cookTime INTEGER,
        ingredients TEXT,
        instructions TEXT,
        category TEXT NOT NULL,
        isFavorite INTEGER DEFAULT 0
      )
    ''');
        }
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE recipes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nameRecipe TEXT NOT NULL,
        image TEXT,
        prepTime INTEGER,
        cookTime INTEGER,
        ingredients TEXT,
        instructions TEXT,
        category TEXT NOT NULL,
        isFavorite INTEGER DEFAULT 0
      )
    ''');
  }

  Future<void> deleteDB() async {
    String path = join(await getDatabasesPath(), 'cookbook.db');

    await deleteDatabase(path); // حذف قاعدة البيانات
    _database = null; // التأكد من أن الإشارة إلى قاعدة البيانات تم إزالتها
    print('Database deleted');
  }

  // إضافة وصفة جديدة
  Future<int> insertRecipe(RecipeModel recipe) async {
    Database db = await database;
    return await db.insert('recipes', recipe.toJson());
  }

  // استرجاع جميع الوصفات
  Future<List<RecipeModel>> getRecipes() async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query('recipes');
    return List.generate(maps.length, (i) {
      return RecipeModel.fromJson(maps[i]);
    });
  }

  Future<List<RecipeModel>> getRecipesByCategory(String category) async {
    Database db = await database;
    List<Map<String, dynamic>> maps =
        await db.query('recipes', where: 'category = ?', whereArgs: [category]);
    return List.generate(maps.length, (i) {
      return RecipeModel.fromJson(maps[i]);
    });
  }

  Future<List<RecipeModel>> searchByNameRecipe(String nameRecipe) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      'recipes',
      where: 'nameRecipe LIKE ?',
      whereArgs: ['$nameRecipe%'],
    );
    return List.generate(maps.length, (i) {
      return RecipeModel.fromJson(maps[i]);
    });
  }

  Future<List<RecipeModel>> getFavRecipes() async {
    Database db = await database;
    List<Map<String, dynamic>> maps =
        await db.query('recipes', where: 'isFavorite = ?', whereArgs: [1]);
    return List.generate(maps.length, (i) {
      return RecipeModel.fromJson(maps[i]);
    });
  }

  // تحديث وصفة
  Future<int> updateRecipe(RecipeModel recipe) async {
    Database db = await database;
    return await db.update(
      'recipes',
      recipe.toJson(),
      where: 'id = ?',
      whereArgs: [recipe.id],
    );
  }

  // حذف وصفة
  Future<int> deleteRecipe(int id) async {
    Database db = await database;
    return await db.delete(
      'recipes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //------------------- التصنيفات -------------------

  Future<int> insertCategory(CategoryDataModel category) async {
    final db = await database;
    final id = await db.insert(
      'categories',
      category.toJson()..remove('id'), // حذف id لأنه يتم توليده تلقائيًا
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id; // إرجاع id الذي تم إنشاؤه
  }

  Future<void> updateCategory(CategoryDataModel category) async {
    final db = await database;
    await db.update(
      'categories',
      category.toJson(),
      where: 'id = ?',
      whereArgs: [category.id],
    );
  }

  Future<void> deleteCategory(int id) async {
    final db = await database;
    final count = await db.delete(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
    print('$count category deleted');
  }

  Future<List<CategoryDataModel>> fetchCategories() async {
    final db = await database;
    final List<Map<String, dynamic>> result =
        await db.query('categories'); // جلب البيانات من قاعدة البيانات
    return result
        .map((json) => CategoryDataModel.fromJson(json))
        .toList(); // تحويل النتائج إلى قائمة من الكائنات
  }
}
