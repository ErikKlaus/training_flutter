import 'package:flutter/material.dart';
import 'package:training_flutter/day_16/database/siswa_controller.dart';
import 'package:training_flutter/day_16/models/siswa_model.dart';

class CrSiswaScreen extends StatefulWidget {
  const CrSiswaScreen({super.key});

  @override
  State<CrSiswaScreen> createState() => _CrSiswaScreenState();
}

class _CrSiswaScreenState extends State<CrSiswaScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  static const InputDecoration decorationConstant = InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _namaController,
              decoration: decorationConstant.copyWith(
                hintText: "Masukan Nama Siswa",
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _kelasController,
              decoration: decorationConstant.copyWith(
                hintText: "Masukan Kelas Siswa",
              ),
            ),
            SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_namaController.text.isNotEmpty) {
                    print(
                      "Nama: ${_namaController.text}, Kelas: ${_kelasController.text}",
                    );
                    return;
                  }

                  if (_kelasController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Kelas belum diisi")),
                    );
                    return;
                  }
                  SiswaController.registerSiswa(
                    SiswaModel(
                      nama: _namaController.text,
                      kelas: _kelasController.text,
                    ),
                  );
                  _namaController.clear();
                  _kelasController.clear();
                },
                child: Text("Simpan"),
              ),
            ),

            // FutureBuilder<List<SiswaModel>>(
            //   future: SiswaController.getAllSiswa(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {
            //     if (snapshot.hasData) {
            //       return CircularProgressIndicator();
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
