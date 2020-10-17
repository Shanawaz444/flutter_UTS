import 'package:fire/notificationsfromfirebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class NootifyIcon extends StatelessWidget {
  final String _username;
  final Icon _icn;
  NootifyIcon(this._username,this._icn);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(icon:_icn, onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => NootificationfromFire(_username.toString())),);
             },
             iconSize: 35,),
    );
  }
}
