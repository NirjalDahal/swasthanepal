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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final user=FirebaseAuth.instance.currentUser;

  signout() async{
        await FirebaseAuth.instance.signOut();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
          child: AppBar(
            title: Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0), // Adjust the radius as needed
              ),
            ),
            actions: [
        IconButton(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Ellipse 4.png',), // Path to your image
                radius: 20, // Size of the circle
              ),
              onPressed: () {
                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Account()),
                                );
              },
            ),
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: (()=>signout())
        )
      ],
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.sort,
              color: Colors.teal
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 35),
              child: Text(
                  'Features',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 35),
              child: Text(
                  'All the available features of Swastha Nepal',
                  style: TextStyle(
                      color: Colors.teal.shade300,
                      fontWeight: FontWeight.bold,
                      fontSize: 13
                  ),
              ),
            ),
            SizedBox(height: 20),
            // Center all feature containers
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                            ),
                        ],
                    ),
                    height: 80,
                    width: 330,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                padding: EdgeInsets.only(left: 5),
                                child: SvgPicture.asset('assets/images/medical_documentation.svg')
                                ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 200,
                              child: Text(
                                  'Get consultation and prescription',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),
                            ),
                            ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(20, 40),
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    child: Text(
                                      'Go',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Doctors()),
                                      );
                                    }
                                  ),
                        ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.only(left: 5),
                                child: SvgPicture.asset('assets/images/calendar-thin-svgrepo-com.svg')
                                ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 200,
                              child: Text(
                                  'Book an appointment',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),
                            ),
                            ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(20, 40),
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    child: Text(
                                      'Go',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Appointment()),
                                      );
                                    }
                                  ),
                        ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                            ),
                        ],
                    ),
                    height: 80,
                    width: 330,
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.only(left: 5),
                                child: SvgPicture.asset(
                                    'assets/images/blood-donation-svgrepo-com.svg')
                                ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 200,
                              child: Text(
                                  'Donate Blood',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),
                            ),
                            ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(20, 40),
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    child: Text(
                                      'Go',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => DonateBlood()),
                                      );
                                    }
                                  ),
                        ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                            ),
                        ],
                    ),
                    height: 80,
                    width: 330,
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.only(left: 5),
                                child: SvgPicture.asset('assets/images/psychology-book-svgrepo-com.svg')
                                ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 200,
                              child: Text(
                                  'AI Psychotherapist',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),
                            ),
                            ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(20, 40),
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    child: Text(
                                      'Go',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => AI()),
                                      );
                                    }
                                  ),
                        ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                            ),
                        ],
                    ),
                    height: 80,
                    width: 330,
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.only(left: 5),
                                child: SvgPicture.asset('assets/images/exchange-change-svgrepo-com.svg')
                                ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 200,
                              child: Text(
                                  'Important Updates',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),
                            ),
                            ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(20, 40),
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    child: Text(
                                      'Go',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Announcements()),
                                      );
                                    }
                                  ),
                        ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                            ),
                        ],
                    ),
                    height: 80,
                    width: 330,
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                                width: 50,
                                height: 50,
                                padding: EdgeInsets.only(left: 5),
                                child: SvgPicture.asset('assets/images/caution-svgrepo-com.svg')
                                ),
                            Container(
                                padding: EdgeInsets.only(left: 10),
                                width: 200,
                              child: Text(
                                  'Report Hospital',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),
                            ),
                            ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(20, 40),
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                      )
                                    ),
                                    child: Text(
                                      'Go',
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => ReportHospital()),
                                      );
                                    }
                                  ),
                        ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                            ),
                        ],
                    ),
                    height: 80,
                    width: 330,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
          ),
      ),
    );
  }
}