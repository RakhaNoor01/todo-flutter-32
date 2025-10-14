import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_project/controllers/splash_screen_controller.dart';

class SplashScreenPageMobile extends StatelessWidget {
  SplashScreenPageMobile({super.key});
  final controller = Get.find<SplashscreenController>();

  final Color primaryBlue = Colors.blueAccent; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: primaryBlue,
                ),
              ),

              const SizedBox(height: 50),

              // Bar Loading (Linear Progress Indicator)
              LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryBlue),
                backgroundColor: primaryBlue.withAlpha(51),
                minHeight: 8,
              ),

              const SizedBox(height: 30),

              Text(
                "Loading...",
                style: TextStyle(
                  fontSize: 16,
                  color: primaryBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}