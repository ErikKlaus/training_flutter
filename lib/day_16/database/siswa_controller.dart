import 'dart:math';

import 'package:training_flutter/day_16/database/sqflite.dart';
import 'package:training_flutter/day_16/models/siswa_model.dart';

class SiswaController {
  static Future<void> registerSiswa(SiswaModel siswa) async {
    final dbs = await DBHelper.db();
    await dbs.insert('siswa', {'nama': siswa.nama, 'kelas': siswa.kelas});
  }

  static Future<List<SiswaModel>> getAllSiswa() async {
    final dbs = await DBHelper.db();
    final result = await dbs.query('siswa');
    print(result.map((e) => SiswaModel.fromMap(e)).toList());
    return result.map((e) => SiswaModel.fromMap(e)).toList();
  }
}
