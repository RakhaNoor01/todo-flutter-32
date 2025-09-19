// lib/pages/profile/profile_page.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // URL untuk gambar profil (placeholder)
    final String profileImageUrl = 'https://i.pravatar.cc/150?u=rakha';

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Saya'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),

              // Widget untuk menampilkan gambar profil berbentuk lingkaran
              CircleAvatar(
                radius: 60, // Ukuran lingkaran
                backgroundImage: NetworkImage("https://img.freepik.com/free-photo/cheerful-young-african-man-showing-thumbs-up_171337-9627.jpg?semt=ais_hybrid&w=740&q=80"),
                backgroundColor: Colors.grey[200], // Warna saat gambar loading
              ),
              SizedBox(height: 24),

              // Nama Pengguna
              Text(
                'Rakha Noor A. Admaja',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),

              // Info Detail Pengguna (Absen & Email)
              // Kita gunakan ListTile agar rapi dan ada ikonnya
              ListTile(
                leading: Icon(Icons.class_),
                title: Text('Nomor Absen'),
                subtitle: Text('32'),
              ),
              Divider(), // Garis pemisah
              ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text('Email'),
                subtitle: Text('RakhaNoor12@gmail.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}