# Swastha Nepal - Healthcare Management App

A comprehensive Flutter-based healthcare application designed for the Nepalese healthcare system, providing both traditional medical services and modern digital healthcare solutions.

## 🏥 Features

### Core Healthcare Services
- **👨‍⚕️ Doctor Consultation & Prescriptions** - Book appointments and get online prescriptions
- **📅 Appointment Booking** - Schedule and manage healthcare appointments
- **🩸 Blood Bank Services** - Donate blood and request blood donations
- **🤖 AI Psychotherapist** - AI-powered mental health support
- **📢 Health Updates** - Stay informed about healthcare news and announcements
- **🏥 Hospital Reports** - Generate and view medical documentation

### Enhanced Features (Newly Added)
- **💬 Real-time Chat** - Live messaging with healthcare providers
- **🔔 Push Notifications** - Appointment reminders and health updates
- **📁 File Upload** - Upload medical documents and prescriptions
- **💳 Payment Integration** - Secure payment processing for appointments
- **📍 Location Services** - Find nearby hospitals and clinics
- **♿ Accessibility** - Screen reader support and improved navigation

## 🛠️ Technical Improvements

### UI/UX Enhancements
- ✅ **Consistent Navigation** - Fixed back button functionality
- ✅ **Loading States** - Proper loading indicators throughout the app
- ✅ **Error Handling** - Comprehensive error messages and user feedback
- ✅ **Accessibility** - Screen reader support and improved navigation
- ✅ **Modern UI** - Enhanced visual design with better user experience

### Backend Services
- ✅ **API Service** - Centralized API handling with error management
- ✅ **Chat Service** - Real-time messaging with polling mechanism
- ✅ **Notification Service** - Local and push notification support
- ✅ **Location Service** - GPS-based hospital finder
- ✅ **File Upload Service** - Document and image upload capabilities
- ✅ **Payment Service** - Secure payment processing

### Security & Performance
- ✅ **Input Validation** - Form validation and data sanitization
- ✅ **Error Recovery** - Graceful error handling and recovery
- ✅ **Network Handling** - Proper offline/online state management
- ✅ **Data Persistence** - Local storage and state management

## 📱 Screenshots

The app includes the following main screens:
- **Onboarding** - User registration and login
- **Home Screen** - Feature overview and navigation
- **Doctor Consultation** - Book appointments with specialists
- **AI Chat** - Mental health support with AI
- **Blood Donation** - Blood bank services
- **Appointments** - Schedule and manage bookings
- **Account** - User profile and settings

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.5.4 or higher)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd swastha-nepal
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Firebase**
   - Add your Firebase configuration files
   - Update Firebase project settings

4. **Run the app**

   **For Mobile:**
   ```bash
   flutter run
   ```

   **For Web:**
   ```bash
   flutter run -d chrome
   ```

   **For Specific Platform:**
   ```bash
   flutter run -d <device-id>
   ```

### Quick Deployment

**Using the deployment script:**

**Linux/Mac:**
```bash
chmod +x deploy.sh
./deploy.sh web        # Build for web
./deploy.sh android    # Build for Android
./deploy.sh all        # Build for all platforms
./deploy.sh deploy     # Build and deploy web to Firebase
```

**Windows:**
```cmd
deploy.bat web        # Build for web
deploy.bat android    # Build for Android
deploy.bat all        # Build for all platforms
deploy.bat deploy     # Build and deploy web to Firebase
```

## 📦 Dependencies

### Core Dependencies
- `flutter` - UI framework
- `firebase_core` - Firebase initialization
- `firebase_auth` - Authentication
- `cloud_firestore` - Database

### New Dependencies Added
- `flutter_local_notifications` - Push notifications
- `geolocator` - Location services
- `geocoding` - Address geocoding
- `file_picker` - File selection
- `image_picker` - Camera and gallery access
- `http` - API communication
- `provider` - State management

## 🔧 Configuration

### Environment Setup
1. Create a `.env` file for environment variables
2. Configure API endpoints in `lib/services/api_service.dart`
3. Set up Firebase project and add configuration files

### API Configuration
Update the base URL in service files:
- `lib/services/api_service.dart`
- `lib/services/chat_service.dart`
- `lib/services/notification_service.dart`

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📞 Support

For support and questions:
- Create an issue in the repository
- Contact the development team

## 🔄 Changelog

### Version 2.0.0 (Current)
- ✅ Fixed navigation issues
- ✅ Added loading states and error handling
- ✅ Implemented real-time chat functionality
- ✅ Added push notifications
- ✅ Integrated file upload capabilities
- ✅ Added payment processing
- ✅ Implemented location services
- ✅ Enhanced accessibility features

### Version 1.0.0 (Original)
- Basic healthcare features
- Firebase authentication
- Simple UI implementation
