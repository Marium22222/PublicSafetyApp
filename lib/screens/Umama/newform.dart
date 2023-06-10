import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:publicsafety/compnents/showmissing.dart';
class Reort2 extends StatefulWidget {
  const Reort2({super.key});

  @override
  State<Reort2> createState() => _Reort2State();
}

class _Reort2State extends State<Reort2> {
  String gender = "Male";
  DateTime date=DateTime(2023,05,13);
  TimeOfDay time=TimeOfDay(hour: 10, minute: 30);
  File? _image;
  String imageurl='';
   TextEditingController _fullname=TextEditingController();
  TextEditingController _nic=TextEditingController();
  TextEditingController _age=TextEditingController();
  TextEditingController _religion=TextEditingController();
  TextEditingController _identity=TextEditingController();
  TextEditingController _height=TextEditingController();
  TextEditingController _dresscolour=TextEditingController();
  TextEditingController _resid=TextEditingController();
  TextEditingController _location=TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController keys = TextEditingController();
  
  Future getImage () async{
    final image=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image==null){
      return;
    }
    final imageTemporary = File(image.path);
    setState(() {
      this._image=imageTemporary;
    });
  }

  Future _selectDate(BuildContext context) async {
      DateTime? newDate = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(1970), lastDate: DateTime(2025)); 
      if (newDate==null){
        return;
      }
      setState(() {
        date=newDate;         
     }
    );
                  
  }

   Future _selectTime(BuildContext context) async {
    TimeOfDay?newTime=await showTimePicker(context: context, initialTime: time,); 
                if (newTime==null){
                  return;
                }
                setState(() {
                  time=newTime;
             
                }
                );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report a Missing Person'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
      child: Column(
     
        children: [
          SizedBox(height:5),
          textFeild("Full Name", "Enter Full Name ",_fullname),
          //SizedBox(height: 5,),
          textFeild("NIC", "Enter CNIC number",_nic),
          //SizedBox(height: 5,),
           Row(children: [
                  SizedBox(width: 15,),
                  Text("Gender",style: TextStyle(color: Colors.green,fontSize: 17.3,fontWeight:FontWeight.bold),),
                  SizedBox(width: 15,),
                  Radio(
                  value: "Male" ,
                  activeColor: Colors.green, groupValue: gender, onChanged: (value) { setState(() {
                    gender=value.toString();
                  });},
                ),
                SizedBox(width: 2,),
                Text("Male",style: TextStyle(color: Colors.grey,fontSize: 20),),
                SizedBox(width: 19,),
                
                Radio(
                  value: "Female" ,
                  
                  activeColor: Colors.green, groupValue: gender, onChanged: (value) { setState(() {
                    gender=value.toString();
                  });
                  },
                ),
                SizedBox(width: 2,),
                Text("Female",style: TextStyle(color: Colors.grey,fontSize: 20),),
                
                ],),
                textFeild("Age", "Enter the age ",_age),
          SizedBox(height: 5,),

                textFeild("Height", "Enter approx height ",_height),
          SizedBox(height: 5,),
                
                textFeild("Religion", "Enter religion/belief",_religion),
          SizedBox(height: 5,),
          textFeild("Specific Identity", "Enter any specific mark ",_identity),
          SizedBox(height: 5,),
              textFeild("Residence", "Enter permanent address",_resid),
          SizedBox(height: 5,),
          textFeild("Last Seen Location", "Enter last seen location",_location),
          SizedBox(height: 5,),
           textFeild("Dress worn", "Enter type & color of dress",_dresscolour),
          SizedBox(height: 5,),
           SizedBox(height: 5,),     
          textFeild("Unique Key", "Enter any unique code",keys),
          SizedBox(height: 5,),
           textFeild("Reporter Contact", "Enter relative/reporter cellnumber",number),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Select Lost Date",style: TextStyle(color:Colors.green,fontSize: 16.0),),
              GestureDetector(
            onTap:()=> _selectDate(context),
            child: Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color:Colors.white,boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 69, 158, 76),
                              blurRadius: 2.0,
                             offset: Offset(0, 5)
                             ),
                          BoxShadow(
                              color: Color.fromARGB(255, 69, 158, 76),
                              blurRadius: 2.0,
                             offset: Offset(-5, 5)
                             )
                        ], ),
              child: Row(
            children:[
              Icon(Icons.calendar_today_rounded,color: Colors.green,),
              Text(date != null?' ${date.day}/${date.month}/${date.year}':"dd-mm-yy",style: TextStyle(color:Colors.green,fontSize: 18),),
          
            ]
            
          
              ),
          
            ),
          ),
                
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Select Lost Time",style: TextStyle(color:Colors.green,fontSize: 16.0),),
              GestureDetector(
            onTap:()=> _selectTime(context),
            child: Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color:Colors.white,boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 69, 158, 76),
                              blurRadius: 2.0,
                              offset: Offset(0, 5)
                             ),
                          BoxShadow(
                              color: Color.fromARGB(255, 69, 158, 76),
                              blurRadius: 2.0,
                              offset: Offset(-5, 5)
                             )
                        ], ),
              child: Row(
            children:[
              Icon(Icons.timer,color:Colors.green),
              Text(time != null?' ${time.hour.toString()}:${time.minute.toString()}pm':"hh:mm",style: TextStyle(color:Colors.green,fontSize: 18),),
          
            ]
            
          
              ),
          
            ),
          ),
            ],)
          ],),


          //Column(
          //  children:[
          //    Row(
          //      mainAxisAlignment: MainAxisAlignment.spaceAround,
          //      children:[ 
          //        Text("Enter lost date"),
          //      Text("Enter lost time"),],
               
          //    )
          //  ]
            
          //),
          //Row(
          //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //  children: [
                  
          //  GestureDetector(
          //  onTap:()=> _selectDate(context),
          //  child: Container(
          //    width: 150,
          //    height: 40,
          //    decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color:Colors.white,boxShadow: [
          //                    BoxShadow(
          //                        color: Color.fromARGB(255, 69, 158, 76),
          //                        blurRadius: 2.0,
          //                       offset: Offset(0, 5)
          //                       ),
          //                    BoxShadow(
          //                        color: Color.fromARGB(255, 69, 158, 76),
          //                        blurRadius: 2.0,
          //                       offset: Offset(-5, 5)
          //                       )
          //                  ], ),
          //    child: Row(
          //      children:[
          //        Icon(Icons.calendar_today_rounded,color: Colors.green,),
          //        Text(date != null?'${date.day}/${date.month}/${date.year}':"dd-mm-yy",style: TextStyle(color:Colors.green,fontSize: 18),),
          
          //      ]
                
          
          //    ),
          
          //  ),
          //),
          //GestureDetector(
          //  onTap:()=> _selectTime(context),
          //  child: Container(
          //    width: 150,
          //    height: 40,
          //    decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color:Colors.white,boxShadow: [
          //                    BoxShadow(
          //                        color: Color.fromARGB(255, 69, 158, 76),
          //                        blurRadius: 2.0,
          //                        offset: Offset(0, 5)
          //                       ),
          //                    BoxShadow(
          //                        color: Color.fromARGB(255, 69, 158, 76),
          //                        blurRadius: 2.0,
          //                        offset: Offset(-5, 5)
          //                       )
          //                  ], ),
          //    child: Row(
          //      children:[
          //        Icon(Icons.timer,color:Colors.green),
          //        Text(time != null?' ${time.hour.toString()}:${time.minute.toString()}pm':"hh:mm",style: TextStyle(color:Colors.green,fontSize: 18),),
          
          //      ]
                
          
          //    ),
          
          //  ),
          //),
          //],),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            ElevatedButton.icon(onPressed: () async{
              ImagePicker imagePicker=ImagePicker();
    XFile? files=await imagePicker.pickImage(source: ImageSource.gallery);
    print('${files?.path}');
    
    if(files==null){
      return;
    }
      String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot=FirebaseStorage.instance.ref();
      Reference referenceDirImages=referenceRoot.child('images');
      Reference referenceImagetoUpload=referenceDirImages.child(uniqueFileName);
      await referenceImagetoUpload.putFile(File(files.path));
      imageurl = await referenceImagetoUpload.getDownloadURL();
          }, icon: Icon(Icons.image), label: Text("Pick from gallery"),style: ElevatedButton.styleFrom(primary: Colors.green)),
         
            ElevatedButton.icon(onPressed:() async{
              ImagePicker imagePicker=ImagePicker();
    XFile? files=await imagePicker.pickImage(source: ImageSource.camera);
    print('${files?.path}');
    
    if(files==null){
      return;
    }
      String uniqueFileName=DateTime.now().millisecondsSinceEpoch.toString();
      Reference referenceRoot=FirebaseStorage.instance.ref();
      Reference referenceDirImages=referenceRoot.child('images');
      Reference referenceImagetoUpload=referenceDirImages.child(uniqueFileName);
      await referenceImagetoUpload.putFile(File(files.path));
      imageurl = await referenceImagetoUpload.getDownloadURL();
          }, icon: Icon(Icons.camera), label: Text("Capture by camera"),style: ElevatedButton.styleFrom(primary: Colors.green)),
          ],),
          SizedBox(height: 15,),
         
          ElevatedButton(onPressed: () async {
                

                if(imageurl.isEmpty){

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Plz upload an image")));
                  return;
                }
                
                Map <String,String> dataToSave ={
                  'name':_fullname.text,
                  'nic':_nic.text,
                  'age':_age.text,
                  'religion':_religion.text,
                  'identity':_identity.text,
                  'height':_height.text,
                  'residence':_resid.text,
                  'dress':_dresscolour.text,
                  'gender':gender,
                  'location':_location.text,
                   'cellnumber':number.text.toString(),
                   'lostdate':('${date.day}/${date.month}/${date.year}'),
                   'losttime':('${time.hour}:${time.minute}'),
                   'image':imageurl,
                   'ukey':keys.text,
                };
              

                FirebaseFirestore.instance.collection('Missingpersons').add(dataToSave);
                
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Baskets()));
          }, child: Text("Post",style:TextStyle(fontSize: 20)),style: ElevatedButton.styleFrom(primary: Colors.black,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),elevation: 10, shadowColor: Color.fromARGB(255, 69, 158, 76),padding: EdgeInsets.only(left:30,right:30,top:10,bottom:10)),)

          

         
          
        ],
        ),
        ),
    );
  }
}

Widget textFeild(String _labelText, String _hintText, TextEditingController c) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              _labelText,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      Container(
        margin: EdgeInsets.only(left: 15, right: 15, bottom: 15, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35.0),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 14, 114, 22),
                blurRadius: 5.0,
                offset: Offset(0, 5)),
            BoxShadow(
                color: Color.fromARGB(255, 14, 114, 22),
                blurRadius: 5.0,
                offset: Offset(-5, 5))
          ],
        ),
        child: TextFormField(
          controller: c,
          style: TextStyle(fontSize: 20),
          decoration: InputDecoration(
            hintText: _hintText,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w500, color: Color.fromARGB(255, 42, 187, 29), fontSize: 17),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
      ),
    ],
  );
}