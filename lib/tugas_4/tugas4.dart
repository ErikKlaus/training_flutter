import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Registrasi",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              labelText: "Nama",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: "Nomor HP",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              labelText: "Deskripsi",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 15),
          ListTile(
            tileColor: Colors.red[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            leading: const Icon(Icons.send, color: Colors.white),
            title: const Text(
              "Kirim Data",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 30),

          //Daftar Item
          const Center(
            child: Text(
              "Daftar Pengguna",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 15),

          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Erik"),
            subtitle: const Text("Aktif"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Dafa"),
            subtitle: const Text("Aktif"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Rizki"),
            subtitle: const Text("Aktif"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Mulyana"),
            subtitle: const Text("Aktif"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Fahmi"),
            subtitle: const Text("Aktif"),
          ),
        ],
      ),
    );
  }
}
