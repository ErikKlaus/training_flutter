import 'package:flutter/material.dart';

class Tugas5 extends StatefulWidget {
  const Tugas5({super.key});

  @override
  State<Tugas5> createState() => _Tugas5State();
}

class _Tugas5State extends State<Tugas5> {
  int hitung = 0;

  bool showProfile = false;
  bool showSukses = false;
  bool lihatSelengkapnya = false;
  bool showRahasia = false;

  final String nama = "Erik Klaus";
  final String email = "erik@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Tugas 5 Flutter",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            hitung -= 1;
          });
        },
        child: const Icon(Icons.remove),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "1. ElevatedButton",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showProfile = !showProfile;
                });
              },
              child: Text(showProfile ? "Tutup Profil" : "Buka Profil"),
            ),
            const SizedBox(height: 10),
            if (showProfile) ...[
              const Text(
                "Profil",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 10),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Nama"),
                      subtitle: Text(nama),
                    ),
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.email),
                      title: const Text("Email"),
                      subtitle: Text(email),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 25),
            const Text(
              "2. IconButton",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: IconButton(
                iconSize: 34,
                icon: Icon(
                  showSukses ? Icons.bookmark : Icons.bookmark_add_outlined,
                  color: showSukses
                      ? const Color.fromARGB(255, 179, 27, 27)
                      : Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    showSukses = !showSukses;
                  });
                },
              ),
            ),
            if (showSukses) ...[
              const Center(
                child: Text("Tersimpan!", style: TextStyle(fontSize: 16)),
              ),
            ],
            const SizedBox(height: 25),
            const Text(
              "3. TextButton",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                setState(() {
                  lihatSelengkapnya = !lihatSelengkapnya;
                });
              },
              child: Text(lihatSelengkapnya ? "Tutup" : "Lihat Selengkapnya"),
            ),
            if (lihatSelengkapnya) ...[
              const Text(
                "Adapun 3 isi Supersemar adalah sebagai berikut:\n\n"
                "1. Mengambil segala tindakan yang dianggap perlu untuk terdjaminnja keamanan dan ketenangan, serta kestabilan djalannja pemerintahan dan djalannja Revolusi, serta mendjamin keselamatan pribadi dan kewibawaan Pimpinan Presiden/Panglima Tertinggi/Pemimpin Besar Revolusi/Mandataris M.P.R.S.\n\n"
                "2. Mengadakan koordinasi pelaksanaan perintah dengan Panglima-Panglima Angkatan Lain dengan sebaik-baiknja.\n\n"
                "3. Supaja melaporkan segala sesuatu jang bersangkut paut dalam tugas dan tanggung-djawabnja seperti tersebut diatas.",
                style: TextStyle(fontSize: 14),
              ),
            ],
            const SizedBox(height: 25),
            const Text(
              "4. InkWell",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Material(
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  print("Kotak berhasil disentuh!");
                  setState(() {
                    showRahasia = !showRahasia;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      "Tekan Aja",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            if (showRahasia)
              const Center(
                child: Text(
                  "Terkirim ke Debug Console",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            const SizedBox(height: 25),
            const Text(
              "5. GestureDetector",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "$hitung",
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                print("Ditekan sekali");
                setState(() {
                  hitung += 1;
                });
              },
              onDoubleTap: () {
                print("Ditekan dua kali");
                setState(() {
                  hitung += 2;
                });
              },
              onLongPress: () {
                print("Tahan lama");
                setState(() {
                  hitung += 3;
                });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Tap / Double Tap / Long Press",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
