import 'package:flutter/material.dart';
import 'package:training_flutter/day_16/database/sqflite.dart';
import '../../constant/app_color.dart';
import '../database/preference.dart';

class LoginScreenDay16 extends StatefulWidget {
  const LoginScreenDay16({super.key});

  @override
  State<LoginScreenDay16> createState() => _LoginScreenDay16State();
}

class _LoginScreenDay16State extends State<LoginScreenDay16> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    await PreferenceHandler().storingIsLogin(true);

    bool? value = await PreferenceHandler.getIsLogin();
    debugPrint("Status setelah disimpan: $value");

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const Scaffold(body: Center(child: Text("Masuk berhasil"))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),

                Text(
                  "Masuk ke Akun Anda",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blackText,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "Lanjutkan aksi kebaikanmu hari ini",
                  style: TextStyle(fontSize: 12, color: AppColor.greyText),
                ),

                const SizedBox(height: 24),

                const Text(
                  "Email atau Nomor Telepon",
                  style: TextStyle(fontSize: 12),
                ),

                const SizedBox(height: 8),

                TextFormField(
                  controller: emailController,
                  decoration: decorationConstant(hintText: "nama@email.com"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak boleh kosong";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                const Text("Kata Sandi", style: TextStyle(fontSize: 12)),

                const SizedBox(height: 8),

                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: decorationConstant(hintText: "••••••••"),
                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return "Password minimal 6 karakter";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Lupa Kata Sandi?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: AppColor.redSetetesColor,
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;

                      final user = await DBHelper.loginUser(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (user != null) {
                        await PreferenceHandler().storingIsLogin(true);

                        if (!mounted) return;

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Scaffold(
                              body: Center(
                                child: Text(
                                  "Masuk berhasil",
                                  style: TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Email atau password salah"),
                          ),
                        );
                      }
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Masuk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.login, size: 18, color: Colors.white),
                            ],
                          ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: AppColor.redSetetesColor,
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;

                      await DBHelper.registerUser(
                        UserEntity(
                          name: "User",
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Berhasil daftar")),
                      );
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Daftar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(Icons.login, size: 18, color: Colors.white),
                            ],
                          ),
                  ),
                ),

                const SizedBox(height: 16),

                SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      side: BorderSide(color: AppColor.greyText, width: 1),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      bool? isLogin = await PreferenceHandler.getIsLogin();
                      debugPrint("Is Login: $isLogin");
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/image 1.png", height: 24),
                        const SizedBox(width: 8),
                        Text(
                          "Lanjut via Google",
                          style: TextStyle(
                            color: AppColor.greyText,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Belum punya akun? ",
                          style: TextStyle(
                            color: AppColor.greyText2,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: "Daftar",
                          style: TextStyle(
                            color: AppColor.redSetetesColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration decorationConstant({required String hintText}) {
    return InputDecoration(
      hintText: hintText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColor.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColor.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColor.redSetetesColor),
      ),
    );
  }
}
