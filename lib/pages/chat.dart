import 'package:flutter/material.dart';
import 'package:test2/pages/home.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
          child: AppBar(
            
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(
              'Chat with Dr. Alok',
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
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 540,),
                Container(
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  
                                  keyboardType: TextInputType.multiline,
                                  minLines: 1,//Normal textInputField will be displayed
                                  maxLines: 5,// when user presses enter it will adapt to it
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.chat),
                                    suffixIcon: Icon(Icons.send),
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
                                    hintText: 'Start Typing here',
                                    hintStyle: TextStyle(
                                      color: Colors.teal.shade300,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400
                                    )
                                  ),
                                ),
                              ),
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
                                },
                              ),
              ],
            ),
          ),
        ),
    );
  }
}