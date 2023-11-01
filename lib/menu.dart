import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<ShopItem> items = [
    ShopItem.withColor("Lihat Produk", Icons.checklist, const Color(0xffaeaeae)),
    ShopItem("Tambah Produk", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
    ShopItem("Grandpa sicko mode", Icons.accessible_forward),
    ShopItem("Baby deposit", Icons.baby_changing_station),
    ShopItem("This you?", Icons.money_off),
    ShopItem.withColor("Bikun tracker", Icons.bus_alert, const Color(0xffdbd248)),
    ShopItem.withColor("JSON moment", Icons.data_object, const Color(0xff7f7f7f)),
    ShopItem.withColor("Stonks", Icons.trending_up_sharp, const Color(0xff11cf3a)),
    ShopItem.withColor(";)", Icons.eighteen_up_rating_rounded, const Color(0xffffbafd)),
    ShopItem.withColor("Bro thought he's the thinker", Icons.psychology_alt, const Color(0xff7945a1))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

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
                  return ShopCard(item);
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
  late final Color color;

  ShopItem(this.name, this.icon){
    this.color = Colors.indigo;
  }

  ShopItem.withColor(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
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