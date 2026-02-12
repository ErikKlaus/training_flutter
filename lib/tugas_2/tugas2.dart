import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Profil Saya",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Edit",
              style: TextStyle(
                color: Color(0xFFd61000),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 18),

            Center(
              child: Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/face.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Center(
              child: Text(
                "Erik Klaus | @rikklaus",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffd61000),
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.bloodtype,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Golongan Darah: O",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: const [
                  Spacer(),
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 6),
                  Text(
                    "Jakarta Selatan",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "Donor Terakhir",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "5 Februari 2026",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: const [
                          Text(
                            "Total Donor",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "3 Kali",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  const Text(
                    "Hewan Peliharaan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Icon(Icons.add_circle, color: Color(0xffd61000)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
