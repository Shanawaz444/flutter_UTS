import 'package:fire/chatui/chatfriendstabs.dart';
import 'package:fire/chatui/chattingui.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class  Chatui extends StatefulWidget {
  final String _username;
  const Chatui(this._username);
  @override
  _ChatuiState createState() => _ChatuiState();
}

class _ChatuiState extends State<Chatui> {



    List<String>_friendrequests=[];
     final _regesterfirebase=FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:  _regesterfirebase.child("users/userdetails/"+widget._username.toString()+"/friends").onValue,
      builder:(context,snap)
    {
      if(snap.connectionState==ConnectionState.waiting)
      {
        return Center(child:Container(
                       height: 101,
                       width: 101,
                       child: Image.asset("images/loding.gif")));
      }
      if (snap.hasData && !snap.hasError && snap.data.snapshot.value != null) {
         _friendrequests.clear();
        final vv=snap.data.snapshot.value as Map;
         for(var i in vv.keys)
         {
           
           _friendrequests.add(i.toString());
         }
         print(vv.keys.toString()+"assas");
        return  Expanded(
                  child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(39, 47, 55,1),
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                )
              
              ),
              
              child: ListView(
                               children:_friendrequests.map((e)
                               {
                                return 
                                
                                
                                   Padding(padding: EdgeInsets.all(8.0),
                                   
                                    
                                     child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ChatTabs(e.toString(),widget._username)),
                                      
                                      
                                      
                                     
                                      

                                  );
                                
                                
                               }).toList()
                             ),
            ),
        );
        

      }else{
        return Center(child: Text("Nothing For now",
                              style: GoogleFonts.pTSans(
                                 fontSize:20,
                                 fontWeight:FontWeight.w700,
                                  color: Colors.black     ),
                               ),
                               );
      }
      
    }
    );
  }
}
/*Route _createroute(String _username,String _currentusername)
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
}*/




















/*
Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(39, 47, 55,1),
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )
            
            ),
            
            child: ListView(
                             children:_friendrequests.map((e)
                             {
                              return GestureDetector(
                                onTap: (){
                               Navigator.of(context).push(_createroute(e.toString()));
                                },
                              
                              child:Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(padding: EdgeInsets.all(8.0),
                                 
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: ChatTabs(e.toString()))
                                    

                                ),
                              ));
                             }).toList()
                           ),
          );
*/ 