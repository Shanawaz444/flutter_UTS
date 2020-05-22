import 'package:fire/chatui/chattingui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';
class ChatTabs extends StatelessWidget {
  final String name;
  final String _currentusername;
  Color activecolor;
  ChatTabs(this.name,this._currentusername);
  Future<String>_isactive()async
  {
    String sds;
    await FirebaseDatabase.instance.reference().child("users/userdetails/"+name.toString()+"/isactive").once().then((value){
     sds=value.value.toString();
    });
    return sds;
  }
  @override
  Widget build(BuildContext context) {
  
        
        return GestureDetector(
           onTap: (){
          Navigator.of(context).push(_createroute(name.toString(),_currentusername.toString()));
                 },
              child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children:<Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(MaterialCommunityIcons.account_child_circle,color: Color.fromRGBO(248,220,4,1),size: 40,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(name.toString().toUpperCase(),
                        style: GoogleFonts.pTSans(
                                fontSize:15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                        ),
                      )
                    ]
                  ),
                 Padding(
                   padding: const EdgeInsets.only(right:20),
                   child: Row(
                     children: <Widget>[
                       Text("Active",style: TextStyle(color:Colors.white),),
                       StreamBuilder(
                         stream: FirebaseDatabase.instance.reference().child("users/userdetails/"+name.toString()+"/isactive").onValue,
                         builder: (context, snap) {
                            if (snap.hasData && !snap.hasError && snap.data.snapshot.value != null)
                            {
                              return Icon(MaterialCommunityIcons.circle,color: Colors.green[300]);
                              //print(snap.data.snapshot.value.toString());
                            }else{
                            //  print("null");
                            }
                           return Icon(MaterialCommunityIcons.circle,color: Colors.grey);
                         }
                       )
                     ],
                   ),
                 )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Divider(color: Colors.white,),
            )
              ],
            ),
          ),
        );
      
    
  }
}
Route _createroute(String _username,String _currentusername)
{
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)=>Chattingui(_username.toString(),_currentusername.toString()),
     transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return new ScaleTransition(
            scale: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.00,
                    0.50,
                    curve: Curves.linear,
                  ),
                ),
              ),
            child: ScaleTransition(
                     scale: Tween<double>(
                       begin: 1.5,
                       end: 1.0,
                     ).animate(
                       CurvedAnimation(
                         parent: animation,
                         curve: Interval(
                           0.50,
                           1.00,
                           curve: Curves.linear,
                         ),
                       ),
                     ),
                     child: child,
                   ),
           );
         }
  );
}
