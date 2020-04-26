import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'mainhomepage.dart';
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
 void initState()
 {
   super.initState();
  // _controller1.reset();
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
    password: _regpassword.text
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
        tag: 'RegisterBox',
        createRectTween: Regui._createRectTween,
        child: SingleChildScrollView(
                  child: Container(
            color: Color.fromRGBO(39, 47, 55, 1),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
            child:
            Align(
              alignment: Alignment.bottomCenter,  
                      child: Container(
                        height: MediaQuery.of(context).size.height-150,
                        width: MediaQuery.of(context).size.width-30,
                        child: Card(
                           color: Color.fromRGBO(39, 47, 55, 1),
                          elevation: 50,
                            child: SingleChildScrollView(
                            child: Container(
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:<Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("REGISTER",style: TextStyle(color:Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _regusername,
                                  validator: (somevalue){
                                    if(somevalue.isEmpty)
                                    {
                                      return'Cannot leave empty!';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText:"Enter unique UserName..",
                                    border: const OutlineInputBorder()
                                  ),
                                ),
                              ),
                               Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    hintText:"Enter Vaild Email..",
                                    border: const OutlineInputBorder()
                                  ),
                                ),
                              ),
                               Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: _regpassword,
                                  validator: (somevalue){
                                    if(somevalue.isEmpty)
                                    {
                                      return'Cannot leave empty!';
                                    }
                                    if(somevalue.length<6)
                                    {

                                    }
                                   
                                  },
                                  decoration: InputDecoration(
                                    hintText:"Enter valid Password..",
                                    border: const OutlineInputBorder()
                                  ),
                                ),
                              ),
                               Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                    hintText:"Enter valid Ph.number..",
                                    border: const OutlineInputBorder()
                                  ),
                                ),
                              ),
                                                Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: FlatButton(onPressed: (){
                                                       Future<void>done=createRecord();
                                                       done.then((v)
                                                       {
                                                         if(errorMessage==null)
                                                         {
                                                           print("All ok");
                                                           Navigator.pushAndRemoveUntil(
                                                           context,
                                                            MaterialPageRoute(builder: (context) => HomePage()),
                                                             (Route<dynamic> route) => false,
                                                                );
                                                           
                                                         }else{
                                                           print(errorMessage);
                                                           _showDialog();
                                                         }
                                                       });
                                                       //Navigator.of(context).pop("/");
                                                       }, 
                                                       child: Text("REGISTER"),shape:RoundedRectangleBorder(
                                                       borderRadius:BorderRadius.circular(20)
                                                       ),
                                                       color: Color.fromRGBO(248,220,4,1),
                                                       ),
                                                       ),
                                                       
                            ]
              ),
                    ),
                          ),
                        ),
                      ),
                  
              
              
            )
          
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