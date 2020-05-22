import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class LeftChatRectBubble extends StatelessWidget {
  final String name;
  final String _datetime;
LeftChatRectBubble(this.name,this._datetime);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
     
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
     

           
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                   color:Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft:Radius.circular(0.0),
                     topRight:Radius.circular(30),
                     bottomLeft: Radius.circular(10),
                     bottomRight: Radius.circular(10)
                   )
                 ),
              //color: Colors.black,
              width: 150,
              child: ClipRRect(
                   borderRadius:BorderRadius.only(
                     topLeft:Radius.circular(30.0),
                     topRight:Radius.circular(30.0)
                   ) ,
                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom:8),
                      child: Wrap(
                        
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:10),
                            child: Align(
                              alignment: Alignment.topLeft,
                                                        child: Text(
                                
                                name,
                                textAlign: TextAlign.left,
                              style:  GoogleFonts.pTSans(
                                                 fontSize:16,
                                                 fontWeight:FontWeight.w500,
                                                  color: Colors.black     ),
                                              
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:10),
                      child: Text(_datetime,
                      style: TextStyle(
                        fontSize:12
                      ),
                      ),
                    )
                  ],
                ),
              )),
          )
     
    );
  }
}
class ReftChatRectBubble extends StatelessWidget {
  final String name;
  final String _datetime;
ReftChatRectBubble(this.name,this._datetime);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
          child: Container(
        width: 150,
       
        padding: EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
       

             
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                     color:Colors.white,
                     borderRadius: BorderRadius.only(
                       topLeft:Radius.circular(30),
                       topRight:Radius.circular(0.0),
                       bottomLeft: Radius.circular(10),
                       bottomRight: Radius.circular(10)
                     )
                   ),
                //color: Colors.black,
                width: 150,
                child: ClipRRect(
                     borderRadius:BorderRadius.only(
                       topLeft:Radius.circular(30.0),
                       topRight:Radius.circular(30.0)
                     ) ,
                                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10,bottom:8),
                        child: Wrap(
                          
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right:10),
                              child: Align(
                                alignment: Alignment.topRight,
                                                          child: Text(
                                  
                                  name,
                                  textAlign: TextAlign.right,
                                style:  GoogleFonts.pTSans(
                                                   fontSize:16,
                                                   fontWeight:FontWeight.w500,
                                                    color: Colors.black     ),
                                                
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10),
                        child: Text(_datetime,
                        style: TextStyle(
                          fontSize:12
                        ),
                        ),
                      )
                    ],
                  ),
                )),
            )
       
      ),
    );
  }
}