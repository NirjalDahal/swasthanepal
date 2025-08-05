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
=======
=======
>>>>>>> b98e38bdbaf9f00847bf1c42ab739581645211bb
# Swastha Nepal - Medical Service App

<div align="center">
  <img src="assets/images/Blue Modern Minimalist Medical Clinic Logo.png" alt="EMS++ Logo" width="200"/>
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.5.4-blue.svg)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-3.5.4-blue.svg)](https://dart.dev/)
  [![Firebase](https://img.shields.io/badge/Firebase-Enabled-orange.svg)](https://firebase.google.com/)
  [![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
</div>

## 📱 About

Swastha Nepal is a comprehensive Flutter-based mobile application designed to provide emergency medical services and healthcare management features. The app serves as a one-stop solution for medical consultations, appointments, blood donations, and emergency services.

## ✨ Features

### 🏥 Core Medical Services
- **Online Consultation & Prescription**: Connect with doctors and get prescriptions remotely
- **Appointment Booking**: Schedule appointments with healthcare providers
- **Blood Bank Management**: Request blood donations or donate blood
- **Hospital Reporting**: Report issues or concerns about healthcare facilities

### 🤖 AI-Powered Features
- **AI Psychotherapist**: AI-powered mental health support and counseling
- **Smart Recommendations**: Personalized healthcare suggestions

### 📢 Communication & Updates
- **Important Updates**: Stay informed with medical announcements and news
- **Real-time Notifications**: Get instant updates about appointments and services

### 🔐 User Management
- **Secure Authentication**: Firebase-based user authentication
- **User Profiles**: Manage personal information and medical history
- **Account Management**: Complete user account control

## 🛠️ Tech Stack

- **Frontend**: Flutter 3.5.4, Dart
- **Backend**: Firebase (Authentication, Firestore)
- **State Management**: Provider, GetX
- **HTTP Requests**: http package
- **UI Components**: Flutter SVG, Smooth Page Indicator
- **Local Storage**: Shared Preferences
- **Design Tools**: Figma, Canva

## 📱 Screenshots

<div align="center">
  <img src="assets/images/onboarding1.png" alt="Onboarding" width="200"/>
  <img src="assets/images/home.png" alt="Home Screen" width="200"/>
  <img src="assets/images/doctors.png" alt="Doctors" width="200"/>
  <img src="assets/images/appointment.png" alt="Appointment" width="200"/>
</div>

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.5.4 or higher)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ems-plus-plus.git
   cd ems-plus-plus
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

<<<<<<< HEAD
// ... existing code ...
>>>>>>> 2887cd768ce6c4629c1c2619b46f3fe00dbc9ab3
=======
3. **Firebase Setup**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add your Android/iOS app to the project
   - Download and add the configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS

4. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── main.dart                 # App entry point
├── pages/
│   ├── onboarding.dart      # Onboarding screens
│   ├── homescreen.dart      # Main home screen
│   ├── account.dart         # User account management
│   ├── doctors.dart         # Doctor consultation
│   ├── appointment.dart     # Appointment booking
│   ├── donate_blood.dart    # Blood donation
│   ├── ai.dart             # AI psychotherapist
│   ├── announcement.dart   # Medical announcements
│   ├── report_hospital.dart # Hospital reporting
│   ├── chat.dart           # Chat functionality
│   └── wrapper.dart        # Authentication wrapper
assets/
├── images/                 # App images and icons
└── fonts/                  # Custom fonts
```

## 🔧 Configuration

### Firebase Configuration

1. Enable Authentication in Firebase Console
2. Set up Firestore Database
3. Configure security rules for your database

### Environment Variables

Create a `.env` file in the root directory:
```env
FIREBASE_API_KEY=your_api_key
FIREBASE_PROJECT_ID=your_project_id
```

## 📋 Dependencies

### Core Dependencies
```yaml
flutter_svg: ^2.0.17
smooth_page_indicator: ^1.2.0+3
shared_preferences: ^2.5.2
provider: ^6.1.2
get: ^4.7.1
http: ^1.3.0
firebase_core: ^3.11.0
firebase_auth: ^5.4.2
cloud_firestore: ^5.6.3
```

## 🎨 Design Resources

- **Figma Prototype**: [View Design](https://www.figma.com/proto/XkUgPxRDViooC4ge3WJQQR/Test-App?node-id=23-220&t=fLiBoGwNtOHBkKRT-1)
- **Canva Design**: [View Design](https://www.canva.com/design/DAGfGuAgxOM/6TRbYmh9TOWRqwLbsGaUbg/edit?utm_content=DAGfGuAgxOM&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

## 🤝 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- All contributors and testers
- Medical professionals who provided domain expertise

---

<div align="center">
  Made with ❤️ for better healthcare
</div>

