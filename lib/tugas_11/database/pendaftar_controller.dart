import 'package:training_flutter/tugas_11/database/database_helper.dart';
import 'package:training_flutter/tugas_11/models/pendaftar_model.dart';

class PendaftarController {
  static Future<void> simpanPendaftar(PendaftarModel pendaftar) async {
    final dbs = await DatabaseHelper.db();
    await dbs.insert('pendaftar', {
      'nama': pendaftar.nama,
      'nomor_hp': pendaftar.nomorHp,
      'golongan_darah': pendaftar.golonganDarah,
      'rhesus': pendaftar.rhesus,
    });
  }

  static Future<List<PendaftarModel>> ambilSemuaPendaftar() async {
    final dbs = await DatabaseHelper.db();
    final hasil = await dbs.query('pendaftar', orderBy: 'id DESC');
    return hasil.map((e) => PendaftarModel.fromMap(e)).toList();
  }
}
