import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/pages/account.dart';
import 'package:test2/pages/announcement.dart';
import 'package:test2/pages/doctors.dart';
import 'package:test2/pages/homescreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    
    int myIndex=0;
    List<Widget> widgetList=[
      HomeScreen(),
      Announcements(),
      Doctors(),
      Account()
      
    ];

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: widgetList[myIndex],
      drawer: Drawer(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(                                                   
          borderRadius: BorderRadius.only(                                           
            topRight: Radius.circular(30), topLeft: Radius.circular(30)),            
          boxShadow: [                                                               
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),       
          ],                                                                         
        ), 
        child: ClipRRect(
          borderRadius: BorderRadius.only(                                           
        topLeft: Radius.circular(30.0),                                            
        topRight: Radius.circular(30.0),                                           
        ),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index){
              setState(() {
                myIndex=index;
              });
            },
            currentIndex: myIndex,
            items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/Frame.svg'),
                      label: 'Home'
                      ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/Frame (1).svg'), 
                      label: 'Home'
                      ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/doctor.svg'),
                      label: 'Home'
                      ),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/images/Frame (2).svg'),
                      label: 'Home'
                      ),
              ],
            ),
        ),
      ),
      );
  }
      
}