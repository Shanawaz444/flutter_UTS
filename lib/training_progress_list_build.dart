import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
class Training_progress_list_build extends StatefulWidget {
  @override
  _Training_progress_list_buildState createState() => _Training_progress_list_buildState();
}

class _Training_progress_list_buildState extends State<Training_progress_list_build> {



  @override
  Widget build(BuildContext context) {
    
    
    
    
    return Column(
      children: <Widget>[
        Container(

          child: Text('data'),
        ),
        Container(
                  margin:EdgeInsets.only(bottom:60),
                  width:MediaQuery.of(context).size.width,
                  height:150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:[
                      Card(
                        child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: ClipOval(
                                          child: Icon(
                                         MaterialCommunityIcons.face_profile,
                                         size: (MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)-((99.93/100)*(MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)),
                                         color: Colors.black,
                                         ),
                                     ),
                                   ),
                      ),
                      Card(
                        child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: ClipOval(
                                          child: Icon(
                                         MaterialCommunityIcons.face_profile,
                                         size: (MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)-((99.93/100)*(MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)),
                                         color: Colors.black,
                                         ),
                                     ),
                                   ),
                      ),
                      Card(
                        child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: ClipOval(
                                          child: Icon(
                                         MaterialCommunityIcons.face_profile,
                                         size: (MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)-((99.93/100)*(MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)),
                                         color: Colors.black,
                                         ),
                                     ),
                                   ),
                      ),
                     
                      
                      ]
                    ),
                     ),
      ],
    );
  }
}