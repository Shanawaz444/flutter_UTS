import 'package:fire/notificationsui/newFriendrequests.dart';
import 'package:fire/pendingrequests/pendingrequesrui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class NootificationfromFire extends StatefulWidget {
  final String _username;
  NootificationfromFire(this._username);
  @override
  _NotificationfromFireState createState() => _NotificationfromFireState();
}

class _NotificationfromFireState extends State<NootificationfromFire> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color.fromRGBO(248,220,4,1),
          appBar: AppBar(
            backgroundColor:Color.fromRGBO(39, 47, 55,1) ,
            bottom: TabBar(
              
              tabs: [
                Tab(
                  icon: Icon(Icons.add_comment),
                  child: Text("Requests") ,
                ),
                
               Tab(
                  icon: Icon(MaterialCommunityIcons.undo),
                  child: Text("Pending Requests") ,
                ),
              ],
            ),
            title: Text('UTS REQUESTS'),
          ),
          body: TabBarView(
            children: [
              FriendRequests(widget._username),
              PendingFriendrequestUi(widget._username)
              
              
            ],
          ),
        ),
      );
  }
}