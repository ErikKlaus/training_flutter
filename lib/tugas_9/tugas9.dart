import 'package:flutter/material.dart';
import 'models/models.dart';

class Tugas9 extends StatelessWidget {
  const Tugas9({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tugas 9 ListView Builder")),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ListKategoriPage(),
                      ),
                    );
                  },
                  child: const Text("List String"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ListMapPage()),
                    );
                  },
                  child: const Text("List Map"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ModelPage()),
                    );
                  },
                  child: const Text("Model"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListKategoriPage extends StatelessWidget {
  const ListKategoriPage({super.key});

  static const List<String> kategori = [
    "Buah-buahan",
    "Sayuran",
    "Elektronik",
    "Pakaian Pria",
    "Pakaian Wanita",
    "Alat Tulis Kantor",
    "Buku & Majalah",
    "Peralatan Dapur",
    "Makanan Ringan",
    "Minuman",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Kategori")),
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(kategori[index]));
        },
      ),
    );
  }
}

class ListMapPage extends StatelessWidget {
  const ListMapPage({super.key});

  static const List<Map<String, dynamic>> kategori = [
    {"nama": "Elektronik", "icon": Icons.phone_android},
    {"nama": "Pakaian Pria", "icon": Icons.man},
    {"nama": "Pakaian Wanita", "icon": Icons.woman},
    {"nama": "Buku & Majalah", "icon": Icons.book},
    {"nama": "Minuman", "icon": Icons.local_drink},
    {"nama": "Makanan Ringan", "icon": Icons.fastfood},
    {"nama": "Kosmetik", "icon": Icons.brush},
    {"nama": "Peralatan Dapur", "icon": Icons.kitchen},
    {"nama": "Mainan Anak", "icon": Icons.toys},
    {"nama": "Peralatan Olahraga", "icon": Icons.sports_soccer},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Map")),
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(kategori[index]["icon"] as IconData),
            title: Text(kategori[index]["nama"] as String),
          );
        },
      ),
    );
  }
}

class ModelPage extends StatelessWidget {
  const ModelPage({super.key});

  static final List<Produk> produk = [
    Produk(
      nama: "Laptop Gimang",
      deskripsi: "Core i7, RTX 4060",
      gambar:
          "https://image.made-in-china.com/2f0j00qoykHmVhMLcb/Professional-Laptop-Computer-14-15-6-Pocket-Laptop-Portable-Office-Retail-Notebooks-Thin-All-in-One-PC-High-Speed-Stock-Notebook-Keyboard-Laptops.webp",
    ),
    Produk(
      nama: "Handphone",
      deskripsi: "Samsung Bonar 5G",
      gambar:
          "https://images.euronics.hu/product_images/800x600/resize/s3_l1guv110.jpg?v=40",
    ),
    Produk(
      nama: "Tablet Roblox",
      deskripsi: "Advan Tab Bocil",
      gambar: "https://els.id/wp-content/uploads/2024/08/Advan-TAB-A10-8.jpg",
    ),
    Produk(
      nama: "Sepatu Super",
      deskripsi: "Ringan dan Sempit",
      gambar:
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/catalog-image/102/MTA-174075383/brd-44261_sepatu-sneakers-pria-footwear-sepatu-casual-kuliah-kerja-hangout-marvin-06-hitam-putih_full03-45249a69.jpg",
    ),
    Produk(
      nama: "Jaket Dilan",
      deskripsi: "Bekas Dede Inoen",
      gambar:
          "https://down-id.img.susercontent.com/file/f0b9593c4565a29304e7d6580ff4f100",
    ),
    Produk(
      nama: "Tas Rampok",
      deskripsi: "Muatan 1 Triliun",
      gambar:
          "https://down-id.img.susercontent.com/file/id-11134207-7rasl-m1wf6b6l12upda",
    ),
    Produk(
      nama: "Sawit Premium",
      deskripsi: "Sawit terbaik untuk masakan lezat",
      gambar:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNu8pEUzhkxNjLax9RvPQ4TZe17OUz6CC92A&s",
    ),
    Produk(
      nama: "Senter Super Terang",
      deskripsi: "Cocok untuk petualangan malam",
      gambar:
          "https://preview.redd.it/bahlil-maafkan-penyebar-meme-dirinya-saya-sudah-biasa-v0-l00v72l3eh9g1.png?width=834&format=png&auto=webp&s=e0fec136c405de4ab8e036083ff91dd9900ecf39",
    ),
    Produk(
      nama: "Amba Labu",
      deskripsi: "Boneka Lucu untuk Anak-anak",
      gambar:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRaFlBvz26D1TXUZA0qS62tL9PTbsvG8YdZAw&s",
    ),
    Produk(
      nama: "Rusdi Labu",
      deskripsi: "Boneka Seram untuk Koleksi",
      gambar:
          "https://i.pinimg.com/736x/e8/55/a8/e855a8cb17cd077bd051634f24fe6a92.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Model")),
      body: ListView.builder(
        itemCount: produk.length,
        itemBuilder: (context, index) {
          return ListProduk(produk: produk[index]);
        },
      ),
    );
  }
}

class ListProduk extends StatelessWidget {
  final Produk produk;

  const ListProduk({super.key, required this.produk});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(produk.gambar),
        title: Text(produk.nama),
        subtitle: Text(produk.deskripsi),
      ),
    );
  }
}
