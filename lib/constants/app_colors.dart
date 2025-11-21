import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryBlue = Color(0xFF1E5FF7);
  static const Color primaryDarkBlue = Color(0xFF0B42C7);
  static const Color primaryLightBlue = Color(0xFF4A7BF8);
  
  // Background Colors
  static const Color backgroundLight = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF1A1A1A);
  static const Color cardBackground = Colors.white;
  
  // Text Colors
  static const Color textPrimary = Color(0xFF2D3748);
  static const Color textSecondary = Color(0xFF718096);
  static const Color textLight = Colors.white;
  static const Color textDark = Color(0xFF1A202C);
  
  // Accent Colors
  static const Color accentGreen = Color(0xFF48BB78);
  static const Color accentRed = Color(0xFFE53E3E);
  static const Color accentOrange = Color(0xFFED8936);
  static const Color accentYellow = Color(0xFFECC94B);
  
  // Neutral Colors
  static const Color grey100 = Color(0xFFF7FAFC);
  static const Color grey200 = Color(0xFFEDF2F7);
  static const Color grey300 = Color(0xFFE2E8F0);
  static const Color grey400 = Color(0xFFCBD5E0);
  static const Color grey500 = Color(0xFFA0AEC0);
  static const Color grey600 = Color(0xFF718096);
  static const Color grey700 = Color(0xFF4A5568);
  static const Color grey800 = Color(0xFF2D3748);
  static const Color grey900 = Color(0xFF1A202C);
  
  // Button Colors
  static const Color buttonPrimary = primaryBlue;
  static const Color buttonSecondary = grey200;
  static const Color buttonDanger = accentRed;
  static const Color buttonSuccess = accentGreen;
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryBlue, primaryDarkBlue],
  );
  
  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightBlue, primaryBlue],
  );
  
  static const LinearGradient successGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF68D391), accentGreen],
  );
  
  // Shadow Colors
  static Color shadowLight = Colors.black.withOpacity(0.1);
  static Color shadowMedium = Colors.black.withOpacity(0.2);
  static Color shadowDark = Colors.black.withOpacity(0.3);
  
  // Referral Avatar Colors
  static const List<Color> referralColors = [
    Color(0xFFB85450), // Reddish brown
    Color(0xFF8B4513), // Saddle brown
    Color(0xFF696969), // Dim gray
    Color(0xFF2E8B57), // Sea green
    Color(0xFF4682B4), // Steel blue
    Color(0xFF9932CC), // Dark orchid
  ];
  
  // Status Colors
  static const Color statusActive = accentGreen;
  static const Color statusInactive = grey400;
  static const Color statusPending = accentYellow;
  static const Color statusError = accentRed;
  
  // Overlay Colors
  static Color overlayLight = Colors.white.withOpacity(0.2);
  static Color overlayMedium = Colors.white.withOpacity(0.3);
  static Color overlayDark = Colors.black.withOpacity(0.5);
  
  // Form Colors
  static const Color borderLight = grey300;
  static const Color error = accentRed;
}