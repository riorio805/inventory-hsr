import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem.withColor("Lihat Produk", Icons.checklist, const Color(0xffaeaeae)),
    ShopItem.withColor("Tambah Produk", Icons.add_shopping_cart, Colors.green.shade700),
    ShopItem("Logout", Icons.logout),
    ShopItem("Grandpa sicko mode", Icons.accessible_forward),
    ShopItem("Baby deposit", Icons.baby_changing_station),
    ShopItem.withColor("This you?", Icons.money_off, Colors.red.shade300),
    ShopItem.withColor("Bikun tracker", Icons.bus_alert, const Color(0xffdbd248)),
    ShopItem.withColor("JSON moment", Icons.data_object, const Color(0xff7f7f7f)),
    ShopItem.withColor("Stonks", Icons.trending_up_sharp, const Color(0xff11cf3a)),
    ShopItem.withColor(";)", Icons.eighteen_up_rating_rounded, const Color(0xffffbafd)),
    ShopItem.withColor("Bro thinks he's the thinker", Icons.psychology_alt, const Color(0xff7945a1))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: const Text(
          'hsr Inventory',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0), // Set padding dari halaman
        child: Column(
          // Widget untuk menampilkan children secara vertikal
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
              child: Text(
                'things!', // Text yang menandakan toko
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              // Grid layout
              child: GridView.extent(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                maxCrossAxisExtent: 250,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item:item);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ShopItem {
  final String name;
  final IconData icon;
  late Color color;

  ShopItem(this.name, this.icon){
    color = Colors.indigo;
  }

  ShopItem.withColor(this.name, this.icon, this.color);
}

class ShopCard extends StatefulWidget {
  final ShopItem item;

  const ShopCard({
    super.key,
    required this.item
  });

  @override
  State<ShopCard> createState() {
    return _ShopCardState();
  } // Constructor
}

class _ShopCardState extends State<ShopCard> {
  var rng = Random();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          debugPrint("asfsfw");
          setState(() {
            widget.item.color = Color.fromARGB(0xff,
                rng.nextInt(256), rng.nextInt(256), rng.nextInt(256));
          });
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..clearSnackBars()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${widget.item.name}!"))
            );
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.item.icon,
                  color: Colors.white,
                  size: 50.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  widget.item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}