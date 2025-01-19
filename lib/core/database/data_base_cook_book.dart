import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model/recipe_model.dart';


class DatabaseHelperCookBook {
  static final DatabaseHelperCookBook _instance = DatabaseHelperCookBook._internal();
  factory DatabaseHelperCookBook() => _instance;
  static Database? _database;

  DatabaseHelperCookBook._internal();

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
      onUpgrade: (db, oldVersion, newVersion) async{
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
}