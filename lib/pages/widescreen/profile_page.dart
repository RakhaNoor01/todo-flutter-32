import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/login_controller.dart';

class ProfilePageWidescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        "https://media.licdn.com/dms/image/v2/D4D03AQGDyXt_tOvcZA/profile-displayphoto-crop_800_800/B4DZl0ERQOHwAI-/0/1758588902409?e=1763596800&v=beta&t=KUqGYtFxY1ieD4DrbZkkDbduE4GAmzNvv_pyxqwL7F0",
                      ),
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Rakha Noor A. Admaja',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '11 PPLG 1',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 50),

              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      shadowColor: Colors.black.withAlpha(51),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          children: const [
                            ListTile(
                              leading: Icon(Icons.class_outlined,
                                  color: Colors.blueAccent),
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
                              leading: Icon(Icons.email_outlined,
                                  color: Colors.blueAccent),
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
                    const SizedBox(height: 30),

                    // Tombol Logout
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.logout),
                        label: const Text('Logout'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Konfirmasi Logout'),
                                content: const Text(
                                    'Apakah Anda yakin ingin logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('Tidak'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      controller.logout();
                                    },
                                    child: const Text('Ya'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
