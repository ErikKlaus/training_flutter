import 'dart:convert';

class PendaftarModel {
  final int? id;
  final String nama;
  final String email;
  final String nomorHp;
  final String asalKota;
  final String golonganDarah;
  final String rhesus;

  PendaftarModel({
    this.id,
    required this.nama,
    required this.email,
    required this.nomorHp,
    required this.asalKota,
    required this.golonganDarah,
    required this.rhesus,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email': email,
      'nomor_hp': nomorHp,
      'asal_kota': asalKota,
      'golongan_darah': golonganDarah,
      'rhesus': rhesus,
    };
  }

  factory PendaftarModel.fromMap(Map<String, dynamic> map) {
    return PendaftarModel(
      id: map['id'] != null ? map['id'] as int : null,
      nama: map['nama'] as String,
      email: map['email'] as String,
      nomorHp: map['nomor_hp'] as String,
      asalKota: map['asal_kota'] as String,
      golonganDarah: map['golongan_darah'] as String,
      rhesus: map['rhesus'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PendaftarModel.fromJson(String source) =>
      PendaftarModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
