import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'splash_screen_ui.dart';

// ตัวแปร Global สำหรับเก็บและแจ้งเตือนสถานะของธีมไปยังทุกหน้า
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const FlutterThaiHotlineApp());
}

class FlutterThaiHotlineApp extends StatelessWidget {
  const FlutterThaiHotlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'สายด่วน Thai Hotline',
          themeMode: currentMode,

          // ธีมโหมดสว่าง (Light Mode)
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            scaffoldBackgroundColor: const Color(0xFFF9F9F9),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFD6D6D6),
              foregroundColor: Colors.black87,
              elevation: 0,
            ),
            cardColor: Colors.white,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.grey,
            ),
            fontFamily: GoogleFonts.kanit().fontFamily,
          ),

          // ธีมโหมดมืด (Dark Mode)
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            scaffoldBackgroundColor: const Color(0xFF121212),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1E1E1E),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            cardColor: const Color(0xFF1E1E1E),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF1E1E1E),
              selectedItemColor: Colors.amber,
              unselectedItemColor: Colors.grey,
            ),
            fontFamily: GoogleFonts.kanit().fontFamily,
          ),

          home: const SplashScreenUI(),
        );
      },
    );
  }
}