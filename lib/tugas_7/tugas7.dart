import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: tugas7()));
}

class tugas7 extends StatefulWidget {
  @override
  State<tugas7> createState() => _tugas7State();
}

class _tugas7State extends State<tugas7> {
  String menu = "Checkbox";
  bool isChecked = false;
  bool isDark = false;
  String kategori = "Elektronik";
  DateTime? tanggal;
  TimeOfDay? jam;

  final Color primary = const Color(0xFFD61000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Colors.black : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: primary),
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
                  "Form Input",
                  style: TextStyle(
                    color: primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            item(Icons.check_box, "Checkbox"),
            item(Icons.toggle_on, "Switch"),
            item(Icons.list, "Dropdown"),
            item(Icons.date_range, "Tanggal"),
            item(Icons.access_time, "Jam"),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            content(),
            const SizedBox(height: 15),
            Text(
              hasil(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : primary,
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
      title: Text(title, style: TextStyle(color: primary)),
      onTap: () {
        setState(() => menu = title);
        Navigator.pop(context);
      },
    );
  }

  Widget content() {
    if (menu == "Checkbox") {
      return CheckboxListTile(
        activeColor: primary,
        title: Text(
          "Saya menyetujui semua persyaratan yang berlaku",
          style: TextStyle(color: isDark ? Colors.white : primary),
        ),
        value: isChecked,
        onChanged: (v) => setState(() => isChecked = v!),
      );
    }

    if (menu == "Switch") {
      return SwitchListTile(
        activeColor: primary,
        title: Text(
          "Aktifkan Mode Gelap",
          style: TextStyle(color: isDark ? Colors.white : primary),
        ),
        value: isDark,
        onChanged: (v) => setState(() => isDark = v),
      );
    }

    if (menu == "Dropdown") {
      return DropdownButtonFormField<String>(
        value: kategori,
        decoration: InputDecoration(
          labelText: "Pilih Kategori",
          labelStyle: TextStyle(color: primary),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primary),
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

    if (menu == "Tanggal") {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: primary),
          foregroundColor: primary,
        ),
        icon: Icon(Icons.calendar_today),
        label: Text("Pilih Tanggal"),
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

    if (menu == "Jam") {
      return OutlinedButton.icon(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: primary),
          foregroundColor: primary,
        ),
        icon: Icon(Icons.access_time),
        label: Text("Pilih Waktu"),
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
    if (menu == "Checkbox") {
      return isChecked
          ? "Lanjutkan pendaftaran diperbolehkan hehe"
          : "Woi belum bisa lanjut!";
    }

    if (menu == "Switch") {
      return isDark ? "Mode Gelap Aktif" : "Mode Terang Mati";
    }

    if (menu == "Dropdown") {
      return "Anda memilih kategori: $kategori";
    }

    if (menu == "Tanggal" && tanggal != null) {
      return "Tanggal Lahir: ${tanggal!.day}-${tanggal!.month}-${tanggal!.year}";
    }

    if (menu == "Jam" && jam != null) {
      final h = jam!.hourOfPeriod == 0 ? 12 : jam!.hourOfPeriod;
      final m = jam!.minute.toString().padLeft(2, '0');
      final p = jam!.period == DayPeriod.am ? "AM" : "PM";
      return "Jam: $h:$m $p";
    }

    return "";
  }
}
