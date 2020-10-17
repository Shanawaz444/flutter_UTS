import 'dart:convert';

import 'package:fire/notificationsui/newfriendrequestanimation.dart';
import 'package:fire/pendingrequests/pendingrequesranimation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class FriendRequestData{
final String proo;
FriendRequestData({@required this.proo});

}





class PendingFriendrequestUi extends StatefulWidget  {
  final String _currentUsername;
  PendingFriendrequestUi(this._currentUsername);

  @override
  _PendingFriendrequestUiState createState() => _PendingFriendrequestUiState();
}

class _PendingFriendrequestUiState extends State<PendingFriendrequestUi> {
  List<String>_friendrequests=[];

  





void settingup()
{
  setState(() {
    
  });
}


final _regesterfirebase=FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:  _regesterfirebase.child("users/userdetails/"+widget._currentUsername.toString()+"/pendingfriendrequest").onValue,
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
        return ListView(
                         children:_friendrequests.map((e)
                         {
                          return Padding(padding: EdgeInsets.all(8.0),
                          child:      PendingFriendRequestAnimation(e.toString(),widget._currentUsername.toString(),settingup)

                          );
                         }).toList()
                       );

      }else{
        return Center(child: Text("Nothing for now",
                              style: GoogleFonts.pTSans(
                                 fontSize:20,
                                 fontWeight:FontWeight.w700,
                                  color: Colors.black     ),
                               ),
                               );
      }
      
    }
    );
      
    /*
     PendingFriendRequestAnimation(e.toString(),widget._currentUsername.toString(),settingup)
    */ 
}
}