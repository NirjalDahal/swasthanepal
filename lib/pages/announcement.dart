import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Announcements extends StatefulWidget {
  const Announcements({super.key});

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
          child: AppBar(
            
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(
              'Campaigns and Announcements',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20
              ),
              ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0), // Adjust the radius as needed
              ),
            ),
          ),
        ),
        body:Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
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
                            child: SvgPicture.asset('assets/images/medical_documentation.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 250,
                                padding: EdgeInsets.only(right: 50,top: 10),
                                child: Text(
                                    'Abc vaccination campaign',
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
                                     
                                      child: Text(
                                        'Nearest vaccination campaign',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              ),
                              
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
                                  'Check',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {
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
                            child: SvgPicture.asset('assets/images/medical_documentation.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 250,
                                padding: EdgeInsets.only(right: 50,top: 10),
                                child: Text(
                                    'Elephantiasis campaign',
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
                                     
                                      child: Text(
                                        'Every home of nepal',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              ),
                              
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
                                  'Check',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {
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
                            child: SvgPicture.asset('assets/images/medical_documentation.svg')
                            ),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 250,
                                padding: EdgeInsets.only(right: 50,top: 10),
                                child: Text(
                                    'Haatkhola',
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
                                     
                                      child: Text(
                                        'Basanti',
                                        style: TextStyle(
                                          fontSize: 10
                                        ),
                                      )
                                    )
                                  ]

                                )
                              ),
                              
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
                                  'Check',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                onPressed: () {
                                }
                              ),
                    ],
                ),
                
              ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                      'Important Updates',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                
                      ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                      'from Government of Nepal',
                      style: TextStyle(
                          color: Colors.teal.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                
                      ),
                  ),
                ),
                SizedBox(height: 20,),
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
                  height: 330,
                  width: 350,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Container(
             
              child: Text(
                  'Ministry of Heath and Population',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
            
                  ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                      'Federal government',
                      style: TextStyle(
                          color: Colors.teal.shade300,
                          fontWeight: FontWeight.bold,
                          fontSize: 13
                
                      ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: SvgPicture.asset('assets/images/Frame (4).svg'),
                ),
                Container(
                  padding: EdgeInsets.only(right: 0),
                  child: Text('07:08 AM'),
                )
              ],
            ),
            SizedBox(height: 20,),
            Container(
              width: 320,
              child: Image.asset('assets/images/Rectangle 387 (1).png'))
                    ],
                  )
                ),
                SizedBox(height: 20),
                
              ],
              ),
              
          ),
        ),
    );
  }
}