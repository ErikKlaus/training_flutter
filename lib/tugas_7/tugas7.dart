import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: tugas7()));
}

class tugas7 extends StatefulWidget {
  @override
  State<tugas7> createState() => _tugas7State();
}

class _tugas7State extends State<tugas7> {
  String menu = "Syarat & Ketentuan";
  bool isChecked = false;
  bool isDark = false;
  String kategori = "Elektronik";
  DateTime? tanggal;
  TimeOfDay? jam;

  final Color primary = const Color(0xFFD61000);
  final Color accent = const Color.fromARGB(255, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: accent),
        title: Text(
          menu,
          style: TextStyle(color: primary, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Tugas 7 Flutter",
                  style: TextStyle(
                    color: primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            item(Icons.check_box, "Syarat & Ketentuan"),
            item(Icons.toggle_on, "Mode Gelap"),
            item(Icons.list, "Pilih Kategori Produk"),
            item(Icons.date_range, "Pilih Tanggal Lahir"),
            item(Icons.access_time, "Atur Pengingat"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            content(),
            const SizedBox(height: 20),
            Text(
              hasil(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : accent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget item(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: primary),
      title: Text(title, style: TextStyle(color: accent)),
      onTap: () {
        setState(() => menu = title);
        Navigator.pop(context);
      },
    );
  }

  Widget content() {
    if (menu == "Syarat & Ketentuan") {
      return CheckboxListTile(
        activeColor: primary,
        title: Text(
          "Saya menyetujui semua persyaratan yang berlaku",
          style: TextStyle(color: isDark ? Colors.white : accent),
        ),
        value: isChecked,
        onChanged: (v) => setState(() => isChecked = v!),
      );
    }

    if (menu == "Mode Gelap") {
      return SwitchListTile(
        activeColor: primary,
        title: Text(
          "Aktifkan Mode Gelap",
          style: TextStyle(color: isDark ? Colors.white : accent),
        ),
        value: isDark,
        onChanged: (v) => setState(() => isDark = v),
      );
    }

    if (menu == "Pilih Kategori Produk") {
      return DropdownButtonFormField<String>(
        value: kategori,
        decoration: InputDecoration(
          labelText: "Pilih Kategori Produk",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: accent),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary, width: 2),
          ),
        ),
        items: [
          "Elektronik",
          "Pakaian",
          "Makanan",
          "Lainnya",
        ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
        onChanged: (v) => setState(() => kategori = v!),
      );
    }

    if (menu == "Pilih Tanggal Lahir") {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: accent),
          foregroundColor: accent,
        ),
        icon: Icon(Icons.calendar_today),
        label: Text("Pilih Tanggal Lahir"),
        onPressed: () async {
          final p = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );
          if (p != null) setState(() => tanggal = p);
        },
      );
    }

    if (menu == "Atur Pengingat") {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: accent),
          foregroundColor: accent,
        ),
        icon: Icon(Icons.access_time),
        label: Text("Pilih Waktu Pengingat"),
        onPressed: () async {
          final p = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (p != null) setState(() => jam = p);
        },
      );
    }

    return Container();
  }

  String hasil() {
    if (menu == "Syarat & Ketentuan") {
      return isChecked
          ? "Lanjutkan pendaftaran diperbolehkan"
          : "Anda belum bisa melanjutkan";
    }

    if (menu == "Mode Gelap") {
      return isDark ? "Mode Gelap Aktif" : "Mode Terang Aktif";
    }

    if (menu == "Pilih Kategori Produk") {
      return "Anda memilih kategori: $kategori";
    }

    if (menu == "Pilih Tanggal Lahir" && tanggal != null) {
      return "Tanggal Lahir: ${tanggal!.day} ${namaBulan(tanggal!.month)} ${tanggal!.year}";
    }

    if (menu == "Atur Pengingat" && jam != null) {
      final h = jam!.hourOfPeriod == 0 ? 12 : jam!.hourOfPeriod;
      final m = jam!.minute.toString().padLeft(2, '0');
      final p = jam!.period == DayPeriod.am ? "AM" : "PM";
      return "Pengingat diatur pukul: $h:$m $p";
    }

    return "";
  }

  String namaBulan(int bulan) {
    const list = [
      "",
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember",
    ];
    return list[bulan];
  }
}
