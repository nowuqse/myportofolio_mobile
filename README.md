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
| 8 | Added Project and Experience forms with input validation, date pickers, summary dialogs, responsive cards, and navigation through action cards and the drawer. |

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

\- `GridView.count`: Menampilkan kumpulan menu dalam bentuk grid dengan jumlah kolom yang sudah ditentukan. Pada tugas ini digunakan tiga kolom untuk menampilkan menu View Projects, Add Project, dan Add Experience.

\- `Card`: Membuat tampilan informasi dalam bentuk kartu yang memiliki efek elevasi atau bayangan.

\- `Container`: Mengatur ukuran, padding, dan tata letak konten di dalamnya.

\- `Material`: Menyediakan tampilan dengan material design, termasuk warna dan bentuk kartu menu.

\- `InkWell`: Memberikan interaksi ketika pengguna menekan kartu menu melalui `onTap`. Pada tugas ini, kartu Add Project dan Add Experience menggunakan `Navigator.push()` untuk membuka halaman formulir yang sesuai.

\- `Icon`: Menampilkan ikon yang sesuai dengan masing-masing menu, seperti folder, add circle, dan work outline.

Selain widget bawaan Flutter, saya juga membuat beberapa custom widget dengan arahan dari tutorial menggunakan `StatelessWidget`, yaitu `MyApp`, `MyHomePage`, `InfoCard`, dan `ItemCard`. `InfoCard` digunakan untuk menampilkan informasi pengguna dalam bentuk kartu, sedangkan `ItemCard` digunakan untuk menampilkan setiap menu beserta ikon dan warnanya.

3. `MaterialApp` berfungsi sebagai pembungkus utama yang menyediakan semua kebutuhan dasar aplikasi berbasis Material Design. Widget ini mengonfigurasi tema aplikasi, mendefinisikan halaman awal (`home`), mengatur sistem navigasi (`routing`), serta mendukung fitur lokalisasi dan aksesibilitas. `MaterialApp` umumnya digunakan sebagai root widget karena aplikasi Flutter butuh fondasi tema dan navigasi yang konsisten. Jika `MaterialApp` tidak ada, kita harus mengonfigurasi semua itu secara manual, sehingga kode menjadi jauh lebih kompleks dan tidak terstruktur.

4. `StatelessWidget` adalah widget yang sifatnya statis (immutable); artinya, konfigurasinya tidak bisa berubah setelah dibuat, dan UI-nya tidak akan berubah kecuali ada rebuild dari luar (misalnya dari induknya). Sementara `StatefulWidget` bersifat dinamis; widget ini memiliki objek `State` yang menyimpan data, dan data tersebut bisa diubah selama aplikasi berjalan (menggunakan `setState`), yang memicu proses rebuild UI.

Kita memilih `StatelessWidget` jika UI-nya hanya menampilkan data statis, tidak bergantung pada interaksi user secara internal (seperti halaman profil, teks, atau ikon). Sebaliknya, kita memilih `StatefulWidget` jika UI harus berubah sesuai interaksi user atau data yang berubah (misalnya form input, status loading, atau tombol yang warnanya berubah saat di-klik).

5. `BuildContext` merupakan objek yang menyimpan informasi mengenai posisi sebuah widget di dalam widget tree. Dengan `BuildContext`, sebuah widget dapat mengakses informasi atau layanan yang disediakan oleh widget-widget di atasnya dalam hierarki. `BuildContext` digunakan sebagai parameter pada metode `build(BuildContext context)` yang dimiliki oleh widget. Melalui `context` tersebut, kita dapat mengakses berbagai informasi yang dibutuhkan untuk membangun tampilan, misalnya tema aplikasi, ukuran layar, maupun fungsi tertentu yang tersedia pada widget parent.

Pada tugas ini, saya menggunakan `BuildContext` dalam beberapa bagian. Contohnya:

`Theme.of(context).colorScheme.primary`

Kode tersebut digunakan untuk mengambil warna utama dari tema aplikasi yang sudah didefinisikan di `MaterialApp`.

Contoh lainnya terdapat pada `ItemCard`, yaitu penggunaan `Navigator.push(context, route)` untuk membuka halaman Add Project atau Add Experience. Pada bagian ini, `context` digunakan oleh `Navigator` untuk menemukan navigator yang tersedia di dalam widget tree. `BuildContext` juga digunakan ketika menampilkan dialog melalui `showDialog()` dan ketika mengambil warna aplikasi melalui `Theme.of(context)`. Dengan begitu, `BuildContext` tidak hanya digunakan untuk membangun tampilan, tetapi juga untuk mengakses berbagai fitur dan informasi yang tersedia dalam widget tree.

6. `Hot reload` adalah fitur Flutter yang memungkinkan kita melihat perubahan kode (terutama perubahan pada UI atau logika) secara instan tanpa kehilangan state (data) aplikasi. Ketika kita menekan `r` di terminal, Flutter hanya mengompilasi ulang kode yang berubah dan menyuntikkannya ke aplikasi yang sedang berjalan.

`Hot restart` adalah proses memulai ulang aplikasi (UI dibangun ulang dari nol) tetapi masih lebih cepat daripada full restart karena engine Flutter tetap berjalan. Perbedaannya, `hot restart` menghapus semua state dan mengembalikan aplikasi ke kondisi awal (seperti `main()` dijalankan ulang).

Kita tidak bisa mengandalkan `hot reload` ketika:

- Terjadi perubahan pada state (misalnya kita mengubah isi variabel awal di state yang sudah berjalan; `hot reload` tidak akan mengubah nilai variabel yang sudah diinisialisasi).
- Mengubah kode native, seperti Java/Kotlin di Android atau Swift di iOS. `Hot Reload` hanya bekerja untuk kode Dart.
- Mengubah struktur `main` atau inisialisasi global (seperti konfigurasi di `main.dart` yang dijalankan sekali). Perubahan pada variabel global atau inisialisasi di fungsi `main()` tidak akan terbaca tanpa restart.
- Mengubah dependencies (menambah/menghapus package di `pubspec.yaml`). Untuk kasus seperti ini kita harus berhenti, menjalankan `flutter pub get`, dan me-restart aplikasi.
- Mengubah tipe data atau signature fungsi secara drastis yang menyebabkan state lama tidak kompatibel dengan kode baru.

Jika hal-hal di atas terjadi, kita harus melakukan `hot restart` (tekan `R` di terminal) atau `full restart` (hentikan `flutter run` lalu jalankan lagi).

### Tugas 8

1. `Navigator.push()`, `Navigator.pushReplacement()`, dan `Navigator.pop()` merupakan metode navigasi pada Flutter yang digunakan untuk mengatur perpindahan antarhalaman. Ketiganya memiliki perbedaan dalam cara mengelola navigation stack, yaitu struktur yang menyimpan urutan halaman yang sedang dibuka dalam aplikasi.

   - `Navigator.push()`: Digunakan untuk membuka halaman baru dengan menambahkannya ke navigation stack tanpa menghapus halaman sebelumnya. Dengan begitu, pengguna dapat kembali ke halaman sebelumnya menggunakan tombol kembali.
   - `Navigator.pushReplacement()`: Digunakan untuk membuka halaman baru dengan menggantikan halaman yang sedang aktif pada navigation stack. Berbeda dengan `push()`, halaman sebelumnya akan dihapus dari stack sehingga pengguna tidak dapat kembali ke halaman tersebut melalui tombol kembali.
   - `Navigator.pop()`: Digunakan untuk menutup halaman atau route yang sedang aktif dan kembali ke halaman sebelumnya dalam navigation stack. Metode ini juga dapat digunakan untuk menutup dialog yang ditampilkan menggunakan `showDialog()`.

   Pada tugas MyPortfolio Mobile ini, saya menggunakan `Navigator.push()` untuk membuka halaman formulir melalui kartu aksi pada halaman utama. Implementasinya terdapat pada widget `ItemCard`, yaitu ketika pengguna menekan kartu **Add Project** atau **Add Experience**, aplikasi akan membuka `ProjectFormPage` atau `ExperienceFormPage` menggunakan `MaterialPageRoute`. Penggunaan `push()` memungkinkan pengguna kembali ke halaman utama melalui tombol kembali karena halaman utama masih tersimpan dalam navigation stack.

   Sementara itu, pada widget `LeftDrawer`, saya menggunakan `Navigator.pushReplacement()` untuk navigasi antarhalaman. Salah satu contohnya adalah opsi **Home**, yang akan membuka `MyHomePage` dengan menggantikan halaman yang sedang aktif. Dengan begitu, ketika pengguna sedang berada di halaman formulir dan memilih Home melalui drawer, aplikasi akan kembali menampilkan halaman utama tanpa menambahkan halaman baru di atas halaman formulir.

2. `Scaffold`, `AppBar`, dan `Drawer` merupakan widget yang digunakan untuk membangun struktur dasar halaman aplikasi Flutter. Ketiganya membantu menjaga konsistensi tampilan karena setiap halaman dapat menggunakan susunan komponen yang sama meskipun memiliki konten yang berbeda.

   `Scaffold` berfungsi sebagai kerangka utama halaman yang menyediakan berbagai bagian seperti `AppBar`, `Drawer`, dan `body`. `AppBar` digunakan untuk menampilkan bagian atas halaman, termasuk judul dan tombol navigasi, sedangkan `Drawer` menyediakan menu navigasi yang dapat digunakan untuk berpindah antarhalaman aplikasi.

   Pada tugas MyPortfolio Mobile ini, saya menggunakan `Scaffold` pada `MyHomePage`, `ProjectFormPage`, dan `ExperienceFormPage`. Setiap halaman memiliki `AppBar` yang menampilkan judul sesuai dengan halaman tersebut, serta menggunakan widget `LeftDrawer` yang sama. Dengan begitu, pengguna tetap dapat mengakses menu Home, Add Project, Add Experience, dan Logout dari halaman yang berbeda tanpa perlu membuat drawer secara terpisah.

   Salah satu contoh penggunaan warna yang konsisten terdapat pada `AppBar` halaman `ProjectFormPage` dan `ExperienceFormPage`, yang sama-sama menggunakan `Colors.indigo` sebagai warna latar belakang dan `Colors.white` sebagai warna teks. Selain itu, tombol Save pada kedua formulir juga menggunakan warna indigo. Penggunaan warna yang sama membantu menjaga identitas visual aplikasi portofolio agar terlihat lebih konsisten.

3. Tata letak formulir pada tugas ini dipilih agar setiap input dapat ditampilkan secara terstruktur, mudah dibaca, dan mudah digunakan oleh pengguna. Pada halaman `ProjectFormPage` dan `ExperienceFormPage`, saya menggunakan `Column` untuk menyusun berbagai komponen formulir secara vertikal, mulai dari input teks, pilihan kategori, pemilihan tanggal pada Experience Form, hingga tombol Save.

   Susunan vertikal ini dipilih karena pengguna dapat mengisi formulir secara berurutan dari atas ke bawah. Selain itu, tata letak tersebut lebih sesuai untuk formulir yang memiliki beberapa jenis input dengan kebutuhan ruang yang berbeda.

   Beberapa widget yang digunakan untuk mengatur tata letak formulir antara lain:

   - `Column`: Menyusun komponen formulir secara vertikal sehingga setiap input ditampilkan secara berurutan.
   - `Padding`: Memberikan jarak di sekitar widget agar kolom input tidak terlalu menempel pada tepi layar maupun komponen lainnya. Pada `ProjectFormPage`, setiap input dibungkus menggunakan `Padding`.
   - `SizedBox`: Memberikan jarak dengan ukuran tertentu antar-widget. Pada `ExperienceFormPage`, `SizedBox` digunakan untuk mengatur jarak antara input teks, dropdown, tombol pemilihan tanggal, dan tombol Save.
   - `SingleChildScrollView`: Memungkinkan halaman digulir secara vertikal ketika seluruh komponen formulir tidak dapat ditampilkan sekaligus dalam ruang layar yang tersedia.

   Penggunaan `SingleChildScrollView` menjadi penting karena ukuran layar perangkat dapat berbeda-beda, terutama ketika aplikasi dijalankan pada perangkat mobile. Selain itu, ketika keyboard muncul saat pengguna mengisi `TextFormField`, ruang yang tersedia untuk menampilkan formulir akan berkurang. Dengan adanya widget penggulir, pengguna tetap dapat mengakses input maupun tombol Save yang berada di bagian bawah halaman tanpa mengalami masalah overflow.

4. `GlobalKey<FormState>`, `validator`, dan `validate()` merupakan komponen yang digunakan untuk mengelola serta memeriksa validitas input pada form di Flutter.

   `GlobalKey<FormState>` berfungsi sebagai key yang memberikan akses terhadap state dari widget `Form`. Pada tugas ini, saya mendeklarasikannya menggunakan:

   ```dart
   final _formKey = GlobalKey<FormState>();
   ```

   Key tersebut kemudian diberikan kepada widget `Form` melalui properti `key: _formKey`, sehingga state formulir dapat diakses dari bagian lain dalam widget, termasuk ketika tombol Save ditekan.

   `validator` merupakan fungsi yang digunakan untuk menentukan apakah nilai pada suatu input sudah memenuhi ketentuan yang ditetapkan. Fungsi ini akan mengembalikan pesan kesalahan berupa `String` apabila input tidak valid, atau `null` apabila input valid. Pada tugas ini, validator digunakan untuk memeriksa beberapa kondisi, seperti input yang tidak boleh kosong, panjang maksimal nama proyek atau pengalaman, kategori yang harus sesuai dengan pilihan tersedia, serta format URL pada Project Form.

   Sementara itu, `validate()` digunakan untuk menjalankan seluruh validator yang terdaftar dalam `Form`. Pada implementasi tombol Save, saya menggunakan:

   ```dart
   if (_formKey.currentState!.validate()) {
     showDialog(
       context: context,
       builder: (context) {
         return AlertDialog(
           // Menampilkan ringkasan input
         );
       },
     );
   }
   ```

   Ketika pengguna menekan tombol Save, `validate()` akan memeriksa seluruh input yang memiliki validator. Jika terdapat input yang tidak valid, fungsi akan mengembalikan `false` dan menampilkan pesan kesalahan pada kolom terkait. Sebaliknya, jika seluruh input valid, fungsi akan mengembalikan `true` sehingga aplikasi dapat menampilkan `AlertDialog` yang berisi ringkasan data yang telah diisi.

   Salah satu contoh input yang ditolak adalah ketika pengguna memasukkan `abc123` pada kolom Project Link. Meskipun kolom tersebut bersifat opsional, nilai yang diisi harus memiliki format URL yang valid, misalnya `https://github.com/example`. Input `abc123` akan ditolak karena tidak memiliki skema `http` atau `https` dan nama host yang valid.

   Memilih jenis input atau papan ketik saja belum cukup untuk memastikan validitas data. Sebagai contoh, penggunaan `keyboardType: TextInputType.url` hanya membantu menampilkan papan ketik yang lebih sesuai untuk memasukkan URL, tetapi tidak mencegah pengguna mengetik teks dengan format yang salah. Oleh karena itu, penggunaan `validator` tetap diperlukan untuk memastikan bahwa data yang dimasukkan memenuhi ketentuan sebelum diproses lebih lanjut.

   Pada `ExperienceFormPage`, validasi juga diterapkan pada input Start Date menggunakan `FormField<DateTime>`. Dengan begitu, pemilihan tanggal dapat diperiksa melalui `validate()` bersama input lainnya, dan pesan kesalahan dapat ditampilkan ketika pengguna belum memilih tanggal mulai. Hal ini memastikan bahwa dialog ringkasan hanya muncul setelah seluruh input wajib berhasil melewati proses validasi.

## AI Disclosure

For this task (week 8), I used ChatGPT to help me understand and implement form creation, input validation, and navigation in Flutter. Rather than directly copying the generated code, I used AI to understand how different widgets and methods work, including `Navigator.push()`, `Navigator.pushReplacement()`, `Navigator.pop()`, `TextFormField`, `DropdownButtonFormField`, and `FormField<DateTime>`. I also asked for explanations of how navigation stacks work and how the Scaffold, AppBar, and Drawer help maintain a consistent structure across different pages.

Additionally, I used ChatGPT to review and improve the implementation of my Project Form and Experience Form, particularly by adding input validation for required fields, maximum character lengths, valid URLs, and date selection. AI helped me understand the roles of `GlobalKey<FormState>`, `validator`, and `validate()`, as well as how `showDialog()`, `AlertDialog`, and `setState()` work when displaying form summaries and resetting input values. I also used AI to check whether my implementation met the task requirements and to help structure and refine the explanations in my README. Throughout the process, I reviewed the suggested changes and made sure I understood the logic behind each implementation rather than simply using the generated code.

One key limitation is that I still had to limit the context and provide full, precise context to the AI so that its answers wouldn't be overkill or irrelevant. If I gave too little context, the AI would produce generic solutions that didn't fit my project structure. Conversely, if I gave too much unrelated context, the AI's response became bloated and unfocused. I had to carefully scope my prompts.

I applied a specific and contextual prompting strategy instead of asking AI to generate the whole code. Examples of prompts I used:

- Explain the differences between Navigator.push(), Navigator.pushReplacement(), and Navigator.pop() using my current navigation flow
- Help me identify why the InfoCard Row overflows on a narrow screen and explain why Expanded fixes it
- Help me add appropriate validators to my Project Form and Experience Form without changing the overall logic or structure of my existing code.
- Explain how GlobalKey<FormState>, validator, and validate() work together when the Save button is pressed.
- Explain the differences between FormField<DateTime> and OutlinedButton.icon, and why using FormField allows date inputs to be validated through FormState.validate().

