import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
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
                height: 100,
                width: 350,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/Ellipse 4.png',), // Path to your image
                radius: 25, // Size of the circle
              ),
                      ),
                        
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 20,top: 30),
                                width: 200,
                              child: Text(
                                  'Test User',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 70),
                              child: Text(
                                'test2@gmail.com',
                                style: TextStyle(
                                  color: Colors.teal.shade300,
                                  fontSize: 10
                                ),
                              ),
                            )
                          ],
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.notification_important))
                    ],
                ),
                
              ),
              SizedBox(height: 50,),
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
                height: 100,
                width: 350,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.account_circle,
                          size: 40,
                          )
                      ),
                        
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(left: 20,top: 40),
                                width: 200,
                              child: Text(
                                  'Account Settings',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                  ),
                              ),
                            ),
                          
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: IconButton(onPressed: () {}, icon: Icon(Icons.edit)))
                    ],
                ),
                
              ),
              
              SizedBox(height: 200,),
              ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 50),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                              
                            ),
                            child: Text(
                              'Log Out',
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
    );
  }
}