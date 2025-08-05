# 🚀 Swastha Nepal - Deployment Guide

## 📱 Mobile App Deployment

### Prerequisites
- Flutter SDK (3.5.4 or higher)
- Android Studio / Xcode
- Firebase project configured
- Google Play Console / Apple Developer Account

### Android Deployment

1. **Build APK for testing:**
   ```bash
   flutter build apk --release
   ```

2. **Build App Bundle for Play Store:**
   ```bash
   flutter build appbundle --release
   ```

3. **Test on device:**
   ```bash
   flutter install
   ```

### iOS Deployment

1. **Build for iOS:**
   ```bash
   flutter build ios --release
   ```

2. **Archive and upload to App Store Connect**

## 🌐 Web App Deployment

### Prerequisites
- Flutter SDK with web support enabled
- Node.js (for some deployment platforms)
- Git repository

### Enable Web Support

1. **Enable web support:**
   ```bash
   flutter config --enable-web
   ```

2. **Check web support:**
   ```bash
   flutter devices
   ```

### Local Web Development

1. **Run web app locally:**
   ```bash
   flutter run -d chrome
   ```

2. **Build for production:**
   ```bash
   flutter build web --release
   ```

### Deployment Options

#### Option 1: Firebase Hosting (Recommended)

1. **Install Firebase CLI:**
   ```bash
   npm install -g firebase-tools
   ```

2. **Login to Firebase:**
   ```bash
   firebase login
   ```

3. **Initialize Firebase project:**
   ```bash
   firebase init hosting
   ```

4. **Configure firebase.json:**
   ```json
   {
     "hosting": {
       "public": "build/web",
       "ignore": [
         "firebase.json",
         "**/.*",
         "**/node_modules/**"
       ],
       "rewrites": [
         {
           "source": "**",
           "destination": "/index.html"
         }
       ]
     }
   }
   ```

5. **Deploy:**
   ```bash
   flutter build web --release
   firebase deploy
   ```

#### Option 2: GitHub Pages

1. **Create GitHub repository**

2. **Add GitHub Actions workflow (.github/workflows/deploy.yml):**
   ```yaml
   name: Deploy to GitHub Pages
   
   on:
     push:
       branches: [ main ]
   
   jobs:
     build:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v2
         - uses: subosito/flutter-action@v2
           with:
             flutter-version: '3.5.4'
         - run: flutter config --enable-web
         - run: flutter build web --release
         - uses: peaceiris/actions-gh-pages@v3
           with:
             github_token: ${{ secrets.GITHUB_TOKEN }}
             publish_dir: ./build/web
   ```

#### Option 3: Netlify

1. **Connect your repository to Netlify**

2. **Configure build settings:**
   - Build command: `flutter build web --release`
   - Publish directory: `build/web`

3. **Deploy automatically on push**

#### Option 4: Vercel

1. **Install Vercel CLI:**
   ```bash
   npm i -g vercel
   ```

2. **Deploy:**
   ```bash
   flutter build web --release
   vercel build/web
   ```

## 🔧 Configuration Files

### Web Configuration

The following files have been optimized for web deployment:

- **`web/index.html`** - Optimized HTML with loading indicator
- **`web/manifest.json`** - PWA manifest for app-like experience
- **`lib/widgets/responsive_layout.dart`** - Responsive design components
- **`lib/widgets/feature_card.dart`** - Adaptive UI components

### Environment Variables

Create a `.env` file for configuration:

```env
# API Configuration
API_BASE_URL=https://api.swasthanepal.com
FIREBASE_API_KEY=your_firebase_api_key
FIREBASE_PROJECT_ID=your_project_id

# Feature Flags
ENABLE_NOTIFICATIONS=true
ENABLE_LOCATION_SERVICES=true
ENABLE_FILE_UPLOAD=true
ENABLE_PAYMENTS=true
```

## 📊 Performance Optimization

### Web Performance

1. **Enable compression:**
   ```bash
   flutter build web --release --dart-define=FLUTTER_WEB_USE_SKIA=true
   ```

2. **Optimize images:**
   - Use WebP format for images
   - Implement lazy loading
   - Compress SVG icons

3. **Code splitting:**
   - Use deferred loading for heavy features
   - Implement route-based code splitting

### Mobile Performance

1. **Enable R8 optimization:**
   ```bash
   flutter build apk --release --obfuscate --split-debug-info=build/debug-info
   ```

2. **Optimize images:**
   - Use appropriate image formats
   - Implement caching strategies

## 🔒 Security Considerations

### Web Security

1. **HTTPS enforcement:**
   - Configure SSL certificates
   - Enable HSTS headers

2. **Content Security Policy:**
   ```html
   <meta http-equiv="Content-Security-Policy" content="default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline';">
   ```

3. **API security:**
   - Implement CORS policies
   - Use API keys and authentication
   - Validate all inputs

### Mobile Security

1. **Code obfuscation:**
   ```bash
   flutter build apk --obfuscate --split-debug-info=build/debug-info
   ```

2. **Certificate pinning:**
   - Implement SSL certificate pinning
   - Validate API endpoints

## 📱 Progressive Web App (PWA)

The app is configured as a PWA with:

- **Service Worker** for offline functionality
- **Web App Manifest** for app-like experience
- **Responsive Design** for all screen sizes
- **Fast Loading** with optimized assets

### PWA Features

1. **Install prompt** on supported browsers
2. **Offline functionality** for core features
3. **App-like navigation** and UI
4. **Push notifications** (when supported)

## 🧪 Testing

### Web Testing

1. **Local testing:**
   ```bash
   flutter run -d chrome
   ```

2. **Cross-browser testing:**
   - Chrome, Firefox, Safari, Edge
   - Mobile browsers (iOS Safari, Chrome Mobile)

3. **Performance testing:**
   - Lighthouse audits
   - WebPageTest analysis

### Mobile Testing

1. **Device testing:**
   - Android: Various screen sizes and OS versions
   - iOS: Different iPhone and iPad models

2. **Automated testing:**
   ```bash
   flutter test
   flutter drive --target=test_driver/app.dart
   ```

## 📈 Analytics and Monitoring

### Web Analytics

1. **Google Analytics:**
   ```dart
   // Add to main.dart
   import 'package:google_analytics/google_analytics.dart';
   ```

2. **Error tracking:**
   - Sentry integration
   - Console error logging

### Mobile Analytics

1. **Firebase Analytics:**
   - Automatic event tracking
   - Custom event logging

2. **Crash reporting:**
   - Firebase Crashlytics
   - Error boundary implementation

## 🔄 Continuous Deployment

### GitHub Actions Workflow

```yaml
name: Deploy Swastha Nepal

on:
  push:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter test

  build-android:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter build apk --release
      - uses: actions/upload-artifact@v2
        with:
          name: app-release
          path: build/app/outputs/flutter-apk/app-release.apk

  build-web:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: subosito/flutter-action@v2
      - run: flutter config --enable-web
      - run: flutter build web --release
      - uses: actions/upload-artifact@v2
        with:
          name: web-build
          path: build/web

  deploy-web:
    needs: build-web
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/download-artifact@v2
        with:
          name: web-build
          path: build/web
      - uses: FirebaseExtended/action-hosting-deploy@v0
        with:
          repoToken: '${{ secrets.GITHUB_TOKEN }}'
          firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
          projectId: your-project-id
          channelId: live
```

## 🚀 Quick Start Commands

### Development
```bash
# Run on mobile
flutter run

# Run on web
flutter run -d chrome

# Run on specific device
flutter run -d <device-id>
```

### Building
```bash
# Build APK
flutter build apk --release

# Build App Bundle
flutter build appbundle --release

# Build for web
flutter build web --release

# Build for iOS
flutter build ios --release
```

### Testing
```bash
# Run tests
flutter test

# Run integration tests
flutter drive --target=test_driver/app.dart

# Analyze code
flutter analyze
```

## 📞 Support

For deployment issues:

1. **Check Flutter doctor:**
   ```bash
   flutter doctor -v
   ```

2. **Verify web support:**
   ```bash
   flutter devices
   ```

3. **Clean and rebuild:**
   ```bash
   flutter clean
   flutter pub get
   flutter build web --release
   ```

## 🎯 Next Steps

1. **Set up Firebase project** and configure authentication
2. **Configure API endpoints** in the service files
3. **Set up monitoring** and analytics
4. **Test on multiple devices** and browsers
5. **Deploy to production** using your preferred platform

Your Swastha Nepal app is now ready for both mobile and web deployment! 🎉 