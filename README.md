# hsr_inventory

hsr inventory moment

you can't download this app yet

fast track:<br>
-> [State machine](#statefully)<br>
-> [Get the wits](#what-did-wid-get)<br>
-> [listify](#obligatory-checklist-scene)<br>


## Checklist tugas 7

- [x] Membuat sebuah program Flutter baru dengan tema _inventory_ seperti tugas-tugas sebelumnya.
- [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:
    - [x] Melihat daftar item (`Lihat Item`)
    - [x] Menambah item (`Tambah Item`)
    - [x] Logout (`Logout`)
- [x] Memunculkan `Snackbar` dengan tulisan:
    - [x] "Kamu telah menekan tombol Lihat Item" ketika tombol `Lihat Item` ditekan.
    - [x] "Kamu telah menekan tombol Tambah Item" ketika tombol `Tambah Item` ditekan.
    - [x] "Kamu telah menekan tombol Logout" ketika tombol `Logout` ditekan.
- [x] Menjawab beberapa pertanyaan berikut pada `README.md` pada *root folder*.
    - [ ] Apa perbedaan utama antara _stateless_ dan _stateful widget_ dalam konteks pengembangan aplikasi Flutter?
    - [ ] Sebutkan seluruh _widget_ yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
    - [ ] Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- [x] Melakukan `add`-`commit`-`push` ke GitHub.


## statefully
> (Apa perbedaan utama antara _stateless_ dan _stateful widget_ dalam konteks pengembangan aplikasi Flutter?)

_Stateless widget_ adalah sebuah widget yang tidak dapat berubah (_static_), sedangkan _stateful widget_ adalah sebuah widget yang dapat berubah.

Sebuah stateless widget hanya di-_build_ sekali saja (yaitu saat aplikasi dimulai), sedangkan stateful widget dapat di-_build_ berkali-kali berdasarkan kebutuhan aplikasi dengan memanggil fungsi `setState(() {})` dengan argumen sebuah fungsi anonim yang mengubah suatu atribut dari widget itu sendiri.

## what did wid get
> Sebutkan seluruh _widget_ yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.

Di bawah ini merupakan semua widget yang digunakan dalam app ini.
- `MaterialApp`
> Widget ini berfungsi sebagai _container_ dari satu/beberapa widget, yang nanti akan dibungkus menjadi sebuah aplikasi.
> Widget ini menggunakan _Material Design_ sebagai _design language_ dari aplikasi tersebut.
> Widget ini juga menyediakan _routes_ yang dapat digunakan untuk menampilkan widget tertentu saja dengan menggunakan Navigator.
- `Scaffold`
> Widget ini berfungsi sebagai implementasi dasar dari _Material Design_, untuk mengikuti desain yang digunakan (lihat MaterialApp). 
- `AppBar`
> Widget ini menampil sebuah toolbar yang akan tetap berada di atas layar, bahkan jika user scroll ke bawah.
> Widget ini biasanya menampilkan title dan beberapa aksi yang dapat digunakan
- `Text`
> Widget ini mengandung teks yang dapat di-_customize_ sesuai style yang diberikan.
- `Padding`
> Widget ini menentukan jarak antar widget yang berada di widget pada child nya.
- `Column`
> Widget ini berfungsi sebagai _container_ yang akan menampilkan widgetnya secara vertikal, dari atas ke bawah.
- `Expanded`
> Widget ini berfungsi agar child dari widget ini akan memperluas agar sesuai dengan layar.
- `GridView`
> Widget ini berfungsi sebagai _container_ yang akan menampilkan widgetnya pada sebuah _grid_, dari kiri ke kanan, atas ke bawah.
- `Material`
> Salah satu fungsi widget ini yang digunakan adalah widget ini dapat menampilkan _ink effect_.  
- `InkWell`
> Sebuah widget segiempat yang responsif terhadap sentuhan dari user, dengan menampilkan sebuah animasi dengan menggunakan _ink effect_.
> Karena widget ini menampilkan _ink effect_ maka widget ini harus merupakan _direct child_ dari widget Material. 
- `Container`
> Widget ini akan menampilkan child widgetnya dengan transformasi (seperti padding, move, rotate), warna, dan/atau resize.
- `Center`
> Widget ini berfungsi sebagai _container_ yang akan menampilkan child widgetnya pada tengah dari widget ini sendiri.
- `Icon`
> Widget ini berfungsi menampilkan sebuah icon yang diberikan dari sebuah objek dengan class IconData.

## obligatory checklist scene
> Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

Checklist:
>Membuat sebuah program Flutter baru dengan tema _inventory_ seperti tugas-tugas sebelumnya.

Command `flutter create <app>` dapat digunakan untuk membuat suatu aplikasi _Flutter_ baru, atau bisa langsung dibuat tanpa menggunakan terminal menggunakan IDE seperti Android Studio.

>Membuat tiga tombol sederhana dengan ikon dan teks untuk:<br>
-> Melihat daftar item (`Lihat Item`)<br>
-> Menambah item (`Tambah Item`)<br>
-> Logout (`Logout`)<br>

Tombol tersebut dapat dibuat menggunakan berbagai macam widget, tetapi dalam aplikasi ini menggunakan widget `InkWell` (agar menampilkan animasi dan responsif terhadap sentuhan). 
Didalam widget tersebut terdapat widget `Container` -> `Center` -> `Column`, lalu isi dari `Column` tersebut terdapat `Icon` dan `Text`.
Isi dari Icon dan Text tersebut diambil dari data yang diberikan di objek dengan class `ShopItem`. Objek-objek tersebut telah di-_initialize_ sebelumnya


> Memunculkan `Snackbar` dengan tulisan:<br>
-> "Kamu telah menekan tombol Lihat Item" ketika tombol `Lihat Item` ditekan.<br>
-> "Kamu telah menekan tombol Tambah Item" ketika tombol `Tambah Item` ditekan.<br>
-> "Kamu telah menekan tombol Logout" ketika tombol `Logout` ditekan.<br>

Pada widget `InkWell` tersebut, kita dapat menentukan atribut `onTap` dengan suatu fungsi, yang akan dijalankan setiap kali pengguna menyentuh widget tersebut.
Pada fungsi tersebut dipanggil fungsi `ScaffoldMessenger.of(context)`, yang akan mengembalikan `State` dari `ScaffoldMessenger` yang digunakan untuk mengelola `SnackBar` yang muncul di bawah layar (seperti sebuah notifikasi). Dari objek `State` tersebut dapat dipanggil `showSnackBar()` yang akan menampilkan sebuah `SnackBar` di bawah layar dengan teks yang diberikan.
