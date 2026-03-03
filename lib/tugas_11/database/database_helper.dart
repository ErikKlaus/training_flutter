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
            email TEXT NOT NULL,
            nomor_hp TEXT NOT NULL,
            asal_kota TEXT NOT NULL,
            golongan_darah TEXT NOT NULL,
            rhesus TEXT NOT NULL
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('DROP TABLE IF EXISTS pendaftar');
          await db.execute('''
            CREATE TABLE pendaftar(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              nama TEXT NOT NULL,
              email TEXT NOT NULL,
              nomor_hp TEXT NOT NULL,
              asal_kota TEXT NOT NULL,
              golongan_darah TEXT NOT NULL,
              rhesus TEXT NOT NULL
            )
          ''');
        }
      },
      version: 2,
    );
  }
}
