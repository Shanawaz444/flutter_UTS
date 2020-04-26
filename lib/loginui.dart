import 'dart:ui';

import 'package:fire/mainhomepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class Loginui extends StatefulWidget {
  @override
  _LoginuiState createState() => _LoginuiState();

  static RectTween _createRectTween(Rect begin, Rect end) {
    return CircularRectTween(begin: begin, end: end);
  }
}

class _LoginuiState extends State<Loginui> {
 TextEditingController _usernameLogin,_passwordLogin;
 //TextEditingController _regusername,_regemail,_regpassword,_regphonenumber;
 static String errorMessage;
 void initState()
 {
   super.initState();
  errorMessage=null;
  _usernameLogin=TextEditingController();
  _passwordLogin=TextEditingController();
 }




Future<void> _loginVerify()async
{
  errorMessage=null;
   final _regesterfirebase=FirebaseDatabase.instance.reference();
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
      child: Hero(
        tag: 'LoginBox',
        createRectTween: Loginui._createRectTween,
        child: Container(
        height: MediaQuery.of(context).size.height ,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(39, 47, 55, 1),
        
          child:
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
          )
        
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