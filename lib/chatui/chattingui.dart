import 'dart:async';

import 'package:fire/chatui/chatrectbubble.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Chattingui extends StatelessWidget {
  final String name;
  final String _currentusername;
  final Widget m;
  Chattingui(this.name,this._currentusername,this.m);
  final TextEditingController msg=TextEditingController();
  List<dynamic>_chat=[];
  static int lengthof_chat=0;
   final _regesterfirebase=FirebaseDatabase.instance.reference();
    ScrollController _scrollController = new ScrollController();
  Future<void> onmessagesend()async
  {
    print(_currentusername);
    print(name);
    int a=lengthof_chat;
    int b=lengthof_chat;
     try{await _regesterfirebase.child("users/userdetails/"+_currentusername.toString()+"/chat/"+name.toString()+"/"+a.toString()).set({
       "0":msg.text,
       "1": _currentusername.toString(),
       "2":DateTime.now().toString().substring(0,16)
     });}catch(e){
       print(e);
     }
     await _regesterfirebase.child("users/userdetails/"+name.toString()+"/chat/"+_currentusername.toString()+"/"+b.toString()).set({
       "0":msg.text,
       "1":_currentusername.toString(),
       "2":DateTime.now().toString().substring(0,16)
     });
      Timer(Duration(milliseconds: 1000), () => _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromRGBO(248,220,4,1),
      appBar: AppBar(
        
        backgroundColor:Color.fromRGBO(248,220,4,1),
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child:ClipOval(
                child:Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height/15,
                  width: MediaQuery.of(context).size.width/8.5,
                  child:
                         m
                       
                      
                  
                )
              ),
                        
                      ),

            Text(name.toUpperCase(),
        style: GoogleFonts.pTSans(
                    fontSize:25,
                    fontWeight: FontWeight.w600,
                    color:Color.fromRGBO(39, 47, 55,1)
                  ),),
          ],
        ),

                  actions: <Widget>[IconButton(icon: Icon(Icons.ac_unit), onPressed: (){print(lengthof_chat);})],
      ),

    
              
       body:GestureDetector(
         onTap: ()=>FocusScope.of(context).unfocus(),
                child: Column(
           children: <Widget>[
             Expanded(
                          child: Container(
                 decoration: BoxDecoration(
                   color:Color.fromRGBO(39, 47, 55,1),
                   borderRadius: BorderRadius.only(
                     topLeft:Radius.circular(30.0),
                     topRight:Radius.circular(30.0)
                   )
                 ),
                 child: ClipRRect(
                    borderRadius:BorderRadius.only(
                     topLeft:Radius.circular(30.0),
                     topRight:Radius.circular(30.0)
                   ) ,
                   
                                  child: StreamBuilder(
                          stream:  _regesterfirebase.child("users/userdetails/"+_currentusername.toString()+"/chat/"+name.toString()).onValue,
                          builder:(context,snap){
                              lengthof_chat=0;
                              
                           if (snap.hasData && !snap.hasError && snap.data.snapshot.value != null)
                           {
                             Timer(Duration(milliseconds: 1000), () => _scrollController.jumpTo(_scrollController.position.maxScrollExtent));
                               _chat.clear();
                               lengthof_chat=0;
                             //  print(snap.data.snapshot.value.toString());
                               var v=snap.data.snapshot.value;
                           
                               try{_chat.addAll(v);
                               //print(_chat[0][1]);
                               }catch(b){print(b);}
                               //print(_chat.length);
                               lengthof_chat=_chat.length;
                               //print(lengthof_chat);
                           if(_chat.length>0)
                           {
                               print("greater");
                                return ListView(scrollDirection: Axis.vertical,
                                 controller: _scrollController,
                                  padding: EdgeInsets.only(top:30),
                                     children: _chat.map((e){
                                       if(e[1].toString()==_currentusername.toString())
                                       {
                                         return LeftChatRectBubble(e[0].toString(),e[2].toString());
                                       }else{
                                         return ReftChatRectBubble(e[0].toString(),e[2].toString());
                                       }
                                       
                                     }).toList(),
                                   );
                                 
                           }else{
                               return Center(child: Text("Nothing For now",
                              style: GoogleFonts.pTSans(
                                 fontSize:20,
                                 fontWeight:FontWeight.w700,
                                  color: Colors.white     ),
                               ),
                               );
                           }
                              
                                //return Text("dad");
                           }else{
                               
                               return Center(child: Text("Nothing For now",
                              style: GoogleFonts.pTSans(
                                 fontSize:20,
                                 fontWeight:FontWeight.w700,
                                  color: Colors.white     ),
                               ),
                               );
                           }
                          
                          }
                          ),
                 ),
                          ),
             ),
             Container(
               height: 70.0,
               padding: EdgeInsets.symmetric(horizontal:8.0),
               color: Color.fromRGBO(39, 47, 55,1),
               child: Row(
                 children: <Widget>[
                   IconButton(
                        icon: Icon(Icons.photo,
                     ),
                     iconSize: 25.0,
                     color:Color.fromRGBO(248,220,4,1) ,
                     onPressed: (){},
                   ),
                   Expanded(child: TextFormField(
                     
                                    controller: msg,
                                    style: TextStyle(color:Colors.white),

                                  )),
                    IconButton(
                      highlightColor: Colors.white,
                      hoverColor: Colors.white,
                        icon: Icon(Icons.send
                     ),
                     iconSize: 25.0,
                     color: Color.fromRGBO(248,220,4,1),
                     onPressed: (){
                       if(msg.text.length>0)
                       {onmessagesend();
                       msg.clear();
                       FocusScope.of(context).unfocus();}},
                   ),
                 ],
               ),
             )
           ],
         ),
       ),
       
          
              
             
          
                  

          
          
    
      



     




    );
  }
}






/*

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[


                  Container(
                    child: StreamBuilder(
                stream:  _regesterfirebase.child("users/userdetails/"+_currentusername.toString()+"/chat/"+name.toString()).onValue,
                builder:(context,snap){
                    lengthof_chat=0;
                    if(snap.connectionState==ConnectionState.waiting)
                    {
                      return Center(child:Container(
                       
                         child: Image.asset("images/loding.gif")));
                    }
                 if (snap.hasData && !snap.hasError && snap.data.snapshot.value != null)
                 {
                     _chat.clear();
                     lengthof_chat=0;
                     print(snap.data.snapshot.value.toString());
                     var v=snap.data.snapshot.value;
                 
                     try{_chat.addAll(v);
                     print(_chat[0][1]);
                     }catch(b){print(b);}
                     print(_chat.length);
                     lengthof_chat=_chat.length;
                     print(lengthof_chat);
                 if(_chat.length>0)
                 {
                     print("greater");
                      return ListView(
                           children: _chat.map((e){
                             
                             return Text("e[0].toString()");
                           }).toList(),
                         );
                       
                 }else{
                     return Text("nothing for now");
                 }
                    
                      //return Text("dad");
                 }else{
                     
                     return Text("sczcz");
                 }
                
                }
                ),
                  ),
                  






                  Padding(
                    padding: const EdgeInsets.only(bottom:10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width/1.2,
                          child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(child: TextFormField(
                                  controller: msg,

                                )),
                              ),
                        ),
                        Center(child: IconButton(icon: Icon(MaterialCommunityIcons.send,),onPressed: (){
                          onmessagesend();
                        }
                        )
                        ),
                      ]
                    )
                  ),
                ],
              )
*/ 