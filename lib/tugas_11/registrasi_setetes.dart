import 'package:flutter/material.dart';
import 'package:training_flutter/tugas_11/database/pendaftar_controller.dart';
import 'package:training_flutter/tugas_11/models/pendaftar_model.dart';

class RegistrasiSetetes extends StatefulWidget {
  const RegistrasiSetetes({super.key});

  @override
  State<RegistrasiSetetes> createState() => _RegistrasiSetetesState();
}

class _RegistrasiSetetesState extends State<RegistrasiSetetes> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _nomorHpController = TextEditingController();

  String? _golonganDarahTerpilih;
  String? _rhesusTerpilih;

  List<PendaftarModel> _daftarPendaftar = [];
  bool _sedangLoading = false;

  final List<String> _daftarGolonganDarah = ['A', 'B', 'AB', 'O'];
  final List<String> _daftarRhesus = ['Positif (+)', 'Negatif (-)'];

  @override
  void initState() {
    super.initState();
    _loadDataPendaftar();
  }

  @override
  void dispose() {
    _namaController.dispose();
    _nomorHpController.dispose();
    super.dispose();
  }

  Future<void> _loadDataPendaftar() async {
    setState(() => _sedangLoading = true);
    final data = await PendaftarController.ambilSemuaPendaftar();
    setState(() {
      _daftarPendaftar = data;
      _sedangLoading = false;
    });
  }

  Future<void> _simpanData() async {
    if (!_formKey.currentState!.validate()) return;

    final pendaftarBaru = PendaftarModel(
      nama: _namaController.text.trim(),
      nomorHp: _nomorHpController.text.trim(),
      golonganDarah: _golonganDarahTerpilih!,
      rhesus: _rhesusTerpilih!,
    );

    await PendaftarController.simpanPendaftar(pendaftarBaru);

    _namaController.clear();
    _nomorHpController.clear();
    setState(() {
      _golonganDarahTerpilih = null;
      _rhesusTerpilih = null;
    });

    await _loadDataPendaftar();

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Data berhasil disimpan!'),
        backgroundColor: Color(0xffD61000),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Setetes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffD61000),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Formulir Pendaftaran',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1D0E0C),
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Nama Lengkap',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _namaController,
                    validator: (nilai) {
                      if (nilai == null || nilai.trim().isEmpty) {
                        return 'Nama tidak boleh kosong';
                      }
                      if (nilai.trim().length < 3) {
                        return 'Nama minimal 3 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Nomor HP',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  TextFormField(
                    controller: _nomorHpController,
                    keyboardType: TextInputType.phone,
                    validator: (nilai) {
                      if (nilai == null || nilai.trim().isEmpty) {
                        return 'Nomor HP tidak boleh kosong';
                      }
                      if (nilai.trim().length < 10) {
                        return 'Nomor HP minimal 10 digit';
                      }
                      if (!RegExp(r'^[0-9]+$').hasMatch(nilai.trim())) {
                        return 'Nomor HP hanya boleh berisi angka';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Golongan Darah',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    initialValue: _golonganDarahTerpilih,
                    items: _daftarGolonganDarah
                        .map(
                          (golongan) => DropdownMenuItem<String>(
                            value: golongan,
                            child: Text(golongan),
                          ),
                        )
                        .toList(),
                    onChanged: (nilai) {
                      setState(() => _golonganDarahTerpilih = nilai);
                    },
                    validator: (nilai) {
                      if (nilai == null || nilai.isEmpty) {
                        return 'Golongan darah harus dipilih';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'Rhesus',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 6),
                  DropdownButtonFormField<String>(
                    initialValue: _rhesusTerpilih,

                    items: _daftarRhesus
                        .map(
                          (rhesus) => DropdownMenuItem<String>(
                            value: rhesus,
                            child: Text(rhesus),
                          ),
                        )
                        .toList(),
                    onChanged: (nilai) {
                      setState(() => _rhesusTerpilih = nilai);
                    },
                    validator: (nilai) {
                      if (nilai == null || nilai.isEmpty) {
                        return 'Rhesus harus dipilih';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  // Tombol Simpan
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: _simpanData,
                      label: const Text(
                        'Daftar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffD61000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Daftar Pendaftar',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1D0E0C),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  child: Text(
                    '${_daftarPendaftar.length} orang',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            if (_sedangLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32),
                  child: CircularProgressIndicator(color: Color(0xffD61000)),
                ),
              )
            else if (_daftarPendaftar.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 8),
                    Text(
                      'Belum ada pendaftar',
                      style: TextStyle(fontSize: 14, color: Color(0xff6B7280)),
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _daftarPendaftar.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final pendaftar = _daftarPendaftar[index];
                  return _kartuPendaftar(pendaftar, index);
                },
              ),
          ],
        ),
      ),
    );
  }

  Widget _kartuPendaftar(PendaftarModel pendaftar, int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            const SizedBox(width: 12),
            // Info Pendaftar
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pendaftar.nama,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1D0E0C),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const SizedBox(width: 4),
                      Text(
                        pendaftar.nomorHp,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff6B7280),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Text(
                '${pendaftar.golonganDarah} Rh ${pendaftar.rhesus}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffD61000),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _dekorasiInput({
    required String petunjuk,
    required IconData ikon,
  }) {
    return InputDecoration(
      hintText: petunjuk,
      hintStyle: const TextStyle(color: Color(0xff6B7280), fontSize: 14),
      prefixIcon: Icon(ikon, color: const Color(0xffD61000), size: 20),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xffE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xffE5E7EB)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xffD61000), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    );
  }
}
