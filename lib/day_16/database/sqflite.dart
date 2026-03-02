import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class UserEntity {
  final String name;
  final String email;
  final String password;

  UserEntity({required this.name, required this.email, required this.password});

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }
}

class DBHelper {
  static Future<Database> db() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'setetes.db'),
      version: 2,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)',
        );

        await db.execute(
          'CREATE TABLE siswa(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, kelas TEXT)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            'CREATE TABLE siswa(id INTEGER PRIMARY KEY AUTOINCREMENT, nama TEXT, kelas TEXT)',
          );
        }
      },
    );
  }

  static Future<void> registerUser(UserEntity user) async {
    final dbs = await DBHelper.db();
    await dbs.insert('user', {
      'name': user.name,
      'email': user.email,
      'password': user.password,
    });
  }

  static Future<UserEntity?> loginUser({
    required String email,
    required String password,
  }) async {
    final dbs = await DBHelper.db();
    final result = await dbs.query(
      'user',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );

    if (result.isNotEmpty) {
      return UserEntity.fromMap(result.first);
    }

    return null;
  }
}
