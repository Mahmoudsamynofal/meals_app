import 'package:meal_app/screens/home/model/category_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DpSevices {
  static final DpSevices instance = DpSevices();
  Database? _database;
 Future<Database> get database async {
  if (_database != null) return _database!;

  _database = await _initDataBase();
  return _database!;
}

  Future<Database> _initDataBase() async {
  final dbPath = join(await getDatabasesPath(), 'meal.db');
  return await openDatabase(
    dbPath,
    version: 1,
    onCreate: _createDatabase,
  );
}

  Future<void> _createDatabase(Database dp, int version) async {
    return await dp.execute(
      '''
      CREATE TABLE categories(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        image TEXT,
        time TEXT,
        discription TEXT,
        rate REAL
      )
      ''',
    );
  }

  Future<int> insertTodata(CategoryModel meal) async {
    final db = await database;
    return await db.insert('categories', meal.toMap());
  }

  Future<List<CategoryModel>> getToData() async {
   final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return maps.map((toElement)=> CategoryModel.fromMap(toElement)).toList();
  }

  
}
