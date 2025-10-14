import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/custom_textfield.dart';

class LoginPageWidescreen extends StatelessWidget {
  final LoginController controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueAccent,
              child: SafeArea(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.checklist_rtl,
                          size: 80,
                          color: Colors.white,
                        ),
                        SizedBox(height: 24),
                        Text(
                          'Todo App',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Mudah dipakai, Jaminan Cepat Selesai!',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 48.0,
                ),
                child: Center(
                  child: Container(
                    width: 450,
                    padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(26),
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Login to Your Account',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 40),

                        // Form Input
                        CustomTextField(
                          controller: controller.usernameController,
                          hintText: 'Insert Username',
                          prefixIcon: Icons.person_outline,
                        ),
                        SizedBox(height: 20),
                        CustomTextField(
                          controller: controller.passwordController,
                          hintText: 'Insert Password',
                          obscureText: true,
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(height: 30),

                        // Tombol Login
                        PrimaryButton(
                          text: 'LOGIN',
                          onPressed: () {
                            controller.login();
                          },
                        ),
                        SizedBox(height: 5),

                        // Pesan Status
                        Obx(() {
                          if (controller.loginMessage.value.isEmpty) {
                            return SizedBox.shrink();
                          }
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              controller.loginMessage.value,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    controller.loginMessage.value.contains( 
                                      'berhasil',
                                    )
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
            ),
          ),
        ],
      ),
    );
  }
}
