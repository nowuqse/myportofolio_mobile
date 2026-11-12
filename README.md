# Portofolio
```
Name : Cindy Olivia Chai

NPM : 2506615753

Class : PBP C
```

## Description

This project is a personal mobile portfolio application built with Flutter. It contains information about me, from my background, projects, and experiences. The application serves as a way to introduce myself, and it will be continuously developed throughout the semester as part of my coursework for PBP :D. Moving from a web-based portfolio to a mobile app allows for a more interactive and accessible user experience right from the user's pocket.

### Tools

- Flutter
- Dart

### Setup Instructions

Prerequisites:

- Flutter SDK must be installed on your device.
- Make sure Flutter is properly configured by running flutter doctor in your terminal.
- Make sure you have a suitable IDE (such as VS Code or Android Studio) and an emulator or physical device to run the application.

1. Clone Repository 
```bash
git clone https://github.com/nowuqse/myportofolio_mobile.git
cd myportofolio_mobile
```

2. Install Dependencies
```bash
flutter pub get
```

3. Run the Application
```bash
flutter run
```

## Progress Logs

| Week | Progress |
|------|----------|
| 1-7 | (Web Version) Built the foundation using Django, implemented MVT architecture, forms, authentication, and REST API with AJAX integration. |
| 7 | Migrated the project to Flutter. Set up the initial project structure. Refactored the main page into separate files (main.dart and menu.dart), changed MyHomePage to StatelessWidget, and implemented dynamic UI cards (InfoCard & ItemCard) |

## Jawaban Tugas

### Tugas 7

1. Widget tree adalah struktur hierarki yang menggambarkan hubungan antar-widget dalam aplikasi Flutter. Setiap widget dapat memiliki widget lain sebagai anak (child), sehingga membentuk struktur seperti pohon. Widget yang berada di atas disebut parent, sedangkan widget di dalamnya disebut child. Parent bertugas mengatur bagaimana child ditampilkan, misalnya melalui pengaturan posisi, ukuran, warna, maupun tata letak.

Pada tugas MyPortfolio Mobile ini, widget tree dimulai dari `MyApp` sebagai root widget, kemudian memiliki `MaterialApp` yang menggunakan `MyHomePage` sebagai halaman utama. Di dalam `MyHomePage`, terdapat `Scaffold` yang menjadi struktur dasar halaman. `Scaffold` kemudian memiliki `AppBar` dan `Padding` sebagai bagian dari tampilannya. Di dalam `Padding` terdapat `Column` yang menyusun informasi dan menu secara vertikal. Selanjutnya, `Column` memiliki beberapa child seperti `Row`, `InfoCard`, `SizedBox`, `Center`, dan `GridView.count`.

Hubungan parent-child ini membuat tampilan aplikasi dapat dibangun dari widget-widget kecil yang masing-masing memiliki fungsi tertentu. Misalnya, `Row` digunakan untuk menyusun tiga `InfoCard` secara horizontal, sedangkan `Column` digunakan untuk menyusun beberapa bagian secara vertikal. Dengan begitu, setiap widget dapat memiliki tanggung jawab masing-masing tanpa harus membuat seluruh tampilan dalam satu widget yang kompleks.

2. Widget yang digunakan dalam tugas ini antara lain:

\- `MaterialApp`: Menjadi pembungkus utama aplikasi yang menyediakan konfigurasi seperti judul, tema, dan halaman utama.

\- `Scaffold`: Menyediakan struktur dasar halaman aplikasi, seperti AppBar dan Body.

\- `AppBar`: Menampilkan bagian atas aplikasi dengan judul MyPortfolio.

\- `Text`: Menampilkan teks seperti judul aplikasi, informasi pengguna, pesan sambutan, dan nama menu.

\- `Padding`: Memberikan jarak di sekitar widget agar konten tidak terlalu menempel pada bagian tepi layar.

\- `Column`: Menyusun widget secara vertikal, misalnya untuk menampilkan informasi dan bagian menu.

\- `Row`: Menyusun widget secara horizontal, seperti tiga InfoCard yang menampilkan NPM, nama, dan kelas.

\- `SizedBox`: Memberikan jarak dengan ukuran tertentu antara widget.

\- `Center`: Menempatkan child widget di bagian tengah.

\- `GridView.count`: Menampilkan kumpulan menu dalam bentuk grid dengan jumlah kolom yang sudah ditentukan. Pada tugas ini digunakan tiga kolom untuk menampilkan menu Lihat Proyek, Tambah Proyek, dan Logout.

\- `Card`: Membuat tampilan informasi dalam bentuk kartu yang memiliki efek elevasi atau bayangan.

\- `Container`: Mengatur ukuran, padding, dan tata letak konten di dalamnya.

\- `Material`: Menyediakan tampilan dengan material design, termasuk warna dan bentuk kartu menu.

\- `InkWell`: Memberikan interaksi ketika pengguna menekan kartu menu melalui `onTap`. Pada tugas ini, ketika kartu ditekan, aplikasi akan menampilkan `SnackBar`.

\- `Icon`: Menampilkan ikon yang sesuai dengan masing-masing menu, seperti folder, add circle, dan logout.

Selain widget bawaan Flutter, saya juga membuat beberapa custom widget dengan arahan dari tutorial menggunakan `StatelessWidget`, yaitu `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard`. `InfoCard` digunakan untuk menampilkan informasi pengguna dalam bentuk kartu, sedangkan `ItemCard` digunakan untuk menampilkan setiap menu beserta ikon dan warnanya.

3. `MaterialApp` berfungsi sebagai pembungkus utama yang menyediakan semua kebutuhan dasar aplikasi berbasis Material Design. Widget ini mengonfigurasi tema aplikasi, mendefinisikan halaman awal (`home`), mengatur sistem navigasi (`routing`), serta mendukung fitur lokalisasi dan aksesibilitas. `MaterialApp` umumnya digunakan sebagai root widget karena aplikasi Flutter butuh fondasi tema dan navigasi yang konsisten. Jika `MaterialApp` tidak ada, kita harus mengonfigurasi semua itu secara manual, sehingga kode menjadi jauh lebih kompleks dan tidak terstruktur.r.

4. `StatelessWidget` adalah widget yang sifatnya statis (immutable); artinya, konfigurasinya tidak bisa berubah setelah dibuat, dan UI-nya tidak akan berubah kecuali ada rebuild dari luar (misalnya dari induknya). Sementara `StatefulWidget` bersifat dinamis; widget ini memiliki objek `State` yang menyimpan data, dan data tersebut bisa diubah selama aplikasi berjalan (menggunakan `setState`), yang memicu proses rebuild UI.

Kita memilih `StatelessWidget` jika UI-nya hanya menampilkan data statis, tidak bergantung pada interaksi user secara internal (seperti halaman profil, teks, atau ikon). Sebaliknya, kita memilih `StatefulWidget` jika UI harus berubah sesuai interaksi user atau data yang berubah (misalnya form input, status loading, atau tombol yang warnanya berubah saat di-klik).

5. `BuildContext` merupakan objek yang menyimpan informasi mengenai posisi sebuah widget di dalam widget tree. Dengan `BuildContext`, sebuah widget dapat mengakses informasi atau layanan yang disediakan oleh widget-widget di atasnya dalam hierarki. `BuildContext` digunakan sebagai parameter pada metode `build(BuildContext context)` yang dimiliki oleh widget. Melalui `context` tersebut, kita dapat mengakses berbagai informasi yang dibutuhkan untuk membangun tampilan, misalnya tema aplikasi, ukuran layar, maupun fungsi tertentu yang tersedia pada widget parent.

Pada tugas ini, saya menggunakan `BuildContext` dalam beberapa bagian. Contohnya:

`Theme.of(context).colorScheme.primary`

Kode tersebut digunakan untuk mengambil warna utama dari tema aplikasi yang sudah didefinisikan di `MaterialApp`.

Selain itu, saya juga menggunakan:

`MediaQuery.of(context).size.width`

untuk mendapatkan lebar layar perangkat. Nilai tersebut digunakan untuk menyesuaikan lebar `InfoCard` berdasarkan ukuran layar agar tampilannya lebih proporsional.

Contoh lainnya terdapat pada `ItemCard`, yaitu:

```
ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
    );
```

Kode tersebut menggunakan `context` untuk mengakses `ScaffoldMessenger` yang bertugas menampilkan `SnackBar` ketika pengguna menekan salah satu menu. Dengan begitu, `BuildContext` tidak hanya digunakan untuk membangun tampilan, tetapi juga untuk mengakses berbagai fitur dan informasi yang tersedia dalam widget tree.

6. `Hot reload` adalah fitur Flutter yang memungkinkan kita melihat perubahan kode (terutama perubahan pada UI atau logika) secara instan tanpa kehilangan state (data) aplikasi. Ketika kita menekan `r` di terminal, Flutter hanya mengompilasi ulang kode yang berubah dan menyuntikkannya ke aplikasi yang sedang berjalan.

`Hot restart` adalah proses memulai ulang aplikasi (UI dibangun ulang dari nol) tetapi masih lebih cepat daripada full restart karena engine Flutter tetap berjalan. Perbedaannya, `hot restart` menghapus semua state dan mengembalikan aplikasi ke kondisi awal (seperti `main()` dijalankan ulang).

Kita tidak bisa mengandalkan `hot reload` ketika:

- Terjadi perubahan pada state (misalnya kita mengubah isi variabel awal di state yang sudah berjalan; `hot reload` tidak akan mengubah nilai variabel yang sudah diinisialisasi).
- Mengubah kode native, seperti Java/Kotlin di Android atau Swift di iOS. `Hot Reload` hanya bekerja untuk kode Dart.
- Mengubah struktur `main` atau inisialisasi global (seperti konfigurasi di `main.dart` yang dijalankan sekali). Perubahan pada variabel global atau inisialisasi di fungsi `main()` tidak akan terbaca tanpa restart.
- Mengubah dependencies (menambah/menghapus package di `pubspec.yaml`). Untuk kasus seperti ini kita harus berhenti, menjalankan `flutter pub get`, dan me-restart aplikasi.
- Mengubah tipe data atau signature fungsi secara drastis yang menyebabkan state lama tidak kompatibel dengan kode baru.

Jika hal-hal di atas terjadi, kita harus melakukan `hot restart` (tekan `R` di terminal) atau `full restart` (hentikan `flutter run` lalu jalankan lagi).

## AI Disclosure

For this task (week 7), I used ChatGPT and DeepSeek to learn the basics of Flutter, from downloading the SDK to choosing a platform to run my code. Rather than directly copying the generated code, I used AI to help me understand and fix problems, such as issues regarding Gradle configuration in Android Studio, as well as refactoring the code into separate files (menu.dart and main.dart).

I also used ChatGPT to understand the purpose and functionality of the widgets used in my project, including how they interact with each other through the widget tree. Additionally, I asked for explanations of concepts such as MaterialApp, StatelessWidget, StatefulWidget, and BuildContext to better understand how Flutter works beyond just writing the code. AI was also used to help me structure and refine the explanations in my README, particularly when describing the widget tree, the widgets used, and the differences between hot reload and hot restart. I made sure to review the explanations and relate them to my actual implementation so that I could understand what each part of the code does.

One key limitation is that I still had to limit the context and provide full, precise context to the AI so that its answers wouldn't be overkill or irrelevant. If I gave too little context, the AI would produce generic solutions that didn't fit my project structure. Conversely, if I gave too much unrelated context, the AI's response became bloated and unfocused. I had to carefully scope my prompts

I applied a specific and contextual prompting strategy instead of asking AI to generate the whole code. Examples of prompts I used:

- Guide me through finding my Flutter SDK location on Windows and explain how to configure it in VS Code
- Explain the purpose of each widget used in my main.dart and menu.dart files, including how they are structured in the widget tree
- Please review my README explanations and improve the formatting while keeping my original wording and writing style
- Explain the differences between StatelessWidget and StatefulWidget, and why we use StatelessWidget best here

