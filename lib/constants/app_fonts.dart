import 'package:flutter/material.dart';

class AppFonts {
  // Font Family Names
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'Inter';
  static const String displayFont = 'Poppins';
  static const String khmerFont = 'KantumruyPro';
  
  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  
  // Font Sizes
  static const double fontSize10 = 10.0;
  static const double fontSize12 = 12.0;
  static const double fontSize14 = 14.0;
  static const double fontSize16 = 16.0;
  static const double fontSize18 = 18.0;
  static const double fontSize20 = 20.0;
  static const double fontSize24 = 24.0;
  static const double fontSize28 = 28.0;
  static const double fontSize32 = 32.0;
  static const double fontSize36 = 36.0;
  static const double fontSize48 = 48.0;
  
  // Text Styles - Headlines
  static const TextStyle headline1 = TextStyle(
    fontSize: fontSize48,
    fontWeight: bold,
    fontFamily: displayFont,
    letterSpacing: -1.5,
  );
  
  static const TextStyle headline2 = TextStyle(
    fontSize: fontSize36,
    fontWeight: bold,
    fontFamily: displayFont,
    letterSpacing: -0.5,
  );
  
  static const TextStyle headline3 = TextStyle(
    fontSize: fontSize32,
    fontWeight: semiBold,
    fontFamily: displayFont,
    letterSpacing: 0,
  );
  
  static const TextStyle headline4 = TextStyle(
    fontSize: fontSize28,
    fontWeight: semiBold,
    fontFamily: displayFont,
    letterSpacing: 0.25,
  );
  
  static const TextStyle headline5 = TextStyle(
    fontSize: fontSize24,
    fontWeight: medium,
    fontFamily: displayFont,
    letterSpacing: 0,
  );
  
  static const TextStyle headline6 = TextStyle(
    fontSize: fontSize20,
    fontWeight: medium,
    fontFamily: displayFont,
    letterSpacing: 0.15,
  );
  
  // Text Styles - Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: fontSize18,
    fontWeight: regular,
    fontFamily: primaryFont,
    letterSpacing: 0.5,
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: fontSize16,
    fontWeight: regular,
    fontFamily: primaryFont,
    letterSpacing: 0.25,
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: fontSize14,
    fontWeight: regular,
    fontFamily: primaryFont,
    letterSpacing: 0.4,
  );
  
  // Text Styles - Labels
  static const TextStyle labelLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.1,
  );
  
  static const TextStyle labelMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.5,
  );
  
  static const TextStyle labelSmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.5,
  );
  
  // Text Styles - Captions
  static const TextStyle caption = TextStyle(
    fontSize: fontSize12,
    fontWeight: regular,
    fontFamily: primaryFont,
    letterSpacing: 0.4,
  );
  
  static const TextStyle overline = TextStyle(
    fontSize: fontSize10,
    fontWeight: regular,
    fontFamily: primaryFont,
    letterSpacing: 1.5,
  );
  
  // Custom Text Styles for Fintech App
  static const TextStyle greeting = TextStyle(
    fontSize: fontSize18,
    fontWeight: medium,
    fontFamily: primaryFont,
    letterSpacing: 0.15,
  );
  
  // Khmer Font Styles
  static const TextStyle khmerHeadline1 = TextStyle(
    fontSize: fontSize48,
    fontWeight: bold,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerHeadline2 = TextStyle(
    fontSize: fontSize36,
    fontWeight: bold,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerHeadline3 = TextStyle(
    fontSize: fontSize32,
    fontWeight: semiBold,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerHeadline4 = TextStyle(
    fontSize: fontSize28,
    fontWeight: semiBold,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerHeadline5 = TextStyle(
    fontSize: fontSize24,
    fontWeight: medium,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerHeadline6 = TextStyle(
    fontSize: fontSize20,
    fontWeight: medium,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerBodyLarge = TextStyle(
    fontSize: fontSize18,
    fontWeight: regular,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerBodyMedium = TextStyle(
    fontSize: fontSize16,
    fontWeight: regular,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerBodySmall = TextStyle(
    fontSize: fontSize14,
    fontWeight: regular,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerLabelLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: medium,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerLabelMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerLabelSmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: medium,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle promoTitle = TextStyle(
    fontSize: fontSize20,
    fontWeight: bold,
    fontFamily: displayFont,
    letterSpacing: 0,
  );
  
  static const TextStyle promoSubtitle = TextStyle(
    fontSize: fontSize16,
    fontWeight: regular,
    fontFamily: primaryFont,
    letterSpacing: 0.25,
  );
  
  static const TextStyle serviceLabel = TextStyle(
    fontSize: fontSize12,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.4,
  );
  
  static const TextStyle sectionTitle = TextStyle(
    fontSize: fontSize18,
    fontWeight: bold,
    fontFamily: displayFont,
    letterSpacing: 0.15,
  );
  
  static const TextStyle cardTitle = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.1,
  );
  
  static const TextStyle referralName = TextStyle(
    fontSize: fontSize10,
    fontWeight: medium,
    fontFamily: primaryFont,
    letterSpacing: 0.5,
  );
  
  static const TextStyle referralInitial = TextStyle(
    fontSize: fontSize24,
    fontWeight: bold,
    fontFamily: displayFont,
    letterSpacing: 0,
  );
  
  // Khmer Fintech App Styles
  static const TextStyle khmerAppTitle = TextStyle(
    fontSize: fontSize20,
    fontWeight: bold,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerPromoTitle = TextStyle(
    fontSize: fontSize20,
    fontWeight: bold,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerPromoSubtitle = TextStyle(
    fontSize: fontSize16,
    fontWeight: regular,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerGreeting = TextStyle(
    fontSize: fontSize18,
    fontWeight: medium,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerServiceLabel = TextStyle(
    fontSize: fontSize12,
    fontWeight: medium,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerSectionTitle = TextStyle(
    fontSize: fontSize18,
    fontWeight: bold,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle khmerCardTitle = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: khmerFont,
    letterSpacing: 0,
  );
  
  static const TextStyle associationLabel = TextStyle(
    fontSize: 11.0,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.3,
  );
  
  // Button Text Styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: fontSize16,
    fontWeight: semiBold,
    fontFamily: secondaryFont,
    letterSpacing: 0.5,
  );
  
  static const TextStyle buttonMedium = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.25,
  );
  
  static const TextStyle buttonSmall = TextStyle(
    fontSize: fontSize12,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.4,
  );
  
  // Additional styles for forms and pages
  static const TextStyle pageTitle = TextStyle(
    fontSize: fontSize28,
    fontWeight: bold,
    fontFamily: displayFont,
    letterSpacing: 0.15,
  );
  
  static const TextStyle bodyText = TextStyle(
    fontSize: fontSize16,
    fontWeight: regular,
    fontFamily: primaryFont,
    letterSpacing: 0.25,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: fontSize16,
    fontWeight: semiBold,
    fontFamily: secondaryFont,
    letterSpacing: 0.5,
  );
  
  static const TextStyle appBarTitle = TextStyle(
    fontSize: fontSize20,
    fontWeight: semiBold,
    fontFamily: displayFont,
    letterSpacing: 0.15,
  );
  
  static const TextStyle fieldLabel = TextStyle(
    fontSize: fontSize14,
    fontWeight: medium,
    fontFamily: secondaryFont,
    letterSpacing: 0.25,
  );
  
  static const TextStyle dialogTitle = TextStyle(
    fontSize: fontSize20,
    fontWeight: semiBold,
    fontFamily: displayFont,
    letterSpacing: 0.15,
  );
}

// Text Theme for MaterialApp
class AppTextTheme {
  static TextTheme get textTheme => const TextTheme(
    displayLarge: AppFonts.headline1,
    displayMedium: AppFonts.headline2,
    displaySmall: AppFonts.headline3,
    headlineLarge: AppFonts.headline4,
    headlineMedium: AppFonts.headline5,
    headlineSmall: AppFonts.headline6,
    titleLarge: AppFonts.headline6,
    titleMedium: AppFonts.bodyLarge,
    titleSmall: AppFonts.bodyMedium,
    bodyLarge: AppFonts.bodyLarge,
    bodyMedium: AppFonts.bodyMedium,
    bodySmall: AppFonts.bodySmall,
    labelLarge: AppFonts.labelLarge,
    labelMedium: AppFonts.labelMedium,
    labelSmall: AppFonts.labelSmall,
  );
}