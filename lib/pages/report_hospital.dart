import 'package:flutter/material.dart';

class ReportHospital extends StatefulWidget {
  const ReportHospital({super.key});

  @override
  State<ReportHospital> createState() => _ReportHospitalState();
}

class _ReportHospitalState extends State<ReportHospital> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(
              'Report Hospital',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(right: 150),
                child: Text(
                      'Form to report hospital',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                
                      ),
                  ),
              ),
              SizedBox(height: 20),
              Container(
                              margin: EdgeInsets.only(right: 265),
                              child: Text(
                                'Full Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                                )
                              ),
                            SizedBox(height: 5),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  hintText: 'Your Name here',
                                  hintStyle: TextStyle(
                                    color: Colors.teal.shade300,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(right: 265),
                              child: Text(
                                'Email address',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                                )
                              ),
                            SizedBox(height: 5),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  hintText: 'Email EG',
                                  hintStyle: TextStyle(
                                    color: Colors.teal.shade300,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(right: 265),
                              child: Text(
                                'Hospital Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                                )
                              ),
                            SizedBox(height: 5),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  hintText: 'Hospital Name',
                                  hintStyle: TextStyle(
                                    color: Colors.teal.shade300,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(right: 265),
                              child: Text(
                                'Mobile Number',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                                )
                              ),
                            SizedBox(height: 5),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  hintText: '977+',
                                  hintStyle: TextStyle(
                                    color: Colors.teal.shade300,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              margin: EdgeInsets.only(right: 250),
                              child: Text(
                                'Describe you issue',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500
                                ),
                                )
                              ),
                            SizedBox(height: 5),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade400
                                    )
                                  ),
                                  hintText: 'Start typing here',
                                  hintStyle: TextStyle(
                                    color: Colors.teal.shade300,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                              ),
                            ),
                            
                            SizedBox(height: 50,),
                            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 50),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                              
                            ),
                            child: Text(
                              'Send',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onPressed: () {}
                          ),
                          SizedBox(height: 50,)
                    
            ],
          ),
        ),
    );
  }
}