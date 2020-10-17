import 'package:fire/setting/accountedit/accountediting.dart';
import 'package:fire/setting/info/infoui.dart';
import 'package:fire/startingpart1/inheritedpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Settings extends StatelessWidget {
  static bool chan=true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child:Center(child: Text("Settings",
          style: GoogleFonts.pTSans(
                    fontSize:25,
                    fontWeight: FontWeight.w600,
                    color:Color.fromRGBO(39, 47, 55,1)
                  ),
          )),
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/8.5,
          color:Color.fromRGBO(248,220,4,1)
        ),
        Expanded(
                  child: Container(
                     decoration: BoxDecoration(
                   color:Color.fromRGBO(39, 47, 55,1),
                   borderRadius: BorderRadius.only(
                     topLeft:Radius.circular(30.0),
                     topRight:Radius.circular(30.0)
                   )
                 ),

                    width:MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top:40),
              child: Column(
                children:<Widget>[
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: FlatButton(
                      onPressed: (){
                         Navigator.push(
                                                    context,
                                                     MaterialPageRoute(builder: (context) => AccountEditing()),
                                                   
                                                     );

                      },
                                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/8,
                        child:Row(
                          children: <Widget>[
                            Icon(MaterialCommunityIcons.account_edit,
                            color: Colors.white60,
                            size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Account",
                                  style: GoogleFonts.pTSans(
                                      //fontSize:10,
                                      fontWeight: FontWeight.w600,
                                          color:Colors.white70
                                       ),
                                  ),
                                  Text("User-dp,password",
                                  style: GoogleFonts.pTSans(
                                      //fontSize:10,
                                      fontWeight: FontWeight.w600,
                                          color:Colors.white60
                                       ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        //color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right:8.0),
                    child: Divider(),
                  ),
                 Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: FlatButton(
                      onPressed: (){

                         Navigator.push(
                                                    context,
                                                     MaterialPageRoute(builder: (context) => InfoUi()),
                                                   
                                                     );
                      },
                                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/8,
                        child:Row(
                          children: <Widget>[
                            Icon(MaterialCommunityIcons.help,
                            color: Colors.white60,
                            size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Info",
                                  style: GoogleFonts.pTSans(
                                      //fontSize:10,
                                      fontWeight: FontWeight.w600,
                                          color:Colors.white70
                                       ),
                                  ),
                                  Text("About,info,support",
                                  style: GoogleFonts.pTSans(
                                      //fontSize:10,
                                      fontWeight: FontWeight.w600,
                                          color:Colors.white60
                                       ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                       // color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right:8.0),
                    child: Divider(),
                  ),
                Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: FlatButton(
                      onPressed: ()async{
                        
                      if(chan==true)
                      {print("xxxx");
                        chan=false;
                        SharedPreferences _inst= await SharedPreferences.getInstance();
                        FirebaseAuth _auth= FirebaseAuth.instance;
                        await FirebaseDatabase.instance.reference().child("users/userdetails/"+_inst.get('username').toString()+"/isactive").remove();
                        await _auth.signOut();
                        
                        await _inst.remove("username").then((value){
                          chan=true;
                          Navigator.pushAndRemoveUntil(
                                                    context,
                                                     MaterialPageRoute(builder: (context) => InheritingBegin()),
                                                    (Route<dynamic> route) => false,
                                                     );
                        });}


                      },
                                          child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height/8,
                        child:Row(
                          children: <Widget>[
                            Icon(MaterialCommunityIcons.logout,
                            color: Colors.white60,
                             size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Logout",
                                  style: GoogleFonts.pTSans(
                                      //fontSize:10,
                                      fontWeight: FontWeight.w600,
                                          color:Colors.white70
                                       ),
                                  ),
                                  Text("                ",
                                  style: GoogleFonts.pTSans(
                                      //fontSize:10,
                                      fontWeight: FontWeight.w600,
                                          color:Colors.white60
                                       ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                        //color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right:8.0),
                    child: Divider(),
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
              ),
            )
            
          ),
        )
      ],
    );
  }
}