import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For encoding/decoding JSON

class AI extends StatefulWidget {
  const AI({super.key});

  @override
  State<AI> createState() => _AIState();
}

class _AIState extends State<AI> {
  
  final TextEditingController _textController = TextEditingController();


  Future<void> makePostRequest() async {
  // Define the URL
  final url = Uri.parse('http://127.0.0.1:8000/chatAPI');

  // Define the headers (if needed)

  // Define the body of the request (data to be sent)
  final body = jsonEncode({
    'prompt': 'Hi'
  });

  try {
    // Make the POST request
    final response = await http.post(
      url,
      body: body,
    );

    // Check the status code of the response
    if (response.statusCode == 200) {
      // Request was successful
      print('Response data: ${response.body}');
    } else {
      // Request failed
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    // Handle any errors that occur during the request
    print('Error: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(
              'AI Psychotherapist',
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text('⚠️Warning: This AI psychotherapist is not 100% accurate and may not fully understand your situation. If you are facing serious mental health concerns. please consult a licensed psychologist or mental health professional.'),
          
              ),
              SizedBox(height: 200,),
              Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                controller: _textController,
                                keyboardType: TextInputType.multiline,
                                minLines: 4,//Normal textInputField will be displayed
                                maxLines: 5,// when user presses enter it will adapt to it
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
                                'Send',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                              onPressed: makePostRequest,
                            ),
                            ],
          ),
        ),
    );
  }
}