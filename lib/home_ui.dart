import 'package:flutter/material.dart';
import 'main.dart';
import 'about_ui.dart';
import 'travel_ui.dart';
import 'emg_ui.dart';
import 'bank_ui.dart';
import 'pub_ui.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    TravelUI(),
    EmgUI(),
    BankUI(),
    PubUI(),
  ];

  @override
  Widget build(BuildContext context) {
    // ตรวจสอบว่าขณะนี้เปิด Dark Mode อยู่หรือไม่
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'สายด่วน THAILAND',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        elevation: 0,
        actions: [
          // 1. ปุ่มสลับ Dark Mode / Light Mode
          IconButton(
            tooltip: isDark ? 'เปลี่ยนเป็นโหมดสว่าง' : 'เปลี่ยนเป็นโหมดมืด',
            icon: Icon(
              isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            ),
            onPressed: () {
              setState(() {
                themeNotifier.value =
                    isDark ? ThemeMode.light : ThemeMode.dark;
              });
            },
          ),
          // 2. ปุ่ม About Me
          IconButton(
            tooltip: 'เกี่ยวกับผู้จัดทำ',
            icon: const Icon(Icons.info_outline_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUI()),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_rounded),
            label: 'การเดินทาง',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency_rounded),
            label: 'อุบัติเหตุ-เหตุฉุกเฉิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_rounded),
            label: 'ธนาคาร',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop_rounded),
            label: 'สาธารณูปโภค',
          ),
        ],
      ),
    );
  }
}