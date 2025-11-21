// This file demonstrates how to use the color and font constants in your Flutter fintech app

import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
// ignore: unused_import
import '../constants/app_theme.dart';

// Example usage of colors and fonts
class StyleExamples extends StatelessWidget {
  const StyleExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Style Examples',
          style: AppFonts.headline6.copyWith(
            color: AppColors.textLight,
          ),
        ),
        backgroundColor: AppColors.primaryBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Color Examples Section
            Text(
              'Color Examples',
              style: AppFonts.sectionTitle.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            
            // Primary Colors
            _buildColorRow('Primary Blue', AppColors.primaryBlue),
            _buildColorRow('Primary Dark Blue', AppColors.primaryDarkBlue),
            _buildColorRow('Primary Light Blue', AppColors.primaryLightBlue),
            
            const SizedBox(height: 20),
            
            // Text Colors
            Text(
              'Text Colors',
              style: AppFonts.sectionTitle.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildColorRow('Text Primary', AppColors.textPrimary),
            _buildColorRow('Text Secondary', AppColors.textSecondary),
            _buildColorRow('Text Light', AppColors.textLight),
            
            const SizedBox(height: 20),
            
            // Accent Colors
            Text(
              'Accent Colors',
              style: AppFonts.sectionTitle.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildColorRow('Success Green', AppColors.accentGreen),
            _buildColorRow('Error Red', AppColors.accentRed),
            _buildColorRow('Warning Orange', AppColors.accentOrange),
            _buildColorRow('Info Yellow', AppColors.accentYellow),
            
            const SizedBox(height: 20),
            
            // Font Examples Section
            Text(
              'Font Examples',
              style: AppFonts.sectionTitle.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            
            // Headlines
            Text('Headline 1', style: AppFonts.headline1.copyWith(color: AppColors.textPrimary)),
            Text('Headline 2', style: AppFonts.headline2.copyWith(color: AppColors.textPrimary)),
            Text('Headline 3', style: AppFonts.headline3.copyWith(color: AppColors.textPrimary)),
            Text('Headline 4', style: AppFonts.headline4.copyWith(color: AppColors.textPrimary)),
            Text('Headline 5', style: AppFonts.headline5.copyWith(color: AppColors.textPrimary)),
            Text('Headline 6', style: AppFonts.headline6.copyWith(color: AppColors.textPrimary)),
            
            const SizedBox(height: 16),
            
            // Body Text
            Text('Body Large', style: AppFonts.bodyLarge.copyWith(color: AppColors.textPrimary)),
            Text('Body Medium', style: AppFonts.bodyMedium.copyWith(color: AppColors.textPrimary)),
            Text('Body Small', style: AppFonts.bodySmall.copyWith(color: AppColors.textPrimary)),
            
            const SizedBox(height: 16),
            
            // Custom Fintech Styles
            Text('Greeting Style', style: AppFonts.greeting.copyWith(color: AppColors.textPrimary)),
            Text('Promo Title Style', style: AppFonts.promoTitle.copyWith(color: AppColors.textPrimary)),
            Text('Service Label Style', style: AppFonts.serviceLabel.copyWith(color: AppColors.textPrimary)),
            Text('Section Title Style', style: AppFonts.sectionTitle.copyWith(color: AppColors.textPrimary)),
            
            const SizedBox(height: 20),
            
            // Button Examples
            Text(
              'Button Examples',
              style: AppFonts.sectionTitle.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: () {},
              child: const Text('Primary Button'),
            ),
            const SizedBox(height: 8),
            
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            const SizedBox(height: 8),
            
            TextButton(
              onPressed: () {},
              child: const Text('Text Button'),
            ),
            
            const SizedBox(height: 20),
            
            // Gradient Examples
            Text(
              'Gradient Examples',
              style: AppFonts.sectionTitle.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            
            Container(
              height: 100,
              decoration: const BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: Text(
                  'Primary Gradient',
                  style: AppFonts.headline6.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            Container(
              height: 100,
              decoration: const BoxDecoration(
                gradient: AppColors.secondaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: Text(
                  'Secondary Gradient',
                  style: AppFonts.headline6.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 12),
            
            Container(
              height: 100,
              decoration: const BoxDecoration(
                gradient: AppColors.successGradient,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: Text(
                  'Success Gradient',
                  style: AppFonts.headline6.copyWith(
                    color: AppColors.textLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorRow(String name, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.grey300),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            name,
            style: AppFonts.bodyMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

/* 
=== HOW TO USE THE COLOR AND FONT CONSTANTS ===

1. COLORS:
   - Use AppColors.primaryBlue instead of Color(0xFF1E5FF7)
   - Use AppColors.textLight instead of Colors.white
   - Use AppColors.shadowLight instead of Colors.black.withOpacity(0.1)

2. FONTS:
   - Use AppFonts.headline6 for main titles
   - Use AppFonts.bodyMedium for regular text
   - Use AppFonts.serviceLabel for service grid labels
   - Always use .copyWith(color: AppColors.yourColor) to apply colors

3. THEMES:
   - Use AppTheme.lightTheme in your MaterialApp
   - Use AppStyles.serviceItemDecoration for service cards
   - Use AppHelpers.getReferralColor(index) for dynamic colors

4. EXAMPLE USAGE:
   Text(
     'Hello World',
     style: AppFonts.headline6.copyWith(
       color: AppColors.primaryBlue,
     ),
   )
   
   Container(
     decoration: AppStyles.promoBannerDecoration,
     child: Text(
       'Promo Text',
       style: AppFonts.promoTitle.copyWith(
         color: AppColors.textLight,
       ),
     ),
   )

5. GRADIENTS:
   Container(
     decoration: const BoxDecoration(
       gradient: AppColors.primaryGradient,
     ),
     child: YourWidget(),
   )
*/