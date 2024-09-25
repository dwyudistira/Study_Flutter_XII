import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yudistira Profile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      body: Center(
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            width: 350,
            height: 450,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                // Avatar dan gambar profil
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('PP.jpg'),
                ),
                const SizedBox(height: 16),
                // Nama dan kelas
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: const [
                      Text(
                        'Yudistira Dharma Wardana',
                        style: TextStyle(
                          fontSize: 22, 
                          fontWeight: FontWeight.bold, 
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'PPLG XII-1',
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Tombol untuk navigasi ke halaman profil
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 40.0),
                    backgroundColor: Colors.blueAccent, // Properti yang benar
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                  child: const Text(
                    'View Profile',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'background.jpg',  // Pastikan path image sesuai dengan folder yang digunakan
              fit: BoxFit.cover,
            ),
          ),
          // Konten di atas background
          SingleChildScrollView(
            child: Container(
              color: Colors.white.withOpacity(0.8),  // Transparansi background putih agar konten lebih jelas
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Avatar dan Nama
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('PP.jpg'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Yudistira Dharma Wardana',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Card: Informasi Pribadi
                  buildInfoCard(
                    title: 'About',
                    content: 'Saya adalah seorang siswa SMK Wikrama Bogor yang sedang menjalani studi di bidang PPLG. Saya memiliki tekad untuk menjadi seorang backend developer.',
                  ),
                  const SizedBox(height: 16),

                  // Card: History
                  buildInfoCard(
                    title: 'History',
                    content: 'Saya sudah hampir 2,5 tahun berada di SMK Wikrama, dan saya telah menjalani 6 bulan PKL di CV Kreasi Sawala Nusantara sebagai backend developer. Saya berkontribusi dalam pembangunan web invitation.',
                  ),
                  const SizedBox(height: 16),

                  // Card: Skill
                  buildInfoCard(
                    title: 'Skill',
                    content: 'Selama belajar di Wikrama, saya telah mempelajari banyak bahasa pemrograman seperti HTML, CSS, PHP, Laravel, Python, dan Docker. Selama PKL, saya menggunakan Laravel dan MySQL.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk membuat kartu informasi
  Widget buildInfoCard({required String title, required String content}) {
    return Container(
      width: double.infinity,
      child: Card(
        color: Colors.blueAccent,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                content,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
