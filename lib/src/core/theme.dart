import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pragma_breeds/src/core/colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.cyan,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: GoogleFonts.hachiMaruPopTextTheme(),
      scaffoldBackgroundColor: AppColors.primary,
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      cardTheme: const CardTheme(
        elevation: 3,
        surfaceTintColor: AppColors.primaryDark,
        color: AppColors.primaryDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.primaryDark,
        filled: true,
        border: _border(),
        focusedBorder: _border(),
        enabledBorder: _border(),
        errorBorder: _border(),
        focusedErrorBorder: _border(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: AppColors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 40,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  static OutlineInputBorder _border() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide.none,
    );
  }
}
