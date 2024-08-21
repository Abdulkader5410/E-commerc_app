import 'dart:developer';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  static _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {}
  }

  static Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE pro (
      id_pro INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT,
      image text,
      price DOUBLE
    )
    ''');

    await db.execute('''
    CREATE TABLE cart (
      id_cart INTEGER PRIMARY KEY AUTOINCREMENT,
      id_pro INTEGER,
      qun INTEGER,
      FOREIGN KEY (id_pro) REFERENCES pro(id_pro) ON DELETE CASCADE ON UPDATE CASCADE
    )
    ''');

    log("CREATED DATABSE");
  }

  //insert

  static Future<int> addPro(Map<String, dynamic> pro) async {
    final db = await database;
    return await db.insert('pro', pro);
  }

  static Future<int> addCart(Map<String, dynamic> cart) async {
    final db = await database;
    return await db.insert('cart', cart);
  }

  //udapte

  static Future<int> updateCart(Map<String, dynamic> cart) async {
    final db = await database;
    return await db.update('cart', cart,
        where: 'id_cart = ?', whereArgs: [cart['id_cart']]);
  }

  static Future<int> updateHabit(Map<String, dynamic> habit) async {
    final db = await database;
    return await db
        .update('habit', habit, where: 'id_h = ?', whereArgs: [habit['id_h']]);
  }

  //delelte

  static Future<int> deleteUser(int idUser) async {
    final db = await database;
    return await db.delete('user', where: 'id = ?', whereArgs: [idUser]);
  }

  static Future<int> deleteHabit(int idUser, int idHabit) async {
    final db = await database;
    return await db.delete('habit',
        where: 'id_h = ? and id_u =?', whereArgs: [idHabit, idUser]);
  }

  //get

  static Future<List<Map<String, dynamic>>> getPro() async {
    final db = await database;
    return await db.query('pro');
  }

  static Future<List<Map<String, dynamic>>> getCart() async {
    final db = await database;
    return await db.query('cart');
  }

  static Future<double> getTotalPriceInCart() async {
    final db = await database;

    String query = '''
                select sum(p.price * c.qun) as total_price
                from cart c join pro p on c.id_pro = p.id_pro
''';

    List<Map> res = await db.rawQuery(query);
    double totalPrices = res[0]['total_price'];

    return totalPrices;
  }

  static Future<int> getTotalQunInCart() async {
    final db = await database;

    String query = '''
                select sum(c.qun) as total_qun
                from cart c
''';

    List<Map> res = await db.rawQuery(query);
    int totalQun = res[0]['total_qun'];

    return totalQun;
  }

  static Future<List<Map<String, dynamic>>> getHabits(int idUser) async {
    final db = await database;
    return await db.query('habit', where: 'id_u = ?', whereArgs: [idUser]);
  }

  static Future<List<Map<String, dynamic>>> getNotifis() async {
    final db = await database;
    return await db.query('notifi');
  }

  static Future<List<Map<String, dynamic>>> getHabitTypes() async {
    final db = await database;
    return await db.query('habit_type');
  }

  static Future<List<Map<String, dynamic>>> getHabitTypesById(int idHt) async {
    final db = await database;
    return await db.query('habit_type', where: 'id_ht = ?', whereArgs: [idHt]);
  }

  static Future<List<Map<String, dynamic>>> getHabitsByDate(
      DateTime date, int userId) async {
    String sDate = date.toIso8601String().substring(0, 10);
    final db = await database;
    return await db.rawQuery('''select * from habit 
        where '$sDate' between start_date and end_date 
        and id_u = $userId ''');
  }

  static Future<String> getStatus(int idH, String date) async {
    final db = await database;
    final List<Map<String, dynamic>> res = await db.query('habit_status',
        columns: ['status'],
        where: 'id_h =? and status_date = ?',
        whereArgs: [idH, date]);

    if (res.isNotEmpty) {
      return res.first['status'];
    } else {
      return "Empty";
    }
  }

  static Future<List<Map<String, dynamic>>> getS(String date, int idH) async {
    final db = await database;
    return await db.query('habit_status',
        where: 'id_h = ? and status_date = ?', whereArgs: [idH, date]);
  }

  static Future<List<Map<String, dynamic>>> getStatusByHabitId(int idH) async {
    final db = await database;
    return await db.query('habit_status', where: 'id_h = ? ', whereArgs: [idH]);
  }
}
