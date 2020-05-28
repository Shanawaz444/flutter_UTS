import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
class GameDiscreption extends StatefulWidget {
  final String _currentUserName;
  GameDiscreption(this._currentUserName);
  @override
  _GameDiscreptionState createState() => _GameDiscreptionState();
}

class _GameDiscreptionState extends State<GameDiscreption> with SingleTickerProviderStateMixin{

TextEditingController _friendsUserid;
Animation<double> animation;
  AnimationController animController;
  static int s=3;
  static double d1=1,d2=9;

void initState() {
  super.initState();
  _friendsUserid=TextEditingController();
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





  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity:animController.value,
      duration: Duration(seconds: 1),
      curve: Curves.easeInQuint,
    child: Column(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            Center(child: Text("We are having some data issues,\nplease bear withus the discreption and \n the images size with the waiting\n will be solved soon!,\nThank you \n@UTS",
            style: GoogleFonts.pTSans(
                    fontSize:17,
                    fontWeight: FontWeight.w400
                  ),),)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top:30),
          child: Center(
            child: FlatButton(
              color: Color.fromRGBO(39, 47, 52,1),
              onPressed: 
            (){

              _Setingaddfriends(context);
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
      ],
    ),
    );
  }


  void _Setingaddfriends(context)
  {
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
                        height: MediaQuery.of(context).size.height/6,
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

              if(_friendsUserid.text.length>1)
              {await _checkusername().then((value){
                if(value==false)
                {
                  _showSnackbar(context,"WRONG USER NAME");
                  
                }else{
                   _showSnackbar(context,"Friend Request sent successfully !");
                }
              });
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
          
        )



        ],),
      );
    }
    );
  }


  Future<bool> _checkusername() async
  {
    bool done=true;
   
       final _regesterfirebase=FirebaseDatabase.instance.reference();
    await _regesterfirebase.child("users/userdetails/"+_friendsUserid.text).once().then((value)async
    {
      if(value.value==null)
      {
        print(value.value);
        Navigator.pop(context);
        done=false;
      }else{
        await _regesterfirebase.child("users/userdetails/"+_friendsUserid.text+"/friendrequest").set(
          {
            widget._currentUserName:widget._currentUserName,
           
          }
        ).whenComplete(()async{
           await _regesterfirebase.child("users/userdetails/"+widget._currentUserName+"/pendingfriendrequest")
            .set({
              _friendsUserid.text:_friendsUserid.text
            });
          done=true;
          Navigator.pop(context);
          });
      }
    }).whenComplete((){return done;});
    print(widget._currentUserName);
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