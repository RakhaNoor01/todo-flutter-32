// lib/pages/profile/profile_page.dart

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            // Foto Profil
            CircleAvatar(
              radius: 70, // Perbesar ukuran
              backgroundImage: NetworkImage("https://media.istockphoto.com/id/1346015318/photo/amazed-black-man-checking-smart-phone-in-a-park.jpg?s=612x612&w=0&k=20&c=yVGCKR406DIf5KLNrlext9aW-DYHDSp7lCvFk-bOoq4="),
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),

            // Nama
            Text(
              'Rakha Noor A. Admaja',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '11 PPLG 1', // Tambahkan subjudul kecil
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),

            // Kartu Informasi
            Card(
              elevation: 4,
              shadowColor: Colors.black.withValues(alpha: 0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.class_outlined, color: Colors.blueAccent),
                      title: Text(
                        'Nomor Absen',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '32',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Divider(indent: 16, endIndent: 16),
                    ListTile(
                      leading: Icon(Icons.email_outlined, color: Colors.blueAccent),
                      title: Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Rakhanoor12@gmail.com',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}