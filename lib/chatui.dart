
import 'package:flutter/material.dart';
class  Chatui extends StatefulWidget {
  final String _username;
  const Chatui(this._username);
  @override
  _ChatuiState createState() => _ChatuiState();
}

class _ChatuiState extends State<Chatui> {
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children:<Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              child:
              Card(
                color: Color.fromRGBO(39, 47, 55,1),
                child: Text(widget._username),
                )
            ),
          ),
        )
        ]
      )
    );
  }
}