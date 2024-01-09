import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_constant.dart';

class AppThemes {
  AppThemes._();

  static getApplicationTheme() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: AppColorConstant.primaryColor,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.white,
        ),
        backgroundColor: AppColorConstant.primaryColor,
      ),
// bottom nav bar theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColorConstant.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          elevation: 0),
      fontFamily: GoogleFonts.comicNeue().fontFamily,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFce93d8),
          foregroundColor: Colors.black,
          textStyle: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      useMaterial3: true,
    );
  }
}
