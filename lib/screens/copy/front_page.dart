import 'dart:io';
import 'package:flutter/material.dart';
import 'package:new_ecom_proj/main.dart';

import '../Umama/dimension.dart';


class FrontPage extends StatelessWidget {


  const FrontPage({Key? key,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
backgroundColor: Colors.black,
        child: ListView(
          children: [
            // CircleAvatar(backgroundImage:FileImage(image),
            // radius:40 ,),
            UserAccountsDrawerHeader(
              currentAccountPicture: Image.asset("Images/use1.webp"),
decoration: BoxDecoration(
  color: Colors.green
),

                accountName: Text("Marium Amir"),
                accountEmail: Text("marium@gmail.com")),

 ListTile(

              leading: Icon(Icons.person,
              color: Colors.white,),
              title:Text('Username',
              style: TextStyle(
                color: Colors.white
              ),),
              subtitle:Text("Marium Amir",
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
      appBar: AppBar(
        backgroundColor: Colors.green,

        title: Text('Welcome',
        style: TextStyle(
          fontSize: Dim.width15
        ),),
        centerTitle: true,

      ),

      body: Column(

        children: [

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dim.height20),

            ),
            width: Dim.width400,
            height: Dim.height200,
            child: Image(image: AssetImage("Images/Public Safety App.png",

            ),
            fit: BoxFit.fill,
            height: Dim.height250,),
          ),
          Expanded(child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

              // crossAxisSpacing: 5,
              // mainAxisSpacing: 5,


          ),
            children: [
    GestureDetector(
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) =>  MyHomePage(

    )));
    },
    child:Container(
            margin: EdgeInsets.all(Dim.height20),

      decoration: BoxDecoration(
    boxShadow: [
    BoxShadow(
    color:           Color.fromARGB(255, 17, 131, 26),
    blurRadius: 5,
    offset: Offset(0,5),),
    BoxShadow(
    color:           Color.fromARGB(255, 17, 131, 26),
    blurRadius: 5,
    offset: Offset(-5,5),),

    ],
      borderRadius: BorderRadius.circular(Dim.height30),
      border: Border.all(width: Dim.width5,
        color: Colors.white,

      ),
      ),
      child: Column(
        children: [
          Image.asset("Images/crime-removebg-preview.png",
              width: Dim.width150,
          height: Dim.height80),
          Center(child: Text('Crime Reporting ',
          style: TextStyle(
          fontFamily: "Times New Roman",
            color: Colors.white,
          fontSize: Dim.height10,
          fontWeight: FontWeight.bold,

          )
          )),
        ],
      ),
      ),
    ),
 Padding(
    padding:  EdgeInsets.all(Dim.height15),
    child: GestureDetector(
    onTap: () {
    // Navigator.push(
    // context,
    // MaterialPageRoute(
    // builder: (context) => const Alerts()));
    },
    child:Container(
            margin: EdgeInsets.all(Dim.height5),

      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:           Color.fromARGB(255, 17, 131, 26),
            blurRadius: 5,
            offset: Offset(0,5),),
          BoxShadow(
            color:           Color.fromARGB(255, 17, 131, 26),
            blurRadius: 5,
            offset: Offset(-5,5),),

        ],
      borderRadius: BorderRadius.circular(Dim.height30),
      border: Border.all(width: Dim.width5,
        color: Colors.white,

      ),
      ),
      child: Column(
        children: [
          Image.asset("Images/miss-removebg-preview.png",width: Dim.height100,
          height: Dim.height80,),
          Center(child: Text('Missing Person ',
          style: TextStyle(
          fontFamily: "Times New Roman",
            color: Colors.white,
          fontSize: Dim.height10,
          fontWeight: FontWeight.bold,

          )
          )),
        ],
      ),
      ),
    ),
    ),

              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  // builder: (context) => const Alerts()));
                },
                child:Container(
                  margin: EdgeInsets.all(Dim.height20),

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color:           Color.fromARGB(255, 17, 131, 26),
                        blurRadius: 5,
                        offset: Offset(0,5),),
                      BoxShadow(
                        color:           Color.fromARGB(255, 17, 131, 26),
                        blurRadius: 5,
                        offset: Offset(-5,5),),

                    ],
                    borderRadius: BorderRadius.circular(Dim.height30),
                    border: Border.all(width: 5,
                      color: Colors.white,

                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("Images/personal-removebg-preview.png",
                        width: Dim.height100,
                        height: Dim.height80,),
                      Center(child: Text('Personal Safety ',
                          style: TextStyle(
                            fontFamily: "Times New Roman",
                            color: Colors.white,
                            fontSize: Dim.height10,
                            fontWeight: FontWeight.bold,

                          )
                      )),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Dim.height10),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    // builder: (context) => const Alerts()));
                  },
                  child:Container(
                    margin: EdgeInsets.all(Dim.height10),

                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color:           Color.fromARGB(255, 17, 131, 26),
                          blurRadius: 5,
                          offset: Offset(0,5),),
                        BoxShadow(
                          color:           Color.fromARGB(255, 17, 131, 26),
                          blurRadius: 5,
                          offset: Offset(-5,5),),

                      ],
                      borderRadius: BorderRadius.circular(Dim.height30),
                      border: Border.all(width: 5,
                        color: Colors.white,

                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset("Images/precau-removebg-preview.png",width: Dim.height100,
                          height: Dim.height80,),
                        Center(child: Text('Precautions ',
                            style: TextStyle(
                              fontFamily: "Times New Roman",
                              color: Colors.white,
                              fontSize: Dim.height10,
                              fontWeight: FontWeight.bold,

                            )
                        )),
                      ],
                    ),
                  ),
                ),
              ),



            ],
          ))
        ],
      ),
    );
  }
}
