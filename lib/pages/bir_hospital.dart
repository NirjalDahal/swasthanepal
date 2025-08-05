import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test2/pages/booked.dart';


class BirHospital extends StatefulWidget {
  const BirHospital({super.key});

  @override
  State<BirHospital> createState() => _BirHospitalState();
}

class _BirHospitalState extends State<BirHospital> {

  
  TextEditingController timePicker=TextEditingController();
  TextEditingController _dateController=TextEditingController();

  void _showTimePicker() {
    showTimePicker(
      context: context, 
      initialTime: TimeOfDay.now()
      );
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
              'Hospital Details',
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 180),
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                        'Bir Hospital',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 19
                        ),
                    ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                          width: 20,
                                          height: 20,
                                          child: SvgPicture.asset('assets/images/Frame (3).svg')
                                        ),
                              Container(
                                        
                                          child: Text(
                                            'RatnaPark, Kathmandu',
                                            style: TextStyle(
                                              fontSize: 12
                                            ),
                                          )
                                        )
                            ],
                          ),
                          Container(
                                    padding: EdgeInsets.only(right: 180),
                                    child: Text(
                                      'Governmental',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.teal.shade300,
                                        fontSize: 10
                                      ),
                                      ),
                                  ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: Image.asset('assets/images/Rectangle 387.png')
                            ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: SvgPicture.asset('assets/images/Frame (4).svg'),
                                ),
                                Container(
                                  child: Text('Open date',
                                  style: TextStyle(
                                    color: Colors.teal.shade300,
                                    fontSize: 12
                                  ),),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 170),
                                  child: Text('06:00 AM - 09:00 PM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                  ),),
                                )
                          
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
                      height: 330,
                      width: 330,
                    ),
              ),
              SizedBox(height: 15),
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
                                  hintText: 'eg@gmail.com',
                                  hintStyle: TextStyle(
                                    color: Colors.teal.shade300,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400
                                  )
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(right: 250),
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
                                hintText: '+977 0000000000',
                                hintStyle: TextStyle(
                                  color: Colors.teal.shade300,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(right: 265),
                            child: Text(
                              'Select Date',
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
                              controller: _dateController,
                              onTap: () {
                                _selectDate();
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today),
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
                                hintText: 'DD/MM/YY',
                                hintStyle: TextStyle(
                                  color: Colors.teal.shade300,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(right: 265),
                            child: Text(
                              'Select Time',
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
                              controller: timePicker,
                              onTap: () async {
                                var time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now()
                                  );
                                  if(time!=null){
                                    setState((){
                                      timePicker.text=time.format(context);
                                    });
                                  }
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.watch),
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
                                hintText: 'HH:MM:YY AM/PM',
                                hintStyle: TextStyle(
                                  color: Colors.teal.shade300,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            margin: EdgeInsets.only(right: 170),
                            child: Text(
                              'Please describe your issue',
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
                              'Confirm the booking',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Booked()),
                                );
                            }
                          ),
                          SizedBox(height: 30,)
            ],
          ),
        ),
    );
  }

  Future<void> _selectDate() async{
    DateTime? _picked= await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100)
      );
      if (_picked !=null){
        setState(() {
          _dateController.text=_picked.toString().split(" ")[0];
        });
      }
  }

}