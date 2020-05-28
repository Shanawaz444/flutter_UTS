import 'dart:async';

import 'package:fire/mainhomepage.dart';
import 'package:fire/registeranimation.dart';
import 'package:fire/startingpart1/inheritedpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_animation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SpalshScreen()
      
      
    );
  }
}

class SpalshScreen extends StatelessWidget{
  Future<void>_dividing(context)async{
    SharedPreferences _shardpref=await SharedPreferences.getInstance();
    
    if(_shardpref.containsKey("username"))
    {
     final String _username=_shardpref.getString("username");
     Timer(Duration(seconds: 2),()=> Navigator.pushAndRemoveUntil( context,
                                                     MaterialPageRoute(builder: (context) => HomePage(_username)),
                                                    (Route<dynamic> route) => false,
                                                     ));
     
    }else{
      Timer(Duration(seconds:2),()=>Navigator.pushAndRemoveUntil( context,
                                                     MaterialPageRoute(builder: (context) => InheritingBegin()),
                                                    (Route<dynamic> route) => false,
                                                     ));
       
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color:  Color.fromRGBO(39, 47, 55,1),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:150),
              child: Center(
                child:Container(
                  height:MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Image.asset("images/sa.png",fit: BoxFit.cover,),

                )
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("U ",style: GoogleFonts.pTSans(
                        fontSize:25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(248,220,4,1)
                      ),),
                      Text("T",style: GoogleFonts.pTSans(
                        fontSize:25,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),),
                      Text(" S",style: GoogleFonts.pTSans(
                        fontSize:25,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(248,220,4,1)
                      ),),
                ],
              ),
            ),
            Center(
              child: Text("Unite Through e-Sport",style: GoogleFonts.pTSans(
                    fontSize:15,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(248,220,4,1)
                  ),),
            ),
            FutureBuilder(
              future:_dividing(context),
              builder:(context,snap){
                return Padding(
                               padding: const EdgeInsets.only(top:160),
                  child: Center(child: ColoredCircularProgressIndicator()),
                );
            })
          ],
        ),
      ),
    );

  }


}

