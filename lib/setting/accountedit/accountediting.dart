import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
class AccountEditing extends StatefulWidget {
 static String _username;
 static String _email;
 static String _password;
 static String _phonenumber;
 static File _image;

  @override
  _AccountEditingState createState() => _AccountEditingState();
}

class _AccountEditingState extends State<AccountEditing> {
  SharedPreferences _inst;
  Image m;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
     print(image.readAsBytesSync());
      
        FirebaseStorage.instance.ref().child(AccountEditing._username.toString()+"/profilepic").putFile(image);
       String _saveurl= await FirebaseStorage.instance.ref().child(AccountEditing._username.toString()+"/profilepic").getDownloadURL();
       FirebaseDatabase.instance.reference().child("users/userdetails/"+AccountEditing._username.toString()+"/deatils/profilepic").update({
        "0":_saveurl
      });
  }
  Future<Widget>_downloadingpropic(String url)async{
    
    await FirebaseStorage.instance.ref().child(AccountEditing._username.toString()+"/profilepic").getDownloadURL().then((ov){
      m=Image.network(ov.toString(),fit:BoxFit.fitHeight);
      return m;
    });

  }

  Future<bool>_sharedprefloding()async
  {
     _inst=await SharedPreferences.getInstance();
     AccountEditing._username=_inst.getString("username");
     await FirebaseDatabase.instance.reference().child("users/userdetails/"+AccountEditing._username.toString()+"/deatils/Email").once().then((value){
       AccountEditing._email=value.value.toString();
     });
     await FirebaseDatabase.instance.reference().child("users/userdetails/"+AccountEditing._username.toString()+"/deatils/Password").once().then((value){
       AccountEditing._password=value.value.toString();
     });
     await FirebaseDatabase.instance.reference().child("users/userdetails/"+AccountEditing._username.toString()+"/deatils/PhoneNumber").once().then((value){
       AccountEditing._phonenumber=value.value.toString();
     });
     return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248,220,4,1),
        title: Text("Account",
        style: GoogleFonts.pTSans(
                    fontSize:25,
                    fontWeight: FontWeight.w600,
                    color:Color.fromRGBO(39, 47, 55,1)
                  )),
      ),
      backgroundColor:  Color.fromRGBO(39, 47, 55,1),
      body: FutureBuilder<bool>(
        future: _sharedprefloding(),
        builder:(context,snap)
      {
         if(snap.connectionState==ConnectionState.waiting)
         {
           return Center(child: ColoredCircularProgressIndicator());
         }
         return Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
          Padding(
            padding: const EdgeInsets.only(top:40),
            child: Center(
              child: ClipOval(
                child:Container(
                  color: Colors.grey,
                  height: 100,
                  width: 100,
                  child:StreamBuilder(
                    stream:FirebaseDatabase.instance.reference().child("users/userdetails/"+AccountEditing._username.toString()+"/deatils/profilepic").onValue ,
                    builder: (context, snaps) {
                      if(snaps.hasData && !snaps.hasError && snaps.data.snapshot.value != null)
                      {
                       String url=snaps.data.snapshot.value.toString();
                       return FutureBuilder(
                         future:_downloadingpropic(url),
                         builder:(context,snn){
                           if(snn.connectionState==ConnectionState.waiting)
                           {
                             return ColoredCircularProgressIndicator();
                           }
                          return m; 
                       });
                      }
                      return Icon(MaterialCommunityIcons.account_circle);
                      
                    }
                  )
                )
              ),
            ),
          ),


         Center(
           child: Padding(
             padding: const EdgeInsets.only(left:30,right:30),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:<Widget>[
               
                     
                     FlatButton(onPressed:(){
                       getImage();
                     }, child: Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(right:10),
                           child: Icon(MaterialCommunityIcons.circle_edit_outline,color: Colors.white60,),
                         ),
                         Text("Edit",
                         style: TextStyle(color:Colors.white70),
                         ),
                       ],
                     )),
                  
                 
                     FlatButton(onPressed: (){
                       FirebaseStorage.instance.ref().child(AccountEditing._username.toString()+"/profilepic").delete();
                       FirebaseDatabase.instance.reference().child("users/userdetails/"+AccountEditing._username.toString()+"/deatils/profilepic").remove();
                     },child: Row(
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(right:10),
                           child: Icon(MaterialCommunityIcons.file_remove,color: Colors.white60)
                         ),
                         Text("Remove",
                         style: TextStyle(color:Colors.white70),
                         ),
                       ],
                     )),
                  
               ]
             ),
           ),
         ),
          

          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text(
              "Details",
        style: GoogleFonts.pTSans(
                                        fontSize:25,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white60
                                         ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text(
              "UserName: ${AccountEditing._username} ",
        style: GoogleFonts.pTSans(
                                        fontSize:18,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white60
                                         ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text(
              "Email: ${AccountEditing._email}",
        style: GoogleFonts.pTSans(
                                        fontSize:18,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white60
                                         ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text(
              "Password: ${AccountEditing._password}",
        style: GoogleFonts.pTSans(
                                        fontSize:18,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white60
                                         ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Text(
              "phoneNumber: ${AccountEditing._phonenumber}",
        style: GoogleFonts.pTSans(
                                        fontSize:18,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white60
                                         ),
            ),
          ),

           Padding(
            padding: const EdgeInsets.only(top:40),
            child: Text(
              "From",
        style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white60
                                         ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:5),
            child: Text(
              "UTS",
        style: GoogleFonts.pTSans(
                                        fontSize:30,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white60
                                         ),
            ),
          ),

        ]
      );
      })
    );
  }
}