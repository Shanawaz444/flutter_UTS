/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';

import 'mainhomepage.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final FirebaseAuth _auth = FirebaseAuth.instance;
final databaseReference=FirebaseDatabase.instance.reference();
                       
  TextEditingController _username,_password;
  static int loggedin=0;
  void initState()
  {
    super.initState();
    _username = TextEditingController();
    _password = TextEditingController();
  }
  void login_finilizing()async
  {
    
     setState(() {
       /*//databaseReference.child("usernametext").set({"value":"sdsdsdsdsd"});
       databaseReference.child("usernametext").child("path").update({"value":"xxxx"});
     databaseReference.child("usernametext/path").once().then((DataSnapshot snap){print(snap.value);});*/

     });
     
     
    
    
  }
  

   


  @override
  Widget build(BuildContext context) {
    if(loggedin==0){
      return Scaffold(
          body:DecoratedBox(
        position: DecorationPosition.background,
        
        decoration: BoxDecoration(

          image: DecorationImage(image: AssetImage('images/loginpagewallpaper.jpg'),
          fit: BoxFit.cover
          )

        
      ),
            child: Container(width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset('images/logo.png',
                    filterQuality: FilterQuality.high,
                    width: MediaQuery.of(context).size.width-((50/100)*MediaQuery.of(context).size.width),
                    height: MediaQuery.of(context).size.height-((50/100)*MediaQuery.of(context).size.height),
                    ),          
                          Align(
                            alignment: Alignment.bottomCenter,
                              child: Container(
                              child: Column(
                              
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                 
                                    
                                      child: CupertinoTextField(
                                        placeholder: 'UserName',
                                        padding: EdgeInsets.all(11),
                                        controller: _username,
                                      onSubmitted: (v){},
                                       ),
                                      
                                     
                                ),



                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(
                                    
                                      child: CupertinoTextField(
                                        placeholder: 'PassWord',
                                        padding: EdgeInsets.all(11),
                                        controller: _password,
                                      onSubmitted: (v){

                                      },
                                       ),
                                      
                                     ),
                                ),
                                   
                                 
                                 Row(
                                   crossAxisAlignment:CrossAxisAlignment.center,
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children:<Widget>
                                   [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Center(child: Container(child: Text('Remember me:'))),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: CupertinoSwitch(value: false, 
                                       
                                       activeColor: Colors.blue,
                                       onChanged: (v){

                                       }
                                       
                                       ),
                                     )

                                   ]
                                 ),


                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child:CupertinoButton(color: Colors.blueAccent  ,
                                      child: Text('LOGIN'), onPressed: (){
                                        login_finilizing();
                                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>(HomePage())));
                                       
                                    }) ,
                                    ),
                                )


                              ],
                        ),
                            ),
                          ),
                      
                    
                  ],
                ),
              ),
            ),
          
      ) );

    }else{
    return HomePage();
    }
    
          
          
          
          
          
          
          
          
          
          
         /* Center(
            child: SingleChildScrollView(
                        child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Card(
                        child: CupertinoTextField(
                          placeholder: 'UserName',
                          padding: EdgeInsets.all(11),
                          controller: _textController,
                        onSubmitted: (v){},
                         ),
                        ),
                       ),
                  ),



                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Card(
                        child: CupertinoTextField(
                          placeholder: 'PassWord',
                          padding: EdgeInsets.all(11),
                          controller: _textController,
                        onSubmitted: (v){},
                         ),
                        ),
                       ),
                  ),
                     
                   
                   Row(
                     crossAxisAlignment:CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.end,
                     children:<Widget>
                     [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Center(child: Container(child: Text('Remember me:'))),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: CupertinoSwitch(value: false, 
                         
                         activeColor: Colors.blue,
                         onChanged: (v){

                         }
                         
                         ),
                       )

                     ]
                   ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child:CupertinoButton(color: Colors.blueAccent  ,
                        child: Text('LOGIN'), onPressed: (){

                        Navigator.pop(context); 
                      }) ,
                      ),
                  )


                ],
              ),
            ),
          ),
    );*/
  }
}*/