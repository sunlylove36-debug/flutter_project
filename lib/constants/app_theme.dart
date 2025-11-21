import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  // Light Theme
  static ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlue,
      brightness: Brightness.light,
    ),
    textTheme: AppTextTheme.textTheme,
    useMaterial3: true,
    
    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryBlue,
      foregroundColor: AppColors.textLight,
      titleTextStyle: AppFonts.headline6.copyWith(
        color: AppColors.textLight,
      ),
      elevation: 0,
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.cardBackground,
      elevation: 2,
      shadowColor: AppColors.shadowLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    
    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: AppColors.textLight,
        textStyle: AppFonts.buttonMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        shadowColor: AppColors.shadowMedium,
      ),
    ),
    
    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryBlue,
        textStyle: AppFonts.buttonMedium,
      ),
    ),
    
    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primaryBlue,
        side: BorderSide(color: AppColors.primaryBlue),
        textStyle: AppFonts.buttonMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.grey100,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.grey300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.grey300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryBlue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.accentRed),
      ),
      labelStyle: AppFonts.bodyMedium.copyWith(
        color: AppColors.textSecondary,
      ),
      hintStyle: AppFonts.bodyMedium.copyWith(
        color: AppColors.grey500,
      ),
    ),
    
    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.primaryBlue,
      size: 24,
    ),
    
    // Primary Icon Theme
    primaryIconTheme: const IconThemeData(
      color: AppColors.textLight,
      size: 24,
    ),
  );
  
  // Dark Theme
  static ThemeData get darkTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryBlue,
      brightness: Brightness.dark,
    ),
    textTheme: AppTextTheme.textTheme.apply(
      bodyColor: AppColors.textLight,
      displayColor: AppColors.textLight,
    ),
    useMaterial3: true,
    
    scaffoldBackgroundColor: AppColors.backgroundDark,
    
    // App Bar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
      foregroundColor: AppColors.textLight,
      titleTextStyle: AppFonts.headline6.copyWith(
        color: AppColors.textLight,
      ),
      elevation: 0,
    ),
    
    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.grey800,
      elevation: 2,
      shadowColor: AppColors.shadowDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
  );
}

// Custom Widget Styles
class AppStyles {
  // Service Grid Item Style
  static BoxDecoration get serviceItemDecoration => BoxDecoration(
    color: AppColors.cardBackground,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowLight,
        blurRadius: 5,
        offset: const Offset(0, 2),
      ),
    ],
  );
  
  // Promo Banner Style
  static BoxDecoration get promoBannerDecoration => BoxDecoration(
    color: AppColors.primaryDarkBlue,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowLight,
        blurRadius: 10,
        offset: const Offset(0, 5),
      ),
    ],
  );
  
  // Competition Card Style
  static BoxDecoration get competitionCardDecoration => BoxDecoration(
    color: AppColors.primaryDarkBlue,
    borderRadius: BorderRadius.circular(15),
  );
  
  // Association Item Style
  static BoxDecoration get associationItemDecoration => BoxDecoration(
    color: AppColors.overlayLight,
    shape: BoxShape.circle,
  );
  
  // Referral Avatar Style
  static BoxDecoration referralAvatarDecoration(Color color) => BoxDecoration(
    color: color,
    shape: BoxShape.circle,
  );
  
  // Header Icon Container Style
  static BoxDecoration get headerIconDecoration => BoxDecoration(
    color: AppColors.overlayLight,
    borderRadius: BorderRadius.circular(20),
  );
}

// Helper Methods
class AppHelpers {
  // Get referral color by index
  static Color getReferralColor(int index) {
    return AppColors.referralColors[index % AppColors.referralColors.length];
  }
  
  // Get referral color by initial character
  static Color getReferralColorByInitial(String initial) {
    final index = initial.codeUnitAt(0) % AppColors.referralColors.length;
    return AppColors.referralColors[index];
  }
}