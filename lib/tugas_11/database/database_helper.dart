import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Future<Database> db() async {
    return openDatabase(
      join(await getDatabasesPath(), 'setetes_tugas11.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE pendaftar(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nama TEXT NOT NULL,
            nomor_hp TEXT NOT NULL,
            golongan_darah TEXT NOT NULL,
            rhesus TEXT NOT NULL
          )
        ''');
      },
      version: 1,
    );
  }
}
