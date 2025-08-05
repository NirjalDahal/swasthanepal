# Swastha Nepal - Emergency Medical Service App

<div align="center">
  <img src="assets/images/medical_documentation.svg" alt="EMS++ Logo" width="200"/>
  
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

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Team

- **Developer**: [Your Name]
- **Designer**: [Designer Name]
- **Project Manager**: [PM Name]

## 📞 Support

If you have any questions or need support, please contact:
- Email: [your-email@example.com]
- GitHub Issues: [Create an issue](https://github.com/yourusername/ems-plus-plus/issues)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- All contributors and testers
- Medical professionals who provided domain expertise

---

<div align="center">
  Made with ❤️ for better healthcare
</div>
