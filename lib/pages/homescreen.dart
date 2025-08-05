import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/pages/account.dart';
import 'package:test2/pages/ai.dart';
import 'package:test2/pages/announcement.dart';
import 'package:test2/pages/appointment.dart';
import 'package:test2/pages/doctors.dart';
import 'package:test2/pages/donate_blood.dart';
import 'package:test2/pages/report_hospital.dart';
import 'package:test2/widgets/custom_app_bar.dart';
import 'package:test2/widgets/responsive_layout.dart';
import 'package:test2/widgets/feature_card.dart';
import 'package:test2/utils/app_utils.dart';
import 'package:test2/services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    await _notificationService.initialize();
    await _notificationService.requestPermissions();
  }

  Future<void> signout() async {
    final confirmed = await AppUtils.showConfirmationDialog(
      context,
      'Logout',
      'Are you sure you want to logout?',
    );
    
    if (confirmed) {
      await FirebaseAuth.instance.signOut();
      AppUtils.showSuccessMessage(context, 'Logged out successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResponsiveAppBar(
        title: 'Welcome!',
        showBackButton: false,
      ),
      body: ResponsiveContainer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text(
                'Features',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveLayout.isDesktop(context) ? 28 : 20,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'All the available features of Swastha Nepal',
                style: TextStyle(
                  color: Colors.teal.shade300,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveLayout.isDesktop(context) ? 16 : 13,
                ),
              ),
              SizedBox(height: 30),
              // Responsive grid for features
              ResponsiveGrid(
                children: [
                  FeatureCard(
                    title: 'Get consultation and prescription',
                    description: 'Book appointments with doctors and get online prescriptions',
                    iconPath: 'assets/images/medical_documentation.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Doctors()),
                      );
                    },
                  ),
                  FeatureCard(
                    title: 'Book an appointment',
                    description: 'Schedule appointments with healthcare providers',
                    iconPath: 'assets/images/calendar-thin-svgrepo-com.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Appointment()),
                      );
                    },
                  ),
                  FeatureCard(
                    title: 'Donate Blood',
                    description: 'Donate blood and help save lives',
                    iconPath: 'assets/images/blood-donation-svgrepo-com.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DonateBlood()),
                      );
                    },
                  ),
                  FeatureCard(
                    title: 'AI Psychotherapist',
                    description: 'Get mental health support from AI assistant',
                    iconPath: 'assets/images/psychology-book-svgrepo-com.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AI()),
                      );
                    },
                  ),
                  FeatureCard(
                    title: 'Important Updates',
                    description: 'Stay informed about healthcare news and announcements',
                    iconPath: 'assets/images/exchange-change-svgrepo-com.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Announcements()),
                      );
                    },
                  ),
                  FeatureCard(
                    title: 'Report Hospital',
                    description: 'Generate and view hospital reports',
                    iconPath: 'assets/images/caution-svgrepo-com.svg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ReportHospital()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
          ),
      ),
    );
  }
}