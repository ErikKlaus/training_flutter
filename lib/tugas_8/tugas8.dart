import 'package:flutter/material.dart';
import 'package:training_flutter/tugas_7/tugas7.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: tugas8()));
}

class tugas8 extends StatefulWidget {
  @override
  State<tugas8> createState() => _tugas8State();
}

class _tugas8State extends State<tugas8> {
  int currentIndex = 0;
  final Color primary = const Color(0xFFD61000);

  final List<Widget> pages = [tugas7(), TentangPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: primary,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Tentang"),
        ],
      ),
    );
  }
}

class TentangPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primary = const Color(0xFFD61000);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: primary),
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(color: primary, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Halo Bapak",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Aplikasi ini dibuat untuk memenuhi Tugas 8 Flutter dengan implementasi Bottom Navigation Bar dan Drawer pada halaman Home.",
            ),
            SizedBox(height: 20),
            Text("Nama Pembuat: Erik Klaus"),
            Text("Versi: 1.0"),
          ],
        ),
      ),
    );
  }
}
