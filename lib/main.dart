import 'package:fire/registeranimation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'login_animation.dart';
import 'loginui.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:InheritingBegin(),
    );
  }
}
class InheritingBegin extends StatefulWidget
{
  @override
  _InheritingBeginState createState() => _InheritingBeginState();
}

class _InheritingBeginState extends State<InheritingBegin> with SingleTickerProviderStateMixin{
  
  
  static int decsion=0;
  TextEditingController _usernameLogin,_passwordLogin,_regusername,_regemail,_regpassword,_regphonenumber;
 /* void _login()
  {
    setState(() {
      decsion=1;
    });
  }
  void _login_verified()
  {
    setState(() {
      decsion=0;
    });
  }
  void _regester()
  {

  }
  void _regester_verified()
  {

  }*/

  AnimationController animController1;


  static int r=238,b=6,g=6;
  Animation<double> animation1;
  
String errorMessage;
void initState() {
  super.initState();
  errorMessage=null;
  _usernameLogin=TextEditingController();
  _passwordLogin=TextEditingController();
  _regpassword=TextEditingController();
  _regemail=TextEditingController();
  _regusername=TextEditingController();
  _regphonenumber=TextEditingController();
  animController1 = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  );

    Tween<double>(
    begin: 0,
    end: 9999 ,
  ).animate(animController1)
    ..addListener(() {
      // Empty setState because the updated value is already in the animation field
      setState(() {
        if(r==238&&b<238&&g==6)
        {
          b=b+2;
        }else
        {
          if(r>6&&b>=238&&g==6)
        {
          r=r-2;
        }
        else{
          if(r<=6&&b>=238&&g<=238)
        {
          g=g+2;
        }
        else{
          r=238;
          b=6;
          g=6;
        }
        }
        }
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
        /*if(r==238&&b<238&&g==6)
        {
          b=b+100;
        }else
        {
          if(r>6&&b>=238&&g==6)
        {
          r=r-100;
        }
        else{
          if(r<=6&&b>=238&&g<=238)
        {
          g=g+100;
        }
        else{
          r=238;
          b=6;
          g=6;
        }
        }
        }*/
     });
      
      /*i=i+1;
      if(i==2)
      {
        animController.dispose();
      }*/
      animController1.repeat();
      } else if (status == AnimationStatus.dismissed) {
        animController1.forward();
      }
    });
    
  animController1.forward();
}
  @override
  void dispose() {
    animController1.reset();
    animController1.stop();
    super.dispose();
  }
 
void _checkingLoginDetails()
{
  //final DocumentReference _firestroedoc=Firestore.instance.document()
}




/*void _login_bottomsheet(context,int seperator)
  {
    showModalBottomSheet(context: context, 
    shape: RoundedRectangleBorder(borderRadius:BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30))),
    elevation: 10,
    backgroundColor: Color.fromRGBO(39, 47, 55, 1),
    builder: (BuildContext c){
       if(seperator==1)
       {
          return Container(
        height: MediaQuery.of(context).size.height-(50*MediaQuery.of(context).size.height/100),
        width: MediaQuery.of(context).size.width,
       
        
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children:<Widget>[
                                  
                                   Padding(
                                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                       cursorWidth: 3.0,cursorColor: Color.fromRGBO(r, g, b, 1),
                                     style: TextStyle(color: Colors.orange),
                                     
                                     ),
                                   ),
                                   
                                   Padding(
                                     padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                       cursorWidth: 3.0,cursorColor: Color.fromRGBO(r, g, b, 1),
                                     style: TextStyle(color: Colors.orange),
                                     
                                     ),
                                   ), 
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: FlatButton(onPressed: (){
                                       





                                       }, child: Text("LOGIN"),shape:RoundedRectangleBorder(
                                       borderRadius:BorderRadius.circular(20)
                                       ),
                                       color: Color.fromRGBO(248,220,4,1),
                                       ),
                                   ),
             
             

            ]
          )
        
      );
       }else{
         return Container(
        //height: MediaQuery.of(context).size.height-(50*MediaQuery.of(context).size.height/100),
        //width: MediaQuery.of(context).size.width,
       
        
          child:
          SingleChildScrollView(
            child:Column(
            mainAxisAlignment: MainAxisAlignment.center,

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
                    hintText:"Enter valid Email..",
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
                    hintText:"Enter unique UserName..",
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
                    return null;
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
                                         }else{
                                           print(errorMessage);
                                           _showerrormessage(context);
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
          )
          )
        
      );

       }
      

    });
  }*/








void _showerrormessage(BuildContext context)
{
  final scafbar=Scaffold.of(context);
  scafbar.showSnackBar(SnackBar(
    content: Text(errorMessage),
    backgroundColor: Colors.white,
    duration: Duration(seconds:5),
    action: SnackBarAction(label: 'OK', onPressed: scafbar.hideCurrentSnackBar),
  ));
}




 


  @override
  Widget build(BuildContext context) {
      
        return Scaffold(
      backgroundColor:Color.fromRGBO(39, 47, 55,1),
      body:DecoratedBox(
        position: DecorationPosition.background,
        
        decoration: BoxDecoration(

          image: DecorationImage(image: AssetImage('images/bkgrnd.png'),
          fit: BoxFit.fill
          )

        
      ),

      child:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Card(
              elevation: 10,
              shape: CircleBorder(
              ),
              color:Color.fromRGBO(r, g, b, 1),
              child:Container(
                width: MediaQuery.of(context).size.width+(5*MediaQuery.of(context).size.width/100),
                height: MediaQuery.of(context).size.height-(70*MediaQuery.of(context).size.height/100),
              
                  
                 child: Container(
                   width: MediaQuery.of(context).size.width-(5*MediaQuery.of(context).size.width/100),
                height: MediaQuery.of(context).size.height-(70*MediaQuery.of(context).size.height/100),
                   child: Card(
                     shape: CircleBorder(),
                     color: Color.fromRGBO(39, 47, 55, 1),
                                        child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         //removed the text "already user"
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           color: Color.fromRGBO(39, 47, 55, 1),
                           child: Loginbutton())
                       ),
                        //removed the text no not a problem
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                           color: Color.fromRGBO(39, 47, 55, 1),
                           child: Registerbutton())
                        ),

                      ],),
                   ),
                 )
                
              )
            )
        ],),
      ), 
      
      )
      
      
    );
   
      
  }


/*_buildBuyTicketButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8),
      child: BuyButton(),
    );
  }
}*/



}


