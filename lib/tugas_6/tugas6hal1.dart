import 'package:flutter/material.dart';
import 'tugas6hal2.dart';

class Tugas6hal1 extends StatefulWidget {
  const Tugas6hal1({super.key});

  @override
  State<Tugas6hal1> createState() => _Tugas6hal1State();
}

class _Tugas6hal1State extends State<Tugas6hal1> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),

            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 10),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              "Selamat Datang Kembali",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 2),

            const Text(
              "Silakan Masuk ke Akun Anda",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 40),

            const Text(
              "Email",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(Icons.email_outlined),
                  hintText: "erik@gmail.com",
                ),
              ),
            ),
            const SizedBox(height: 10),

            const Text(
              "Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: const Icon(Icons.lock_outline),
                  hintText: "********",
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
            ),
            const SizedBox(height: 5),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Lupa Password?",
                  style: TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
                ),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Tugas6hal2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffd61000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                icon: const Icon(Icons.login_outlined, color: Colors.white),
                label: const Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Atau login dengan"),
                ),
                Expanded(child: Divider()),
              ],
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          'https://www.google.com/favicon.ico',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Google",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                    ),
                    label: const Text(
                      "Facebook",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
