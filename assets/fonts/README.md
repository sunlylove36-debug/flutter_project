# Kantumruy Pro Font Installation Guide

## About Kantumruy Pro
Kantumruy Pro is a modern, professional Khmer (Cambodian) font designed specifically for digital applications. It provides excellent readability and supports all Khmer Unicode characters.

## Download Instructions

### Option 1: Google Fonts (Recommended)
1. Visit: https://fonts.google.com/specimen/Kantumruy+Pro
2. Click "Download family" button
3. Extract the zip file
4. Copy the font files to `assets/fonts/` directory

### Option 2: Direct Download
You can download Kantumruy Pro from these sources:
- Google Fonts: https://fonts.google.com/specimen/Kantumruy+Pro
- GitHub: https://github.com/google/fonts/tree/main/ofl/kantumruypro

## Font Files Needed
Copy these files to `assets/fonts/` directory:

```
assets/fonts/
├── KantumruyPro-Light.ttf        (Weight: 300)
├── KantumruyPro-Regular.ttf      (Weight: 400)
├── KantumruyPro-Medium.ttf       (Weight: 500)
├── KantumruyPro-SemiBold.ttf     (Weight: 600)
├── KantumruyPro-Bold.ttf         (Weight: 700)
└── KantumruyPro-ExtraBold.ttf    (Weight: 800)
```

## Installation Steps

### 1. Download the fonts
Download Kantumruy Pro from Google Fonts or the GitHub repository.

### 2. Copy font files
Copy all the .ttf files to the `assets/fonts/` directory in your Flutter project.

### 3. Verify pubspec.yaml
The pubspec.yaml file has already been configured with the font definitions:

```yaml
flutter:
  fonts:
    - family: KantumruyPro
      fonts:
        - asset: assets/fonts/KantumruyPro-Light.ttf
          weight: 300
        - asset: assets/fonts/KantumruyPro-Regular.ttf
          weight: 400
        - asset: assets/fonts/KantumruyPro-Medium.ttf
          weight: 500
        - asset: assets/fonts/KantumruyPro-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/KantumruyPro-Bold.ttf
          weight: 700
        - asset: assets/fonts/KantumruyPro-ExtraBold.ttf
          weight: 800
```

### 4. Run flutter pub get
After copying the fonts, run:
```bash
flutter pub get
```

### 5. Restart your app
Restart your Flutter app to load the new fonts.

## Usage Examples

### Khmer Text Styles
```dart
// App title in Khmer
Text(
  'ភ្យូវីលីង',
  style: AppFonts.khmerAppTitle.copyWith(
    color: AppColors.textLight,
  ),
)

// Promo banner title
Text(
  'ទទួលបានកម្ចីវិទ្យុក់',
  style: AppFonts.khmerPromoTitle.copyWith(
    color: AppColors.textLight,
  ),
)

// Body text
Text(
  'ហូតពី ២០០០ដុល្លារ',
  style: AppFonts.khmerPromoSubtitle.copyWith(
    color: AppColors.textLight,
  ),
)

// Section titles
Text(
  'កម្មវិធីប្រកួតប្រជែង',
  style: AppFonts.khmerSectionTitle.copyWith(
    color: AppColors.textLight,
  ),
)
```

### Available Khmer Font Styles

#### Headlines
- `AppFonts.khmerHeadline1` - 48px, Bold
- `AppFonts.khmerHeadline2` - 36px, Bold  
- `AppFonts.khmerHeadline3` - 32px, SemiBold
- `AppFonts.khmerHeadline4` - 28px, SemiBold
- `AppFonts.khmerHeadline5` - 24px, Medium
- `AppFonts.khmerHeadline6` - 20px, Medium

#### Body Text
- `AppFonts.khmerBodyLarge` - 18px, Regular
- `AppFonts.khmerBodyMedium` - 16px, Regular
- `AppFonts.khmerBodySmall` - 14px, Regular

#### Labels
- `AppFonts.khmerLabelLarge` - 16px, Medium
- `AppFonts.khmerLabelMedium` - 14px, Medium
- `AppFonts.khmerLabelSmall` - 12px, Medium

#### Fintech App Specific
- `AppFonts.khmerAppTitle` - 20px, Bold
- `AppFonts.khmerPromoTitle` - 20px, Bold
- `AppFonts.khmerPromoSubtitle` - 16px, Regular
- `AppFonts.khmerGreeting` - 18px, Medium
- `AppFonts.khmerServiceLabel` - 12px, Medium
- `AppFonts.khmerSectionTitle` - 18px, Bold
- `AppFonts.khmerCardTitle` - 14px, Medium

## Troubleshooting

### Fonts not showing
1. Verify font files are in `assets/fonts/` directory
2. Check that file names match exactly in pubspec.yaml
3. Run `flutter clean` and `flutter pub get`
4. Restart your app completely

### Missing font weights
If some weights are not available, the system will fall back to the nearest available weight.

### Unicode Issues
Kantumruy Pro supports all Khmer Unicode characters. If you see boxes or missing characters:
1. Verify you're using the correct Unicode code points
2. Check that the font file contains the required glyphs

## Font License
Kantumruy Pro is licensed under the SIL Open Font License (OFL), which allows free use in both personal and commercial projects.

## Additional Resources
- Khmer Unicode Reference: http://www.unicode.org/charts/PDF/U1780.pdf
- Khmer Typography Guidelines: https://docs.google.com/document/d/1G8kv8QnERT8JQJ5sX7YK5mBKWZDJ5L5qxZQF9JJ5Q8k/
- Flutter Font Documentation: https://docs.flutter.dev/cookbook/design/fonts