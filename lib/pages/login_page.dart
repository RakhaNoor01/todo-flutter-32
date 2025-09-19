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
      appBar: AppBar(
        title: Text("Halaman Login"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ikon sederhana sebagai logo
              Icon(Icons.checklist, size: 80, color: Colors.blueAccent),
              SizedBox(height: 40),

              // Reusable Components
              
              CustomTextField(
                controller: controller.usernameController,
                hintText: 'Username (coba: admin)',
              ),
              SizedBox(height: 20),

              CustomTextField(
                controller: controller.passwordController,
                hintText: 'Password (coba: password)',
                obscureText: true,
              ),
              SizedBox(height: 30),

              PrimaryButton(
                text: 'LOGIN',
                onPressed: () {
                  controller.login();
                },
              ),
              SizedBox(height: 20),

              // Widget untuk menampilkan pesan dari controller secara reaktif
              Obx(() {
                return Text(
                  controller.loginMessage.value,
                  style: TextStyle(
                    fontSize: 16,
                    color: controller.loginMessage.value == 'Login berhasil!'
                        ? Colors.green
                        : Colors.red,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}