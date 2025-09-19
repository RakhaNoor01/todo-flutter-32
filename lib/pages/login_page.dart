// lib/pages/login/login_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/login_controller.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // bg
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Agar container pas dengan isinya
              children: [
                // Header
                Icon(Icons.checklist_rtl, size: 60, color: Colors.blueAccent),
                SizedBox(height: 16),
                Text(
                  'Todo App',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Mudah dipakai, Jaminan Cepat Selesai!',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 40),

                // Form Input
                CustomTextField(
                  controller: controller.usernameController,
                  hintText: 'Insert Username',
                  prefixIcon: Icons.person_outline, // icon orang
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: 'Insert Password',
                  obscureText: true,
                  prefixIcon: Icons.lock_outline, // icon kunci
                ),
                SizedBox(height: 30),

                // Tombol Login
                PrimaryButton(
                  text: 'LOGIN',
                  onPressed: () {
                    controller.login();
                  },
                ),
                SizedBox(height: 20),

                // Pesan Status
                Obx(() {
                  // sedikit padding agar tidak terlalu mepet
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      controller.loginMessage.value,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: controller.loginMessage.value.contains('berhasil')
                            ? Colors.green
                            : Colors.red,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}