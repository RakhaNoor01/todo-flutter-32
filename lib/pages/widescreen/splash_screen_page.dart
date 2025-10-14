import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/splash_screen_controller.dart';

class SplashScreenPageWidescreen extends StatelessWidget {
  SplashScreenPageWidescreen({super.key});
  final controller = Get.find<SplashscreenController>();

  final Color primaryBlue = Colors.blueAccent; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: 450, 
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.checklist_rtl,
                  size: 80,
                  color: primaryBlue,
                ),

                const SizedBox(height: 30),

                Text(
                  "Todo Project",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: primaryBlue,
                  ),
                ),

                const SizedBox(height: 60),
                LinearProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(primaryBlue),
                  backgroundColor: primaryBlue.withAlpha(51),
                  minHeight: 10,
                ),

                const SizedBox(height: 30),

                Text(
                  "Loading...",
                  style: TextStyle(
                    fontSize: 18,
                    color: primaryBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}