import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
class AddFriend extends StatefulWidget {
  final String _currentusername;
  AddFriend(this._currentusername);

  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  var controller=new StreamController();
 Stream _notify;
  TextEditingController _friendsUserid;
  static bool _yeilding=true;

  void initState()
  {
     super.initState();
     _friendsUserid=TextEditingController();
    
     
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      
     icon: Icon(MaterialCommunityIcons.account_plus),
      color:  Color.fromRGBO(39, 47, 55,1),
      iconSize: 30,
      onPressed: (){
        _Setingaddfriends(context);
      },

    );
  }
  void _Setingaddfriends(context)
  {
    _notify=controller.stream;
    showModalBottomSheet(
      isDismissible: true,
      context: context, builder: (BuildContext bc)
    {
      
      return Container(
        color: Color.fromRGBO(39, 47, 52,1),
        child: Column(
          
          children: <Widget>[
          Align(
            alignment:Alignment.topLeft ,
                      child: Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: SizedBox(
                    child: Card(
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                         ),
                         elevation: 100,
                      color: Colors.white,

                                        child: Container(
                        height: MediaQuery.of(context).size.height/7,
                        width: MediaQuery.of(context).size.width/4,
                        color: Colors.transparent,
                        child: Center(
                          child:Icon(MaterialIcons.wifi,color: Color.fromRGBO(39, 55, 52,1),size: 70,)
                        ),
                      ),
                    ),
                  ),
                ),
               Padding(
                  padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
                  child: SizedBox(
                    child: Card(
                      shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                         ),
                         elevation: 100,
                      color: Color.fromRGBO(248,220,4,1),

                                        child: Container(
                        height: MediaQuery.of(context).size.height/6,
                        width: MediaQuery.of(context).size.width/4,
                        color: Colors.transparent,
                        child: Center(
                          child:Icon(MaterialIcons.games,color: Color.fromRGBO(39, 55, 52,1),size: 70,)
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),


         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Center(child: Text("Enter your Friends User-id",style: GoogleFonts.pTSans(
                    fontSize:17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),),),
         ),
         
         Padding(
                                           padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                           child: TextField(
                                             controller: _friendsUserid,
                                             
                                             decoration: InputDecoration(
                                               
                                               enabledBorder:new OutlineInputBorder(
                                                 borderSide: new BorderSide(color:Color.fromRGBO(248,220,4,1) )
                                                 
                                               ) ,
                                                
                                                //helperText: 'enter a valid email.',
                                                labelText: 'ID',
                                                labelStyle:  GoogleFonts.pTSans(
                                              color: Color.fromRGBO(248,220,4,1),
                                              fontSize: 18
                                            ),
                                                
                                               border: OutlineInputBorder(borderSide:  new BorderSide(color:Color.fromRGBO(248,220,4,1) ))   
                                             ),
                                             
                                           style: TextStyle(color: Colors.green),
                                           ),
                                         ),

///////////////////////////////////////////////////////////////////////////////////////////////////
Padding(
          padding: const EdgeInsets.only(top:10),
          child: Center(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                         ) ,
              color: Color.fromRGBO(39, 55, 52,1),
              onPressed: 
            ()async{

            if(_yeilding==true)
              {if(_friendsUserid.text.length>1)
              {
                _yeilding=false;
                bool value=await _checkusername();
                _friendsUserid.clear();
                
                if(value==false)
                {
                  _yeilding=true;
                  _showSnackbar(context,"WRONG USER NAME");
                  
                  
                }else{
                        _yeilding=true;
                   _showSnackbar(context,"Friend Request sent successfully !");
                }
              
             }}
            }, 
            child:Text("ADD Friend",
            style: GoogleFonts.pTSans(
                      fontSize:15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),) 
            
            ),
          ),
          
        ) 
                                          



        ],),
      );
    }
    );
  }


  Future<bool> _checkusername() async
  {
    print("pppp");
    bool done=true;
   
       final _regesterfirebase=FirebaseDatabase.instance.reference();
       await _regesterfirebase.child("users/userdetails/"+widget._currentusername+"/friends/"+_friendsUserid.text).once().then((value){
        print(value.value);
         if(value.value!=null)
         {
           print("not null");
           done=false;
           Navigator.pop(context);
           
         }
       });
       if(done==true)
   { await _regesterfirebase.child("users/userdetails/"+_friendsUserid.text).once().then((value)async
    {
      if(value.value==null)
      {
        print(value.value);
        Navigator.pop(context);
        done=false;
      }else{
        await _regesterfirebase.child("users/userdetails/"+_friendsUserid.text+"/friendrequest").set(
          {
            widget._currentusername:widget._currentusername,
           
          }
        ).whenComplete(()async{
           await _regesterfirebase.child("users/userdetails/"+widget._currentusername+"/pendingfriendrequest")
            .set({
              _friendsUserid.text:_friendsUserid.text
            });
          done=true;
          Navigator.pop(context);
          });
      }
    }).whenComplete((){return done;});}
    print(widget._currentusername);
    return done;
    
  }
   void _showSnackbar(BuildContext context,String msg) {
    final scaff = Scaffold.of(context);
    scaff.showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor:Color.fromRGBO(39, 47, 52,1) ,
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'OK', onPressed: scaff.hideCurrentSnackBar,
      ),
    ));
  }
}
/*Padding(
          padding: const EdgeInsets.only(top:10),
          child: Center(
            child: FlatButton(
              shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                         ) ,
              color: Color.fromRGBO(39, 55, 52,1),
              onPressed: 
            ()async{

              if(_friendsUserid.text.length>1)
              {bool value=await _checkusername();
                
                if(value==false)
                {
                  _showSnackbar(context,"WRONG USER NAME");
                  
                }else{
                   _showSnackbar(context,"Friend Request sent successfully !");
                }
              
             }
            }, 
            child:Text("ADD Friend",
            style: GoogleFonts.pTSans(
                      fontSize:15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),) 
            
            ),
          ),
          
        ) */