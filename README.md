1. Cubit adalah versi yang lebih ringkas dan sederhana dari Bloc, di mana Anda cukup memanggil sebuah fungsi untuk langsung memancarkan (emit) state baru.
Bloc adalah versi yang lebih terstruktur yang menggunakan Events sebagai input untuk memicu perubahan State sebagai output.

2. Memisahkan (separasi) lapisan (layers) ini sangat penting karena mengikuti prinsip-prinsip desain perangkat lunak yang baik, khususnya Single Responsibility Principle (SRP) dan peningkatan Maintainability (kemudahan pemeliharaan).

3. 3 state
- CartInitialState (Awal)
Fungsi: Menunjukkan keadaan awal keranjang belanja saat pertama kali aplikasi dibuka atau saat Cubit baru dibuat. State ini mungkin berisi keranjang kosong atau sedang memuat data keranjang dari local storage atau server.

Data: Biasanya berupa state kosong, atau objek keranjang dengan daftar item kosong (items: []).

- CartLoadedState (Data Tersedia)
Fungsi: Menunjukkan bahwa data keranjang belanja telah berhasil dimuat dan tersedia untuk ditampilkan di UI. Ini adalah state yang paling sering dilihat pengguna.

Data: Membawa data keranjang yang lengkap, termasuk daftar item di keranjang (List<CartItem>) dan total harga (double total).

-CartProcessingState / CartLoadingState (Sedang Diproses)
Fungsi: Menunjukkan bahwa operasi penting sedang berlangsung yang membutuhkan waktu dan harus memblokir input pengguna, seperti:

Menambahkan/Menghapus item ke/dari server (jika berbasis API).

Memuat data keranjang dari server.

Melakukan Checkout (pemrosesan pembayaran).

Data: Biasanya berupa data state sebelumnya, ditambah flag boolean seperti isLoading: true atau isCheckingOut: true. UI akan menggunakan ini untuk menampilkan indikator loading.