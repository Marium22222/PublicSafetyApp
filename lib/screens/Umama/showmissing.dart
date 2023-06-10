//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
//import'package:flutter/material.dart';
//import 'package:publicsafety/compnents/model.dart';
//class Showmissing extends StatefulWidget {
//  const Showmissing({super.key});
  
//  @override
//  State<Showmissing> createState() => _ShowmissingState();
//}

//class _ShowmissingState extends State<Showmissing> {
//  List<Miss> Item=[];
//  @override
//  void initState(){
//    FirebaseFirestore.instance.collection('missingPerson').snapshots().listen((records) { 
//      mapRecords(records);
//    });

//    fetchRecords();
//    super.initState();
//  }
//  fetchRecords() async{
//     var records=await FirebaseFirestore.instance.collection('missingPerson').get();
//     mapRecords(records);
//  }

//  mapRecords(QuerySnapshot<Map<String,dynamic>> records){
//   var _list= records.docs.map((it) => Miss(id:it.id,age: it['age'], cellnumber: it['cellnumber'],dress: it['dress'],gender: it['gender'],height: it['height'],identity: it['identity'],location: it['loctaion'],lostdate: it['lostdate'],losttime: it['losttime'],name: it['name'],nic:it['nic'],religion: it['religion'],residence: it['residence'])).toList();
//   setState(() {
//    Item=_list;
//   });
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        //actions: [IconButton(onPressed:ShowItemDialogue, icon: const Icon(Icons.add))],
//        title: Text("Add itemm"),
        
//      ),
//      body:ListView.builder(
//        itemCount: Item.length,      
//        itemBuilder: ((context, index){
//          return Container(
//           child: Column(
//            children: [
//              Text(Item[index].name),
//              Text(Item[index].age),
//              Text(Item[index].religion),
//              Text(Item[index].residence),
//              Text(Item[index].identity),
//              Text(Item[index].lostdate),
//              Text(Item[index].losttime),
//              Text(Item[index].nic),
//              Text(Item[index].location),
//              Text(Item[index].dress),

//            ],
//           ),
//          );

//        } )),
//        floatingActionButton: FloatingActionButton(onPressed: (){
//          print(Item.length);
//        }),

    
//    );
//  }
//}


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:publicsafety/compnents/modeltwo.dart';
import 'package:publicsafety/compnents/report.dart';
import 'package:flutter/material.dart';
import 'package:publicsafety/compnents/subbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Baskets extends StatefulWidget {
  
  const Baskets({super.key});

  @override
  State<Baskets> createState() => _BasketsState();
}

class _BasketsState extends State<Baskets> {
 
  List<Item> basketItem=[];
  @override
  void initState(){
    fetchRecords();
    super.initState();
  }


  fetchRecords() async{
    var records = await FirebaseFirestore.instance.collection('Missingpersons').get();
     mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String,dynamic>> records){
    var _list = records.docs.map((e) => Item(id:e.id,ukey:e['ukey'],age:e['age'],cellnumber:e['cellnumber'],name:e['name'],nic:e['nic'],residence:e['residence'],gender:e['gender'],location:e['location'],identity:e['identity'],image:e['image'],lostdate:e['lostdate'],losttime:e['losttime'],dress:e['dress'],height:e['height'],religion:e['religion'])).toList();
 
   setState(() {
    basketItem=_list;
  
    print("List of Missing person pressed");
    
   
   });
  }
  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      //appBar: customBar({super.key}),
      appBar: AppBar(       
        title: Text("Missing Person Details"),
        backgroundColor: Colors.green,
      ),
      body:ListView.builder(
        itemCount: basketItem.length,      
        itemBuilder: ((context, index){
          Future<void> _dialCall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: basketItem[index].cellnumber,
    );
    await launch(launchUri.toString());
  }

          return Card(
            margin: EdgeInsets.fromLTRB(6,12,3,10),         
            shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color.fromARGB(255, 200, 211, 206),
      
    ),
    borderRadius: BorderRadius.circular(22.0), 
  ),
            
           // color: Colors.green[200],
            child: Row(
          
              children: [
              Expanded(
              flex:2,child: Container( width:180,height:200, child:Padding(padding:EdgeInsets.all(12),child: Image.network('${basketItem[index].image}')))),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    SizedBox(height: 8,),
                Text("Name:  "+basketItem[index].name,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
                Text("NIC:  "+basketItem[index].nic,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
                Text("Gender:  "+basketItem[index].gender,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
                Text("Lost Date:  "+basketItem[index].lostdate,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
                ShowDet(FName: basketItem[index].name, Nic: basketItem[index].nic, Gender: basketItem[index].gender, Age: basketItem[index].age, Height: basketItem[index].height, Religion: basketItem[index].religion, Identity: basketItem[index].identity, Residence: basketItem[index].residence, LastSeen: basketItem[index].location, Dress: basketItem[index].dress, LostDt: basketItem[index].lostdate, LostTime: basketItem[index].losttime, Imgurl: basketItem[index].image,Cellnumber: basketItem[index].cellnumber ,),             
                 
               
                 Row(children: [
                  ElevatedButton(
                  
                          child: const Text('If found, Please call',style: TextStyle(color:Colors.black,),),
                          onPressed: () => _dialCall(),
                          style:ElevatedButton.styleFrom(primary: Color.fromARGB(255, 107, 221, 111)
                        ),),
                        //SizedBox(width: 7,),
                MyBtn(DelId:basketItem[index].id,chKey:basketItem[index].ukey),

                 ],)
                 
                      
                          ],
                ),
              )

              ],
            ),
            
      
          );
          

          
        } )),
    );
  

   
}
}
class MyBtn extends StatelessWidget {
   final String DelId;
   final String chKey;

  const MyBtn({
    required this.DelId,
    required this.chKey,
  });

  @override
  Widget build(BuildContext context) {
    var getkeycontroller=TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Confirm Remove Post?'),
                  shadowColor: Color.fromARGB(255, 56, 212, 77),      
                 // content: Text('$DelId $chKey'),
                  content: Column(
                    children: [
                       SizedBox(
            width:140,
          child: TextFormField(   
            decoration: InputDecoration(
              focusColor: Colors.green,
              hintText: "Enter unique key",
              fillColor: Colors.green,
              
            ),     
              controller: getkeycontroller,          
            ),
        ),
        SizedBox(height: 20,),
                      ElevatedButton(onPressed: () async{
                        if(getkeycontroller.text==chKey)   {
                  await FirebaseFirestore.instance.collection('Missingpersons').doc(DelId).delete() ;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Post deleted!")));
                }  
               else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Unique Key")));
                } 
                      }, child: Text("Delete"),style: ElevatedButton.styleFrom(primary: Colors.green),)
                           
                    ],
                  ),
                  actions: [
                    TextButton(
                      child: Text('Ok'),
                      onPressed: ()  {
                         Navigator.of(context).pop();
                      },
                    ),
                  ],
                   
                );
              },
            );
          },
           icon:Icon(Icons.delete),
        style: ElevatedButton.styleFrom(primary: Colors.green),),
      ],
    );
  }
}

class ShowDet extends StatelessWidget {
   final String FName;
   final String Nic;
   final String Gender;
   final String Age;
   final String Height;
   final String Religion;
   final String Identity;
   final String Residence;
   final String LastSeen;
   final String Dress;
   final String LostDt;
   final String LostTime;
   final String Imgurl;
   final String Cellnumber;

  const ShowDet({
    required this.FName,
    required this.Nic,
    required this.Gender,
    required this.Age,
    required this.Height,
    required this.Religion,
    required this.Identity,
    required this.Residence,
    required this.LastSeen,
    required this.Dress,
    required this.LostDt,
    required this.LostTime,
    required this.Imgurl,
    required this.Cellnumber,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(        
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Complete Details of \n     $FName'),
              shadowColor: Color.fromARGB(255, 56, 212, 77),      
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(Icons.calendar_month),
                    Text(LostDt,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15.5)),
                    SizedBox(width: 15,),
                      Icon(Icons.access_time_sharp),
                    Text(LostTime,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15.5)),              
                  ],),
                  SizedBox(height: 14,),
                  Center(child:CircleAvatar( radius: 70,backgroundImage:NetworkImage(Imgurl),backgroundColor: Colors.transparent,)),
                  SizedBox(height: 10,),
            Text("NIC:  "+Nic,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            Text("Age:  "+Age,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            Text("Gender:  "+Gender,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            Text("Height:  "+Height,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            Text("Religion:  "+Religion,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            Text("Identity: "+Identity,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            Text("Dress worn: "+Dress,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            Text("Residence: "+Residence,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            Text("Last seen at: "+LastSeen,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5)),
            SizedBox(height: 5,),
            Text("Reporter No: ",style:TextStyle(fontWeight: FontWeight.bold,fontSize: 19.5)),
            Row(children: [
              Icon(Icons.phone,color:Colors.green),
            Text(" "+Cellnumber,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5,color:Colors.green)),
            ],),     
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Ok'),
                  onPressed: ()  {
                     Navigator.of(context).pop();
                  },
                ),
              ],
               
            );
          },
        );
      },
       child:Text("Details",style: TextStyle(color:Colors.green),),
    style: ElevatedButton.styleFrom(primary: Colors.white),);
  }
}



