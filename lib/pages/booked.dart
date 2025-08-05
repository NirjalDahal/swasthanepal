import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/pages/home.dart';

class Booked extends StatefulWidget {
  const Booked({super.key});

  @override
  State<Booked> createState() => _BookedState();
}

class _BookedState extends State<Booked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            SvgPicture.asset('assets/images/Success Icon.svg'),
            Container(
              child: Text(
                'Successful',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),

              ),
            ),
            Container(
              child: Text(
                'Successfully booked an appointment',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal.shade300
                ),

              ),
            ),
            Image.asset('assets/images/frame (1) 1.png'),
            SizedBox(height: 30,),
            ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 50),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                              
                            ),
                            child: Text(
                              'Back to Home',
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