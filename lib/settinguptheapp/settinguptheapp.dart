
import 'dart:convert';
import 'dart:typed_data';
import 'package:fire/mainhomepage.dart';
import 'package:fire/model/imagesmodel.dart';
import 'package:fire/utils/database_helper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class SettingUpTheData extends StatefulWidget {
  final String _username;
  SettingUpTheData(this._username);
  @override
  _SettingUpTheDataState createState() => _SettingUpTheDataState();
}

class _SettingUpTheDataState extends State<SettingUpTheData> {


 /*List<dynamic>_mobile;
  List<Image>_mobileimages=[];
  List<int>_mobilecount=[];
  List<dynamic>_pc;
  List<Image>_pcimages=[];
  List<int>_pccount=[];
  List<dynamic>_xbox;
  List<Image>_xboximages=[];
  List<int>_xboxcount=[];*/

DatabaseHelper databaseHelper=DatabaseHelper();
LoadImages loadImages;
//List<LoadImages>_lls=[];


 //Image m;
var file;
Uint8List bytes ;











  Future<bool>_settingupdata()async
  {

   








SharedPreferences _inst=await SharedPreferences.getInstance();


  if(_inst.containsKey("preinstalled")==false) 
  { int y;
 print("now mobile");
   await FirebaseDatabase.instance.reference().child("mobilegames").once().then((oo) async {
     print(oo.value.toString());
    await databaseHelper.createnewtable('mobilemainui');
     
   var mobilelist=oo.value;
   for(int i=0;i<mobilelist.length;i++)
   {
       for(int j=1;j<=4;j++)
       {
          await FirebaseStorage.instance.ref().child(mobilelist[i].toString()+"/"+(j).toString()+".jpg").getDownloadURL().then((ov)async{
              http.Response response=await http.get(ov.toString());
               String img=base64.encode(response.bodyBytes);
                bytes=base64Decode(base64.encode(response.bodyBytes));
                loadImages=LoadImages(mobilelist[i].toString(),bytes,"mobileplatform");
          });
         if(j==1)
         {
             y=await databaseHelper.insertMapList(loadImages,'mobilemainui');
             //print(y.toString()+"mainui");
              await databaseHelper.createnewtable(mobilelist[i].toString());
              y=await databaseHelper.insertMapList(loadImages,mobilelist[i].toString());
              //print(y);
         }else{
            y=await databaseHelper.insertMapList(loadImages,mobilelist[i].toString());
         }
       }
   }
   
   });
 print("now pc");
await FirebaseDatabase.instance.reference().child("pcgames").once().then((oo) async {
  print(oo.value.toString());
    await databaseHelper.createnewtable('pcmainui');
     
   var pclist=oo.value;
   for(int i=0;i<pclist.length;i++)
   {
       for(int j=1;j<=4;j++)
       {
          await FirebaseStorage.instance.ref().child(pclist[i].toString()+"/"+(j).toString()+".jpg").getDownloadURL().then((ov)async{
              http.Response response=await http.get(ov.toString());
               String img=base64.encode(response.bodyBytes);
                bytes=base64Decode(base64.encode(response.bodyBytes));
                loadImages=LoadImages(pclist[i].toString(),bytes,"pcplatform");
          });
         if(j==1)
         {
             y=await databaseHelper.insertMapList(loadImages,'pcmainui');
              //print(y.toString()+"mainui");
              await databaseHelper.createnewtable(pclist[i].toString());
              y=await databaseHelper.insertMapList(loadImages,pclist[i].toString());
              //print(y);
         }else{
            y=await databaseHelper.insertMapList(loadImages,pclist[i].toString());
         }
       }
   }
   
   });
 print("now xbox");
await FirebaseDatabase.instance.reference().child("xbox").once().then((oo) async {
  print(oo.value.toString());
    await databaseHelper.createnewtable('xboxmainui');
     
   var xboxlist=oo.value;
   for(int i=0;i<xboxlist.length;i++)
   {
       for(int j=1;j<=4;j++)
       {
          await FirebaseStorage.instance.ref().child(xboxlist[i].toString()+"/"+(j).toString()+".jpg").getDownloadURL().then((ov)async{
              http.Response response=await http.get(ov.toString());
               String img=base64.encode(response.bodyBytes);
                bytes=base64Decode(base64.encode(response.bodyBytes));
                loadImages=LoadImages(xboxlist[i].toString(),bytes,"xboxplatform");
          });
         if(j==1)
         {
             y=await databaseHelper.insertMapList(loadImages,'xboxmainui');
             // print(y.toString()+"mainui");
              await databaseHelper.createnewtable(xboxlist[i].toString());
              y=await databaseHelper.insertMapList(loadImages,xboxlist[i].toString());
             // print(y);
         }else{
            y=await databaseHelper.insertMapList(loadImages,xboxlist[i].toString());
         }
       }
   }
   
   });
   _inst.setString("preinstalled", "done");
   }


    
    
   /* await FirebaseDatabase.instance.reference().child("mobilegames").once().then((oo) async {
      print(oo.value);
      try{
       _mobile=oo.value;
       print(_mobile[0]);
      }catch(e){
        print(e);
      }
      try{for(int i=0;i<4;i++)
      {  
         await FirebaseStorage.instance.ref().child(_mobile[i].toString()+"/"+(1).toString()+".jpg").getDownloadURL().then((ov){
          m=Image.network(ov.toString(),fit:BoxFit.fitHeight);
          _mobileimages.add(m);
          _mobilecount.add(i);
          });
          print("done");
      }}catch(p){print(p);}
      });
 await FirebaseDatabase.instance.reference().child("pcgames").once().then((oo) async {
      print(oo.value);
      try{
       _pc=oo.value;
       print(_mobile[0]);
      }catch(e){
        print(e);
      }
      try{for(int i=0;i<4;i++)
      {  
         await FirebaseStorage.instance.ref().child(_pc[i].toString()+"/"+(1).toString()+".jpg").getDownloadURL().then((ov){
          m=Image.network(ov.toString(),fit:BoxFit.fitHeight);
          _pcimages.add(m);
          _pccount.add(i);
          });
          print("done");
      }}catch(p){print(p);}

 });
 await FirebaseDatabase.instance.reference().child("xbox").once().then((oo) async {
      print(oo.value);
      try{
       _xbox=oo.value;
       print(_mobile[0]);
      }catch(e){
        print(e);
      }
      try{for(int i=0;i<1;i++)
      {  
         await FirebaseStorage.instance.ref().child(_xbox[i].toString()+"/"+(1).toString()+".jpg").getDownloadURL().then((ov){
          m=Image.network(ov.toString(),fit:BoxFit.fitHeight);
          _xboximages.add(m);
          _xboxcount.add(i);
          });
          print("done");
      }}catch(p){print(p);}

 });
/* Navigator.pushAndRemoveUntil(
              context,
        MaterialPageRoute(builder: (context) => HomePage(widget._username,_mobile,_mobileimages,_mobilecount,_pc,_pcimages,_pccount,_xbox,_xboximages,_xboxcount)),
            (Route<dynamic> route) => false,
        );*/*/
return true;
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(39, 47, 55,1),
      body: FutureBuilder(
        future:_settingupdata() ,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FadingText("Setting up \n your App",style: TextStyle(fontSize:18,color: Colors.white),),
               FadingText("Please Wait.",style: TextStyle(fontSize:18,color: Colors.white)),                 
            ],
          );
          }
         /* return Center(child: FlatButton(onPressed: (){
            Navigator.pushAndRemoveUntil(
              context,
        MaterialPageRoute(builder: (context) => HomePage(widget._username,_mobile,_mobileimages,_mobilecount,_pc,_pcimages,_pccount,_xbox,_xboximages,_xboxcount)),
            (Route<dynamic> route) => false,
        );
          }, child: Text("sdsdsd"),color: Colors.white,));*/
          return Center(
            child: Column(
              children: <Widget>[
                Padding(
              padding: const EdgeInsets.only(top:30),
              child: Text("UTS ",
              style: GoogleFonts.pTSans(
                                          fontSize:40,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("Unite Through e-Sports",
              style: GoogleFonts.pTSans(
                                          fontSize:20,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("On clicking the game images you can see ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:0),
              child: Text("the players who are playing that game and ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:0),
              child: Text("there will be a request invite button on click ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:0),
              child: Text("the play request will be sent to the corresponding ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:0),
              child: Text("player and only he accepts you can chat with him ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:0),
              child: Text("share your game details so that you can connect in ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:0),
              child: Text("game and enjoy. ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget>[
                 Center(
                   child: Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("Terms and Conditions ",
              style: GoogleFonts.pTSans(
                                            fontSize:20,
                                            fontWeight: FontWeight.w600,
                                                color:Colors.white70
                                             ),
              ),
            ),
                 ),
             Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("1. chatting with anonymus people is at your own risk. ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:5),
              child: Text("2. Shareing pic and videos is also at your own risk. ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top:5),
              child: Text("3. UTS community is not responseable for your outcomes for doing inappropriate things",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:0),
              child: Text("like : sharing volger and worst pics, and mis chatting with others",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:5),
              child: Text("by clicking the below button you have accepted all our terms and rules.",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
              ]
            ),

                Container(
                  child: FlatButton(onPressed: (){
                              Navigator.pushAndRemoveUntil(
                                                          context,
                                                           MaterialPageRoute(builder: (context) =>HomePage(widget._username.toString())),
                                                          (Route<dynamic> route) => false,
                                                           );
                  }, child: Text("Proceed",
                  style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.black87
                                           ),
                  ),
                  color: Colors.white,
                  )
                ),
              ],
            ),
          );
 

         
          
          

      }),
      
    );
  }
}