import 'package:fire/notificationsfromfirebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class NootifyIcon extends StatelessWidget {
  final String _username;
  NootifyIcon(this._username);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(icon: Icon(MaterialIcons.notifications,color: Colors.white,), onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => NootificationfromFire(_username.toString())),);
             },
             iconSize: 35,),
    );
  }
}
