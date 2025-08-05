import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  signIn() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email:email.text, password:password.text);
    Navigator.pop(context);
  }

  final controller=PageController();
  bool isLastPage=false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle,
  }) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            SvgPicture.asset(
              urlImage,
            ),
            SizedBox(height: 90),
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                color: Colors.teal.shade800,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 0.0),
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.teal.shade300)
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(()=>isLastPage=index==3);
          },
          children: [
            buildPage(
            color: Colors.white,
            urlImage: 'assets/images/Tracking & Maps.svg',
            title: "Book appointments",
            subtitle: "You don't have to go far to book an appointment, you can book your appointment directly from the app"
           ),
           buildPage(
            color: Colors.white,
            urlImage: 'assets/images/Order illustration.svg',
            title: "Blood bank",
            subtitle: "Request for blood or donate blood to the blood bank."
           ),
           buildPage(
            color: Colors.white,
            urlImage: 'assets/images/Safe Food.svg',
            title: "Get online prescription",
            subtitle: 'You can get online prescription to get medicines from any pharmaceutical anywhere in Nepal.'
           ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0.0),
                child: Image.asset('assets/images/Blue Modern Minimalist Medical Clinic Logo.png'),
              ),
              Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.teal.shade800,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  'Before Enjoying Swastha Nepal, please register first',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal.shade400,
                    fontSize: 13.5
                    
                  ),
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
                  'Create Account',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                onPressed: () {
                  _displayBottomSheet(context, 0);
                }
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(260, 50),
                  backgroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                  
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.green
                  ),
                ),
                onPressed: () {
                  _displayBottomSheet(context, 1);
                }
              ),
              SizedBox(height: 50),
             
            ],
          ),

          ],
        ),
      ),
      bottomSheet: isLastPage
          ? SizedBox(
            height: 100,
            child: Container(
              color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.5
                      ),
                      children: [
                        TextSpan(text: 'By Logging in Or Registering, You Have Agreed To '),
                        TextSpan(text: 'The Terms And Conditions',
                        style: TextStyle(color: Colors.green)
                        ),
                        TextSpan(text: ' And '),
                        TextSpan(text: 'Privacy Policy',
                        style: TextStyle(color: Colors.green))
                        
                      ]
                    )
                  ),
                ),
          )
           
          : Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    TextButton(
                        child: Text(
                          'SKIP',
                          style: TextStyle(color: Colors.green),
                          ),
                        onPressed: () => controller.jumpToPage(3),
                      ),
                      Center(
                        child: SmoothPageIndicator(
                          controller: controller,
                          count: 3,
                          effect: JumpingDotEffect(
                            dotWidth:  12.0,    
                            dotHeight:  12.0,
                            spacing: 16,
                            dotColor: Colors.green.shade100,
                            activeDotColor: Colors.green.shade400
                          ),
                          onDotClicked: (index)=>controller.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn
                          ),
                        ),
                      ),
                  IconButton(
                    iconSize: 25,
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.green,
                      ),
                    onPressed: () => controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut
                    ),
                  )
                ],
              )
            )
    );
  }
  Future _displayBottomSheet(BuildContext context, int initialIndex) {
    return showModalBottomSheet(
      scrollControlDisabledMaxHeightRatio: 0.75,
      context: context,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: DefaultTabController(
          initialIndex: initialIndex,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              bottom: TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.teal.shade300,
                dividerColor: Colors.transparent,
                tabs: [
                  Tab(
                    icon: Text('Create Account'),
                  ),
                  Tab(
                    icon: Text('Login'),
                  ),
                ],
              ),
              title:SvgPicture.asset('assets/images/Line 1.svg'),
              centerTitle: true,
            ),
            body: TabBarView(
              children: [
                Center(
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            child: TextField(
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
                                hintText: 'Enter your full name',
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
                            margin: EdgeInsets.only(right: 240),
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
                            child: TextField(
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
                                hintText: 'Eg nameemail@emailkamu.com',
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
                              'Password',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                              ),
                              )
                            ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
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
                                hintText: '**** **** ****',
                                hintStyle: TextStyle(
                                  color: Colors.teal.shade300,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 50),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                              
                            ),
                            child: Text(
                              'Registration',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onPressed: () {}
                          ),
                          SizedBox(height: 10),
                          SvgPicture.asset('assets/images/Line 3.svg'),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 50),
                              backgroundColor: Colors.white60,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                              
                            ),
                            child: Text(
                              'Sign up with Google',
                              style: TextStyle(
                                color: Colors.green
                              ),
                            ),
                            onPressed: () {}
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Container(
                            margin: EdgeInsets.only(right: 240),
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
                              controller: email,
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
                                hintText: 'Eg nameemail@emailkamu.com',
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
                              'Password',
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
                              obscureText: true,
                              controller: password,
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
                                hintText: '**** **** ****',
                                hintStyle: TextStyle(
                                  color: Colors.teal.shade300,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400
                                )
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            margin: EdgeInsets.only(left: 240),
                            child: TextButton(
                              child: Text(
                                'Forget password?',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13
                                ),
                                ),
                              onPressed: () {},
                            )
                            ),
                          SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 50),
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                              
                            ),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            onPressed: (()=>signIn())
                          ),
                          SizedBox(height: 10),
                          SvgPicture.asset('assets/images/Line 3.svg'),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(260, 50),
                              backgroundColor: Colors.white60,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              )
                              
                            ),
                            child: Text(
                              'Login with Google',
                              style: TextStyle(
                                color: Colors.green
                              ),
                            ),
                            onPressed: () {}
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}