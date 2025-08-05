import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/pages/account.dart';
import 'package:test2/pages/chat.dart';
import 'package:test2/pages/home.dart';

class Doctors extends StatefulWidget {
  const Doctors({super.key});

  @override
  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
          child: AppBar(
            
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
          onPressed: () {}
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
      body:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                labelText: "Search", 
                labelStyle: TextStyle(color: Colors.teal.shade300),
                prefixIcon: 
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
          SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(right: 240),
                child: Text(
                    'Doctors',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
              
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 135),
                child: Text(
                    'Book doctors and treat you illness',
                    style: TextStyle(
                        color: Colors.teal.shade300,
                        fontWeight: FontWeight.bold,
                        fontSize: 13
              
                    ),
                ),
              ),
              SizedBox(height: 20),
              Container(
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
                width: 360,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                          width: 50, height: 50,
                            padding: EdgeInsets.only(left: 5),
                            child: SvgPicture.asset('assets/images/doctor-svgrepo-com.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 15, top: 10),
                                child: Text(
                                    'Dr. Alok Jung Shah',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: SvgPicture.asset('assets/images/Vector (1).svg')
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'MBBS, MD, Opthamologist',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              )
                            ],
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
                                  'Consult',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Chat()),
                                );
                                }
                              ),
                    ],
                ),
                
              ),
              SizedBox(height: 20),
              Container(
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
                width: 360,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                          width: 50, height: 50,
                            padding: EdgeInsets.only(left: 5),
                            child: SvgPicture.asset('assets/images/doctor-svgrepo-com.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 15, top: 10),
                                child: Text(
                                    'Dr. Kapil Ghimire',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: SvgPicture.asset('assets/images/Vector (1).svg')
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'MBBS, MD, Genera Physician',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              )
                            ],
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
                                  'Consult',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {}
                              ),
                    ],
                ),
                
              ),
              SizedBox(height: 20),
              Container(
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
                width: 360,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                          width: 50, height: 50,
                            padding: EdgeInsets.only(left: 5),
                            child: SvgPicture.asset('assets/images/doctor-svgrepo-com.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 15, top: 10),
                                child: Text(
                                    'Dr. Abhisek Yadav',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: SvgPicture.asset('assets/images/Vector (1).svg')
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'MBBS, MD, Dentist',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              )
                            ],
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
                                  'Consult',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {}
                              ),
                    ],
                ),
                
              ),
              SizedBox(height: 20),
              Container(
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
                width: 360,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                          width: 50, height: 50,
                            padding: EdgeInsets.only(left: 5),
                            child: SvgPicture.asset('assets/images/doctor-svgrepo-com.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 15, top: 10),
                                child: Text(
                                    'Dr. Karan Shah',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold
                                    ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 20,
                                      height: 20,
                                      child: SvgPicture.asset('assets/images/Vector (1).svg')
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                          'MBBS, MD, DM, Surgeon',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              )
                            ],
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
                                  'Consult',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {}
                              ),
                    ],
                ),
                
              ),
              SizedBox(height: 20),
              SizedBox(height: 50),
              ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 50),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                              
                            ),
                            child: Text(
                              'Home',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage()),
                                );
                            }
                          ),
                          SizedBox(height: 30,)
              
              
            ],
            ),
        ),
    );
  }
}