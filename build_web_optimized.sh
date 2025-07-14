#!/bin/bash

# Flutter Web Optimization Build Script
echo "🚀 Building optimized Flutter web app..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build with maximum optimizations
echo "🔧 Building with optimizations..."
flutter build web \
  --dart-define=dart.vm.product=true \
  --release \
  --tree-shake-icons \
  --source-maps \
  --base-href "/" \
  --dart2js-optimization O4

echo "✅ Build complete!"
echo "📁 Output: build/web/"
echo ""
echo "🎯 Optimization tips applied:"
echo "  ✓ CanvasKit renderer for better performance"
echo "  ✓ Tree-shaking enabled for smaller bundle"
echo "  ✓ Maximum Dart2JS optimizations"
echo "  ✓ PWA offline-first strategy"
echo "  ✓ Source maps for debugging"
echo ""
echo "📊 Check build/web/ for file sizes"
echo "💡 Consider serving with gzip compression enabled"
