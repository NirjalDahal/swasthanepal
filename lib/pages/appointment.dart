import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/pages/bir_hospital.dart';
import 'package:test2/pages/home.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
        "Welcome!",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20.0
        ),
        ),
      actions: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: (){
          },
          iconSize: 42,
        ),
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: (){}
        )
      ],
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.sort,
              color: Colors.green // Change Custom Drawer Icon Color
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
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
                padding: EdgeInsets.only(right: 110),
                child: Text(
                    'Book an appointment',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
              
                    ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 100),
                child: Text(
                    'Check your city nearby hospitals',
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
                width: 350,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: SvgPicture.asset('assets/images/hospital-svgrepo-com.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 50,top: 10),
                                child: Text(
                                    'Bir Hospital',
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
                                      child: SvgPicture.asset('assets/images/Frame (3).svg')
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'RatnaPark, Kathmandu',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 80),
                                child: Text(
                                  'Governmental',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.teal.shade300,
                                    fontSize: 10
                                  ),
                                  ),
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
                                  'Book',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => BirHospital()),
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
                width: 350,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: SvgPicture.asset('assets/images/hospital-svgrepo-com.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 15,),
                                child: Text(
                                    'Annapurna Hospital',
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
                                      child: SvgPicture.asset('assets/images/Frame (3).svg')
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'Thapathali, Kathmandu',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 100),
                                child: Text(
                                  'Private',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.teal.shade300,
                                    fontSize: 10
                                  ),
                                  ),
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
                                  'Book',
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
                width: 350,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: SvgPicture.asset('assets/images/hospital-svgrepo-com.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 15,),
                                child: Text(
                                    'Norvic Hospital',
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
                                      child: SvgPicture.asset('assets/images/Frame (3).svg')
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'Thapathali, Kathmandu',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 100),
                                child: Text(
                                  'Private',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.teal.shade300,
                                    fontSize: 10
                                  ),
                                  ),
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
                                  'Book',
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
                width: 350,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            child: SvgPicture.asset('assets/images/hospital-svgrepo-com.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 35,),
                                child: Text(
                                    'Civil Hospital',
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
                                      child: SvgPicture.asset('assets/images/Frame (3).svg')
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: 100,
                                      child: Text(
                                        'Minbhawan, Kathmandu',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 80),
                                child: Text(
                                  'Governmental',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.teal.shade300,
                                    fontSize: 10
                                  ),
                                  ),
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
                                  'Book',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {}
                              ),
                    ],
                ),
                
              ),
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
              
            ],
            ),
        ),
    );
  }
}