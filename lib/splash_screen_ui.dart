import 'dart:async';
import 'package:flutter/material.dart';
import 'home_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();
    // หน่วงเวลา 3 วินาทีแล้วเปิดหน้า HomeUI
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeUI()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // รูปไอคอนแอปตรงกลาง
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/icon/icon.png',
                width: 180,
                height: 180,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 180,
                  height: 180,
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.phone_in_talk_rounded,
                    size: 80,
                    color: Color(0xFFE60000),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36),
            // ข้อความชื่อแอป
            const Text(
              'THAI HOTLINE APP',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'สายด่วน',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}