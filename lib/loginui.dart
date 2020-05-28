import 'dart:async';
import 'dart:ui';
import 'package:fire/settinguptheapp/settinguptheapp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Loginui extends StatefulWidget {
  @override
  _LoginuiState createState() => _LoginuiState();

  static RectTween _createRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }
}

class _LoginuiState extends State<Loginui> {
  //final String _username;
 TextEditingController _usernameLogin,_passwordLogin,_username;
 //TextEditingController _regusername,_regemail,_regpassword,_regphonenumber;
 static String errorMessage;
  var controller=new StreamController();
 Stream _notify;
 static bool _yeilding=true;
  
 void initState()
 {
   _yeilding=true;
   super.initState();
    _notify=controller.stream;
  controller.add("dsdsd");
  errorMessage=null;
  _usernameLogin=TextEditingController();
  _passwordLogin=TextEditingController();
  _username=TextEditingController();
 }




Future<void> _loginVerify()async
{
  errorMessage=null;
   FirebaseDatabase.instance.reference().child("users/userdetails/"+_username.text+"/deatils").once()
   .then((val){
     if(val.value==null)
     {
       errorMessage="Username is wrong";
       return;
     }
   });
 final FirebaseAuth _auth = FirebaseAuth.instance;
 try{
AuthResult uuu=await _auth.signInWithEmailAndPassword(email: _usernameLogin.text, password: _passwordLogin.text);

 }catch(exc)
 {
  errorMessage="Either Email or Password is wrong!";
 }
}







 void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
         // title: new Text("Alert Dialog title"),
          content: new Text(errorMessage),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
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
        tag: 'LoginBox',
        createRectTween: Loginui._createRectTween,
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
                                              child: Image.asset("images/logo.png",scale: 0.5),
                                            ),
                                          ),
                                          
                                        Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                           child: TextField(
                                             controller: _username,
                                             
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
                                               border: OutlineInputBorder(borderSide:  new BorderSide(color:Color.fromRGBO(248,220,4,1) ))   
                                             ),
                                             
                                           style: TextStyle(color: Colors.green),
                                           ),
                                         ),
                                         Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                           child: TextField(
                                             controller: _usernameLogin,
                                             
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
                                                prefixIcon: const Icon(Icons.email, color: Colors.green,),
                                                prefixText: ' ',
                                               
                                               border: OutlineInputBorder(borderSide:  new BorderSide(color:Color.fromRGBO(248,220,4,1) ))   
                                             ),
                                             
                                           style: TextStyle(color: Colors.green),
                                           ),
                                         ),
                                         
                                         Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                           child: TextFormField(
                                             controller: _passwordLogin,
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
                                                suffixStyle: GoogleFonts.pTSans(
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
                                              /* Navigator.pushAndRemoveUntil(
                                                    context,
                                                     MaterialPageRoute(builder: (context) => HomePage()),
                                                    (Route<dynamic> route) => false,
                                                     );*/
                                               setState(() {
                                                 Future<void>val=_loginVerify();
                                                 _yeilding=false;
                                                 controller.add("esd");
                                                 val.then((s)async{
                                                   if(errorMessage==null)
                                                   {
                                                     await FirebaseDatabase.instance.reference().child("users/userdetails/"+_username.text).update(
                                                       {
                                                         "isactive":"active"
                                                       }
                                                     );
                                                     
                                                     controller.close();
                                                     SharedPreferences _inst= await SharedPreferences.getInstance();
                                                     _inst.setString("username", _username.text);

                                                     Navigator.pushAndRemoveUntil(
                                                    context,
                                                     MaterialPageRoute(builder: (context) => SettingUpTheData(_username.text)),
                                                    (Route<dynamic> route) => false,
                                                     );
                                                   }else{
                                                     _passwordLogin.clear();
                                                     _usernameLogin.clear();
                                                     _username.clear();
                                                     _yeilding=true;
                                                     controller.add("cxcxc");
                                                     print(errorMessage);
                                                     _showDialog();
                                                   }
                                                 }
                                                 );
                                               });

                                               }, child: Text("LOGIN",style: GoogleFonts.pTSans(
                                              
                                              fontSize: 18
                                            ),
                                            ),
                                            shape:RoundedRectangleBorder(
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































/*
Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children:<Widget>[
                                      Text("Enter Email",style: TextStyle(color:Colors.white),),
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                         child: TextFormField(
                                           controller: _usernameLogin,
                                           validator: (somevalue){
                                         if(somevalue.isEmpty)
                                           {
                                         return'Cannot leave empty!';
                                          }
                                           return null;
                                            },
                                           decoration: InputDecoration(
                                             hintText:"Enter valid Username or Email..",
                                              border: const OutlineInputBorder()
                                           ),
                                           cursorWidth: 3.0,//cursorColor: Color.fromRGBO(r, g, b, 1),
                                         style: TextStyle(color: Colors.orange),
                                         
                                         ),
                                       ),
                                       Text("Enter Password",style: TextStyle(color:Colors.white),),
                                       Padding(
                                         padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                                         child: TextFormField(
                                           controller: _passwordLogin,
                                           validator: (somevalue){
                                         if(somevalue.isEmpty)
                                             {
                                             return'Cannot leave empty!';
                                               }
                                             return null;
                                                  },
                                           
                                           decoration: InputDecoration(
                                             hintText:"Enter valid Password..",
                                              border: const OutlineInputBorder()),
                                           cursorWidth: 3.0,//cursorColor: Color.fromRGBO(r, g, b, 1),
                                         style: TextStyle(color: Colors.orange),
                                         
                                         ),
                                       ), 
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: FlatButton(onPressed: (){
                                           setState(() {


                                             Future<void>val=_loginVerify();
                                             val.then((s){
                                               if(errorMessage==null)
                                               {
                                                 Navigator.pushAndRemoveUntil(
                                                context,
                                                 MaterialPageRoute(builder: (context) => HomePage()),
                                                (Route<dynamic> route) => false,
                                                 );
                                               }else{
                                                 print(errorMessage);
                                                 _showDialog();
                                               }
                                             }
                                             );
                                             

                                           });




                                           }, child: Text("LOGIN"),shape:RoundedRectangleBorder(
                                           borderRadius:BorderRadius.circular(20)
                                           ),
                                           color: Color.fromRGBO(248,220,4,1),
                                           ),
                                       ),
               
               

              ]
            ),
*/ 