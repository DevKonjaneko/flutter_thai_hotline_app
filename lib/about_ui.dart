import 'package:flutter/material.dart';

class AboutUI extends StatelessWidget {
  const AboutUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        backgroundColor: const Color(0xFFD6D6D6),
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Center(
          child: Column(
            children: [
              const Text(
                'ผู้จัดทำ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              // โลโก้ ม.เอเชียอาคเนย์
              Image.asset(
                'assets/images/aboutme/saulogo.png',
                height: 85,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 120,
                  height: 80,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.school, size: 40, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'มหาวิทยาลัยเอเชียอาคเนย์',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 28),
              // รูปโปรไฟล์ผู้จัดทำ (me.png)
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/aboutme/me.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: Colors.grey.shade100,
                      child: const Icon(Icons.person, size: 70, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // ข้อมูลส่วนตัว
              const Text(
                'รหัสนักศึกษา: 6819110033',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                'ชื่อ-สกุล: นาย คณาเวช ธนสินฑ์กุล',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                'อีเมล: student@sau.ac.th',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                'วิศวกรรมคอมพิวเตอร์',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                'คณะวิศวกรรมศาสตร์',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}