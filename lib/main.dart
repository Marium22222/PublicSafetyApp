
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_ecom_proj/screens/Umama/dimension.dart';
import 'package:new_ecom_proj/screens/copy/alerttry.dart';
import 'package:new_ecom_proj/screens/copy/crime_alert_screen.dart';
import 'package:new_ecom_proj/screens/copy/crime_help.dart';
import 'package:new_ecom_proj/screens/copy/crime_map.dart';
import 'package:new_ecom_proj/screens/copy/crime_map_screen.dart';
import 'package:new_ecom_proj/screens/copy/front_page.dart';
import 'package:new_ecom_proj/screens/copy/report_crime.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(GetMaterialApp(
      home:FrontPage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor:          Color.fromARGB(255, 17, 131, 26),
        title: Text("Crime Section "),
        centerTitle: true,

      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.green
                ),
                currentAccountPicture: Image.asset("Images/use1.webp"),
                accountName: Text("Marium"),
                accountEmail: Text("marium@gmail.com")),

            ListTile(

              leading: Icon(Icons.person,
                color: Colors.white,),
              title:Text('Username',
                style: TextStyle(
                    color: Colors.white
                ),),
              subtitle:Text("Marium",
                style: TextStyle(
                    color: Colors.white
                ),),
              trailing:Icon(Icons.edit
                ,color: Colors.white,),
              onTap: (){

              },
            ),
            ListTile(

              leading: Icon(Icons.key,
                color: Colors.white,),
              title:Text('Password',
                style: TextStyle(
                    color: Colors.white
                ),),
              subtitle:Text('************',
                style: TextStyle(
                    color: Colors.white
                ),),
              trailing:Icon(Icons.edit,
                color: Colors.white,),
              onTap: (){

              },
            ),
            SizedBox(
              height: Dim.height200,
            ),
            TextButton(onPressed: (){
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) =>LoginPage()));
            }, child: Text('Logout',
              style: TextStyle(
                  color: Colors.white
              ),)) ,
            TextButton(onPressed: (){}, child: Text('Settings',
              style: TextStyle(
                  color: Colors.white
              ),))
          ],
        ),

      ),
      body: Column(
        children: [
          CustomPaint(
            painter: AppbarPainter(),
            size: const Size(400, 200),
            child: _appBarContent(),
          ),
          Expanded(
            child: GridView(gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                childAspectRatio: 1 / .95,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
              children: [
                Padding(
                  padding:  EdgeInsets.all(Dim.width19),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Alerts()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(Dim.height5),

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(Dim.width19),
                        border: Border.all(width: Dim.width5,
                          color: Colors.lightGreen,

                        ),
                      ),
                      child: Center(child: Text('Crime Alerts',
                        style: TextStyle(
                          fontFamily: "Times New Roman",
                          color: Colors.white,
                          fontSize: Dim.height12,
                          fontWeight: FontWeight.bold,

                        ),
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.all(Dim.width19),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CrimeMap2()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(Dim.height5),

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(Dim.width19),
                        border: Border.all(width: Dim.width5,
                          color: Colors.lightGreen,
                        ),
                      ),
                      child: Center(child: Padding(
                        padding:  EdgeInsets.all(Dim.height12),
                        child: Text('View Crime Areas',
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            color: Colors.white,
                            fontSize: Dim.height12,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Times New Roman",
                          ),),
                      )),
                    ),
                  ),
                ), Padding(
                  padding: EdgeInsets.all(Dim.width19),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CrimeReport()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(Dim.height5),

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(Dim.width19),
                        border: Border.all(width: Dim.width5,
                          color: Colors.lightGreen,
                        ),
                      ),
                      child: Center(child: Text('Report Crime',
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            color: Colors.white,
                            fontSize: Dim.height12,
                            fontWeight: FontWeight.bold
                        ),)),
                    ),
                  ),
                ), Padding(
                  padding: EdgeInsets.all(Dim.width19),
                  child: GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) =>  CrimeHelp(title: '',)));
                    },
                    child: Container(
                      margin: EdgeInsets.all(Dim.height5),

                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(Dim.width19),
                        border: Border.all(width: Dim.width5,
                          color: Colors.lightGreen,
                        ),
                      ),
                      child: Center(child: Text('Crime help',
                        style: TextStyle(
                            fontFamily: "Times New Roman",
                            color: Colors.white,
                            fontSize: Dim.height12,
                            fontWeight: FontWeight.bold
                        ),)),
                    ),
                  ),
                ),

              ],

            ),
          )
        ],
      ),
    );
  }

  Widget _appBarContent() {
    return Container(
      height: Dim.height150,
      width: Dim.width400,
      margin: EdgeInsets.symmetric(vertical: Dim.height40, horizontal: Dim.width19),
      child: Column(
        children: [
          _header(),
          SizedBox(height: 20,),
          _userInfo()

        ],
      ),
    );
  }

  Widget _header() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon(Icons.menu, color: Colors.white, size: 30),
          // Icon(Icons.arrow_back_rounded, color: Colors.white, size: 30),

        ]
    );
  }

  Widget _userInfo() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userAvatar(),
          SizedBox(width: Dim.width19,),
          Expanded(
            flex: 1,
            child: Column(
                children: [
                  _userPersonalInfo(),
                  SizedBox(
                    height: Dim.height20,
                  ),
                  _userFollowInfo(),
                ]
            ),),
        ]
    );
  }

  Widget _userAvatar() {
    return CircleAvatar(
      radius: Dim.height40,
      backgroundImage: AssetImage("Images/use1.webp"),
    );
  }

  Widget _userPersonalInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               "Marium Amir",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Dim.height20,
                    color: Colors.white),

              ),
              SizedBox(height: Dim.height10,),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                    size: Dim.height20,
                  ),
                  SizedBox(
                    width: Dim.width5,
                  ),
                  Text(
                    "karachi",
                    style: TextStyle(
                        fontSize: Dim.height15,
                        letterSpacing: 2,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        // Expanded(
        //     flex: 1,
        //     child: Container(
        //       height: Dim.height30,
        //       child: Center(
        //         child: Text('Follow',
        //           style: TextStyle(
        //               color: Color.fromARGB(255, 177, 101, 195),
        //               fontWeight: FontWeight.w500
        //           ),),
        //       ),
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.circular(10)
        //       ),
        //
        //     ))

      ],
    );
  }

  Widget _userFollowInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      ],
    );
  }
}

class AppbarPainter extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    var rect= Offset.zero & size;
    Paint paint=Paint();
    Path path=Path();
    paint.shader= LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color.fromARGB(255, 69, 158, 76),
          Color.fromARGB(255, 17, 131, 26),

    // Color.fromARGB(241, 76, 237, 116),
    // Color.fromARGB(241, 76, 237, 140),
        ],).createShader(rect);
    // paint.color=Colors.blue;
    path.lineTo(0, size.height-size.height/8);
    path.conicTo(size.width/1.3, size.height, size.width, size.height-size.height/7,8 );
    path.lineTo(size.width, 0);
    canvas.drawShadow(path, Color.fromARGB(255, 242, 101, 197), 4, false);
    path.close();
canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate){
    return true;
  }
}
