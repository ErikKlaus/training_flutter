import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 135, 0, 0),
        title: Text('Profil Saya'),
        titleTextStyle: TextStyle(color: Color(0xFFFFFFFF)),
        centerTitle: true,
        // actions: [Text('PPKD Batch 5')],

        // body: Text("Halo"),
      ),
      // body: Text("Halo"),
      // backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Selamat Datang di PPKD Jakarta Pusat',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
