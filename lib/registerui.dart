import 'dart:async';
import 'dart:ui';
import 'package:fire/settinguptheapp/settinguptheapp.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
 //AnimationController _controller1;
class Regui extends StatefulWidget {
 
  
  @override
  _ReguiState createState() => _ReguiState();

  static RectTween _createRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }
}

class _ReguiState extends State<Regui> {

 TextEditingController _regusername,_regemail,_regpassword,_regphonenumber;
 String errorMessage;
 var controller=new StreamController();
 Stream _notify;
 static bool _yeilding=true;
 void initState()
 {
   super.initState();
  // _controller1.reset();
  _yeilding=true;
  _notify=controller.stream;
  controller.add("dsdsd");
  errorMessage=null;
  _regpassword=TextEditingController();
  _regemail=TextEditingController();
  _regusername=TextEditingController();
  _regphonenumber=TextEditingController();
 }
 Future<void>createRecord()async
{
  errorMessage=null;
  
 final _regesterfirebase=FirebaseDatabase.instance.reference();
 final FirebaseAuth _auth = FirebaseAuth.instance;
 
 await _regesterfirebase.child("users/userdetails/"+_regusername.text+"/").once().then((DataSnapshot snapshot) async{
    if(snapshot.value==null)
    {
      try {
    AuthResult _res=await _auth.createUserWithEmailAndPassword(
    email: _regemail.text, 
    password: _regpassword.text,
  );
 await _regesterfirebase.child("users/userdetails/"+_regusername.text+"/deatils").set({
    "UserName":_regusername.text,
    "Email":_regemail.text,
    "Password":_regpassword.text,
    "PhoneNumber":_regphonenumber.text
  });
  }catch(e){
    print(e);
   setState(() {
      errorMessage="either email is already taken or wrong,please check weather your password has atleast 6 characters!";
   });
  }
  }else{
    print(snapshot.value);
    errorMessage="username is already taken";
  }
  });

 

 /*_regesterfirebase.child("users/userdetails/"+_regusername.text+"/details").once().then((DataSnapshot snp){
  if(snp!=null)
   {
   _regesterfirebase.child("users/userdetails/"+_regusername.text+"/details").once().then((DataSnapshot snp1){
   if(snp1!=null)
   {
     _regesterfirebase.child("users/userdetails/"+_regusername.text+"/details").once().then((DataSnapshot snp1){
   if(snp1!=null)
   {
     
   }

   });
   }

  });
}



});*/

    
}
void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
         // title: new Text("Alert Dialog title"),
          content: new Text(errorMessage,style: GoogleFonts.pTSans(
                                              color: Colors.black,
                                              fontSize: 18
                                            ),),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close", style:GoogleFonts.pTSans(
                                              color: Colors.blue,
                                              fontSize: 18
                                            ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Hero(
        tag: 'RegisterBox',
        createRectTween: Regui._createRectTween,
        child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(248,220,4,1),        
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Card(
            elevation: 100,
             color:Color.fromRGBO(39, 47, 52,1) ,
             child: 
             SingleChildScrollView(
                            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget>[
                                        
                                          
                                             Center(
                                            child: Container(
                                              child: Image.asset("images/fitness.png",scale: 1),
                                            ),
                                          ),
                                          
                                        
                                         Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                           child: TextField(
                                             controller: _regusername,
                                             
                                             decoration: InputDecoration(
                                               
                                               enabledBorder:new OutlineInputBorder(
                                                 borderSide: new BorderSide(color:Color.fromRGBO(248,220,4,1) )
                                                 
                                               ) ,
                                                
                                                //helperText: 'enter a valid email.',
                                                labelText: 'Username',
                                                labelStyle:  GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                                prefixIcon: const Icon(Icons.person, color: Colors.green,),
                                                prefixText: ' ',
                                               suffixText: 'Bot93',
                                                suffixStyle:  GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                               border: OutlineInputBorder(borderSide:  new BorderSide(color:Color.fromRGBO(248,220,4,1) ))   
                                             ),
                                             
                                           style:  GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                           ),
                                         ),
                                         
                                         Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                           child: TextFormField(
                                             controller: _regemail,
                                             validator: (somevalue){
                                           if(somevalue.isEmpty)
                                               {
                                               return'Cannot leave empty!';
                                               }
                                               return null;
                                               },
                                             decoration: InputDecoration(
                                               
                                               enabledBorder:new OutlineInputBorder(
                                                 borderSide: new BorderSide(color:Color.fromRGBO(248,220,4,1) )
                                                 
                                               ) ,
                                                
                                                //helperText: 'enter a valid email.',
                                                labelText: 'Email',
                                                labelStyle:  GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                                prefixIcon: const Icon(Icons.email, color: Colors.white,),
                                                prefixText: ' ',
                                              
                                               border: OutlineInputBorder(borderSide:  new BorderSide(color:Color.fromRGBO(248,220,4,1) ))   
                                             ),
                                             cursorWidth: 3.0,//cursorColor: Color.fromRGBO(r, g, b, 1),
                                           style: TextStyle(color: Colors.orange),
                                           ),
                                         ),
                                          Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                           child: TextFormField(
                                             controller: _regpassword,
                                             validator: (somevalue){
                                           if(somevalue.isEmpty)
                                               {
                                               return'Cannot leave empty!';
                                               }
                                               return null;
                                               },
                                             decoration: InputDecoration(
                                               
                                               enabledBorder:new OutlineInputBorder(
                                                 borderSide: new BorderSide(color:Color.fromRGBO(248,220,4,1) )
                                                 
                                               ) ,
                                                
                                                //helperText: 'enter a valid email.',
                                                labelText: 'Password',
                                                labelStyle:  GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                                prefixIcon: const Icon(Icons.security, color: Colors.orange,),
                                                prefixText: ' ',
                                               suffixText: 'at least 6 char!',
                                                suffixStyle:  GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                               border: OutlineInputBorder(borderSide:  new BorderSide(color:Color.fromRGBO(248,220,4,1) ))   
                                             ),
                                             cursorWidth: 3.0,//cursorColor: Color.fromRGBO(r, g, b, 1),
                                           style: TextStyle(color: Colors.orange),
                                           ),
                                         ),
                                          Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                           child: TextFormField(
                                             controller: _regphonenumber,
                                             validator: (somevalue){
                                           if(somevalue.isEmpty)
                                               {
                                               return'Cannot leave empty!';
                                               }
                                               return null;
                                               },
                                             decoration: InputDecoration(
                                               
                                               enabledBorder:new OutlineInputBorder(
                                                 borderSide: new BorderSide(color:Color.fromRGBO(248,220,4,1) )
                                                 
                                               ) ,
                                                
                                                //helperText: 'enter a valid email.',
                                                labelText: 'PhoneNumber',
                                                labelStyle: GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                                prefixIcon: const Icon(Icons.contacts, color: Colors.blue,),
                                                prefixText: ' ',
                                               suffixText: 'USD',
                                                suffixStyle:  GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                               border: OutlineInputBorder(borderSide:  new BorderSide(color:Color.fromRGBO(248,220,4,1) ))   
                                             ),
                                             cursorWidth: 3.0,//cursorColor: Color.fromRGBO(r, g, b, 1),
                                           style: TextStyle(color: Colors.orange),
                                           ),
                                         ), 






                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(padding: EdgeInsets.all(1),
                                            child: //Text("Remember me!",style: TextStyle(color:Color.fromRGBO(248,220,4,1)),),
                                            Text("Remember me!",style: GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),)
                                            ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 20, 5),
                                          child: CupertinoSwitch(value:false, onChanged:(val){},
                                          activeColor: Color.fromRGBO(248,220,4,1),
                                          ),
                                        )
                                      
                                          ],
                                        ),

                                         StreamBuilder(
                                           stream:_notify,
                                           builder: (context, snapshot) {
                                             print("dsdsd");
                                             if(snapshot.hasData)
                                             {
                                               if(_yeilding==true)
                                               {
                                               return Center(
                                               child: Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: FlatButton(onPressed: (){
                                                   setState(() {
                                                     Future<void>val=createRecord();
                                                     _yeilding=false;
                                                     controller.add("event");
                                                     val.then((s)async{
                                                       if(errorMessage==null)
                                                       {
                                                         await FirebaseDatabase.instance.reference().child("users/userdetails/"+_regusername.text).update(
                                                       {
                                                         "isactive":"active"
                                                       }
                                                       );
                                                         SharedPreferences _inst= await SharedPreferences.getInstance();
                                                         controller.close();
                                                         _inst.setString("username", _regusername.text);

                                                        Navigator.pushAndRemoveUntil(
                                                    context,
                                                     MaterialPageRoute(builder: (context) => SettingUpTheData(_regusername.text)),
                                                    (Route<dynamic> route) => false,
                                                     );
                                                       }else{
                                                         _regemail.clear();
                                                         _regpassword.clear();
                                                         _regphonenumber.clear();
                                                         _regusername.clear();
                                                         print(errorMessage);
                                                         _yeilding=true;
                                                         controller.add("event");
                                                         _showDialog();
                                                       }
                                                     }
                                                     );
                                                   });

                                                   }, child: Text("Register",style: GoogleFonts.pTSans(
                                                  
                                                  fontSize: 18
                                                ),),shape:RoundedRectangleBorder(
                                                   borderRadius:BorderRadius.circular(20)
                                                   ),
                                                   color: Color.fromRGBO(248,220,4,1),
                                                   ),
                              
                                               ),
                                             );
                                               }else{
                                                 return Center(
                                                   child: Container(
                                                     height: 30,
                                                     width: 30,
                                                     child: ColoredCircularProgressIndicator()
                                                   ),
                                                 );
                                               }
                                               
                                             }
                                             
                                           }
                                         ),

















                                        






                                         Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                                           child: Divider(
                                             color: Color.fromRGBO(248,220,4,1),
                                           ),
                                         ),
                                         Center(
                                           child: Padding(padding: EdgeInsets.all(8),
                                           child: Container(
                                             width:MediaQuery.of(context).size.width,
                                             child: FlatButton(
                                               
                                               onPressed: (){
                                                   
                                                   }, child: Row(
                                                     mainAxisAlignment: MainAxisAlignment.center,
                                                       crossAxisAlignment: CrossAxisAlignment.center,
                                                     children:[
                                                       Text("Facebook",style: GoogleFonts.pTSans(
                                              color: Colors.white,
                                              fontSize: 18
                                            ),)
                                                     ]
                                                   ),shape:RoundedRectangleBorder(
                                                   borderRadius:BorderRadius.circular(1)
                                                   ),
                                                   color: Color.fromRGBO(16,0,154,1),
                                                   ),
                                           ),
                                           ),
                                         ),
                                         Center(
                                           child: Padding(padding: EdgeInsets.all(8),
                                           child: Container(
                                             width:MediaQuery.of(context).size.width,
                                             child: FlatButton(onPressed: (){
                                                   
                                                   }, child: Center(
                                                     child: Row(
                                                       mainAxisAlignment: MainAxisAlignment.center,
                                                       crossAxisAlignment: CrossAxisAlignment.center,
                                                       children: <Widget>[
                                                       Text('G',style: GoogleFonts.pTSans(
                                              color: Colors.blue,
                                              fontSize: 18
                                            ),),
                                                       Text('o',style: GoogleFonts.pTSans(
                                              color: Colors.red,
                                              fontSize: 18
                                            ),),
                                                       Text('o',style: GoogleFonts.pTSans(
                                              color: Colors.yellow,
                                              fontSize: 18
                                            ),),
                                                       Text('g',style: GoogleFonts.pTSans(
                                              color: Colors.blue,
                                              fontSize: 18
                                            ),),
                                                       Text('l',style: GoogleFonts.pTSans(
                                              color: Colors.green,
                                              fontSize: 18
                                            ),),
                                                       Text('e',style: GoogleFonts.pTSans(
                                              color: Colors.red,
                                              fontSize: 18
                                            ),),
                                                     ],),
                                                   ),
                                                   shape:RoundedRectangleBorder(
                                                   borderRadius:BorderRadius.circular(1)
                                                   ),
                                                   color: Colors.white,
                                                   ),
                                           ),
                                           ),
                                         )
                ]
            ),
             ),
          ),
        ),        
      )
      ),
    );

  }
  
}

class CircularRectTween extends RectTween {
  CircularRectTween({Rect begin, Rect end})
      : super(begin: begin, end: end) {}

  @override
  Rect lerp(double t) {
    final double width = lerpDouble(begin.width, end.width, t);
    double startWidthCenter = begin.left + (begin.width / 2);
    double startHeightCenter = begin.top + (begin.height / 2);

    return Rect.fromCircle(center: Offset(startWidthCenter, startHeightCenter), radius: width * 1.7);
  }
}