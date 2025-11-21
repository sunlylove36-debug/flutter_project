#!/bin/bash

# Kantumruy Pro Font Download Script
# This script downloads Kantumruy Pro fonts from Google Fonts

echo "🔗 Downloading Kantumruy Pro fonts from Google Fonts..."

# Create fonts directory if it doesn't exist
mkdir -p assets/fonts

# Download Kantumruy Pro from Google Fonts API
echo "📥 Fetching font files..."

# Google Fonts API endpoint for Kantumruy Pro
FONT_API="https://fonts.googleapis.com/css2?family=Kantumruy+Pro:wght@300;400;500;600;700;800&display=swap"

# Create a temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Download the CSS file to get font URLs
curl -s "$FONT_API" > kantumruy_pro.css

# Extract font URLs and download each weight
echo "⬇️  Downloading font files..."

# Light (300)
LIGHT_URL=$(grep -o 'https://[^)]*' kantumruy_pro.css | grep 'wght@300' | head -1)
if [ ! -z "$LIGHT_URL" ]; then
    curl -s "$LIGHT_URL" -o "KantumruyPro-Light.ttf"
    echo "✅ Downloaded KantumruyPro-Light.ttf"
fi

# Regular (400)
REGULAR_URL=$(grep -o 'https://[^)]*' kantumruy_pro.css | grep 'wght@400' | head -1)
if [ ! -z "$REGULAR_URL" ]; then
    curl -s "$REGULAR_URL" -o "KantumruyPro-Regular.ttf"
    echo "✅ Downloaded KantumruyPro-Regular.ttf"
fi

# Medium (500)
MEDIUM_URL=$(grep -o 'https://[^)]*' kantumruy_pro.css | grep 'wght@500' | head -1)
if [ ! -z "$MEDIUM_URL" ]; then
    curl -s "$MEDIUM_URL" -o "KantumruyPro-Medium.ttf"
    echo "✅ Downloaded KantumruyPro-Medium.ttf"
fi

# SemiBold (600)
SEMIBOLD_URL=$(grep -o 'https://[^)]*' kantumruy_pro.css | grep 'wght@600' | head -1)
if [ ! -z "$SEMIBOLD_URL" ]; then
    curl -s "$SEMIBOLD_URL" -o "KantumruyPro-SemiBold.ttf"
    echo "✅ Downloaded KantumruyPro-SemiBold.ttf"
fi

# Bold (700)
BOLD_URL=$(grep -o 'https://[^)]*' kantumruy_pro.css | grep 'wght@700' | head -1)
if [ ! -z "$BOLD_URL" ]; then
    curl -s "$BOLD_URL" -o "KantumruyPro-Bold.ttf"
    echo "✅ Downloaded KantumruyPro-Bold.ttf"
fi

# ExtraBold (800)
EXTRABOLD_URL=$(grep -o 'https://[^)]*' kantumruy_pro.css | grep 'wght@800' | head -1)
if [ ! -z "$EXTRABOLD_URL" ]; then
    curl -s "$EXTRABOLD_URL" -o "KantumruyPro-ExtraBold.ttf"
    echo "✅ Downloaded KantumruyPro-ExtraBold.ttf"
fi

# Copy files to Flutter project
echo "📁 Copying fonts to Flutter project..."
cp *.ttf "$OLDPWD/assets/fonts/"

# Cleanup
cd "$OLDPWD"
rm -rf "$TEMP_DIR"

echo ""
echo "🎉 Kantumruy Pro fonts installed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Run 'flutter pub get' to refresh dependencies"
echo "2. Restart your Flutter app"
echo "3. Khmer text will now use Kantumruy Pro font"
echo ""
echo "📂 Font files are located in: assets/fonts/"
echo ""
echo "💡 If fonts don't appear immediately:"
echo "   - Run 'flutter clean'"
echo "   - Run 'flutter pub get'"
echo "   - Restart your app completely"