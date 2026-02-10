import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 135, 0, 0),
        title: Text('Profil Saya'),
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(
            'Nama: Erik Klaus Keifas Kalalo',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.location_on), Text('Jakarta Timur')],
          ),

          Text(
            'Mahasiswa asal Jakarta yang suka naik gunung',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
