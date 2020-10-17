import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
class AnimNewFriendRequestAnimation extends StatefulWidget {
  final String _name;
  final String _currentusername;
  final Function fun;
  AnimNewFriendRequestAnimation(this._name,this._currentusername,this.fun);
  @override
  _NewFriendRequestAnimationState createState() => _NewFriendRequestAnimationState();
}

class _NewFriendRequestAnimationState extends State<AnimNewFriendRequestAnimation>with SingleTickerProviderStateMixin {





Animation<double> animation;
  AnimationController animController;
  static int s=3;
  static double d1=1,d2=9;

void initState() {
  super.initState();
  
  animController = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  );

  animation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(animController)
    ..addListener(() {
      // Empty setState because the updated value is already in the animation field
      setState(() {
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
       
        animController.dispose();
      } 
    });

  animController.forward();
}










Future<bool>_acceptFriendRequest(String _removename)async
{
  final _regesterfirebase=FirebaseDatabase.instance.reference();
 
  await _regesterfirebase.child("users/userdetails/"+widget._currentusername.toString()+"/friends/").update({
    _removename.toString():_removename.toString()
  });
    
  await _regesterfirebase.child("users/userdetails/"+_removename.toString()+"/friends/").update(
    {
      widget._currentusername:widget._currentusername.toString()
    }
  );
  await _regesterfirebase.child("users/userdetails/"+widget._currentusername+"/friendrequest/"+_removename).remove().whenComplete(()
  {
    print("done");
    
  });
  await _regesterfirebase.child("users/userdetails/"+widget._name+"/pendingfriendrequest/"+widget._currentusername).remove().whenComplete(()
  {
    print("done");
    
  });
  return true;
}
Future<bool>_rejectFriendRequest(String _removename)async
{
  final _regesterfirebase=FirebaseDatabase.instance.reference();
  await _regesterfirebase.child("users/userdetails/"+widget._currentusername+"/friendrequest/"+_removename).remove().whenComplete(()
  {
    print("done");
    
  });
  await _regesterfirebase.child("users/userdetails/"+widget._name+"/pendingfriendrequest/"+widget._currentusername).remove().whenComplete(()
  {
    print("done");
    
  });
  return true;
}













  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: animController.value,
      duration: Duration(milliseconds: 500),
      curve: Curves.elasticOut,
      child: Card(
        color: Color.fromRGBO(39, 47, 55,1),
                 child:Container(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/8,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                      Container(
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(MaterialCommunityIcons.account_badge,color: Colors.black,size: 40,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(widget._name,style: GoogleFonts.pTSans(
                                fontSize:20,
                               fontWeight:FontWeight.w700,
                               color: Colors.white
                              ),)),
                          ),
                        ],)
                      ),
                          
                      Container(
                        child: Row(
                          children: <Widget>[
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 height: 25,
                                 width: 40,
                           child: Align(
                                  alignment: Alignment.centerRight,
                                 child: FlatButton(
                                   color: Colors.green,
                                   onPressed: ()async{
                                    bool val=await _acceptFriendRequest(widget._name);
                                    if(val==true)
                                    {
                                      
                                    }else{
                                      print("nope");
                                    }

                                   },
                                child: Center(child: Icon(MaterialCommunityIcons.account,color: Colors.white,),
                                )),
                           ),
                         ),
                             ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             height: 25,
                             width: 40,
                             child: Align(
                                  alignment: Alignment.centerRight,
                                 child: FlatButton(
                                   color: Colors.red,
                                   onPressed: ()async{
                                      bool val=await _rejectFriendRequest(widget._name);
                                    if(val==true)
                                    {
                                      
                                    }else{
                                      print("nope");
                                    }
                                   },
                                child: Center(child: Icon(MaterialCommunityIcons.delete_circle,color: Colors.white  ,),
                                )),
                             ),
                           ),
                         ),
                          ],
                        ),
                      )


                    ]
                  ),
                   )
             ),
      
    );
  }
}