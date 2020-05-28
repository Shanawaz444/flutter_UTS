import 'dart:async';
import 'dart:typed_data';
import 'package:fire/addfriend/addfriend.dart';
import 'package:fire/chatui/chatui.dart';
import 'package:fire/dummy.dart';
import 'package:fire/model/imagesmodel.dart';
import 'package:fire/notificationsui/notificationiconfunction.dart';
import 'package:fire/setting/settings.dart';
import 'package:fire/utils/database_helper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  final String _username;
 
   








  const HomePage(this._username,);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver{
  static int desision;
  var controller=new StreamController();
 Stream _notify;
  DatabaseHelper _databaseHelper=DatabaseHelper();
  List<LoadImages>mobilemainui=[];
  List<LoadImages>pcmainui=[];
  List<LoadImages>xboxmainui=[];
  static bool _proceed;

  void initState()
  {
  super.initState();
  _updateisactive();
  WidgetsBinding.instance.addObserver(this);
  _notify=controller.stream;
  controller.add("event");
  _proceed=true;
  desision=0;
  //print(widget._username);
  //index=0;
  }
  Future<void>_updateisactive()async
  {
    await FirebaseDatabase.instance.reference().child("users/userdetails/"+widget._username.toString()).update(
        {
         "isactive":"active"
         }
       );
       
    
  }
 @override
  void dispose()
  {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  void didChangeAppLifecycleState(AppLifecycleState state)
  {
    super.didChangeAppLifecycleState(state);
    switch(state)    {
      case AppLifecycleState.paused:
          FirebaseDatabase.instance.reference().child("users/userdetails/"+widget._username.toString()+"/isactive").remove();
         break;
      case AppLifecycleState.inactive:
          FirebaseDatabase.instance.reference().child("users/userdetails/"+widget._username.toString()+"/isactive").remove();

          break;
      case AppLifecycleState.resumed:
            FirebaseDatabase.instance.reference().child("users/userdetails/"+widget._username.toString()+"/isactive").update({
              'isactive':'active'
            });
          break;
      case AppLifecycleState.detached:
          FirebaseDatabase.instance.reference().child("users/userdetails/"+widget._username.toString()+"/isactive").remove();

          break;   
    }

  }


  Future<bool>_settingthedata()async
  {
    if(_proceed==true)
    {var mobilemainimgs=await _databaseHelper.getLoadImageMapList("mobilemainui");
    for(int i=0;i<mobilemainimgs.length;i++)
    {
      LoadImages _temp;
      _temp=LoadImages.fromMapObject(mobilemainimgs[i]);
      mobilemainui.add(_temp);   
    }
   // mobilemainimgs.clear();
    var pcmainimgs=await _databaseHelper.getLoadImageMapList("pcmainui");
   
    for(int i=0;i<pcmainimgs.length;i++)
    {
      LoadImages _temp;
      _temp=LoadImages.fromMapObject(pcmainimgs[i]);
      pcmainui.add(_temp);   
    }
   // pcmainimgs.clear();
    var xboxmainimgs=await _databaseHelper.getLoadImageMapList("xboxmainui");
    for(int i=0;i<xboxmainimgs.length;i++)
    {
      LoadImages _temp;
      _temp=LoadImages.fromMapObject(xboxmainimgs[i]);
      xboxmainui.add(_temp);   
    }}
    _proceed=false;
    //xboxmainimgs.clear();
    return true;
    
   
  }











 
  @override
  Widget build(BuildContext context) {
       
         return Scaffold(
      backgroundColor: Color.fromRGBO(248,220,4,1),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Color.fromRGBO(39, 47, 55,1),
        circleColor: Colors.white,
        textColor: Colors.white,
        inactiveIconColor: Colors.white,
        initialSelection: 0,
        activeIconColor: Colors.black,
        //initialSelection: 3,
        tabs: [
          TabData(iconData: MaterialCommunityIcons.home,title: 'Home'),
          TabData(iconData: MaterialCommunityIcons.chat,title: 'Chat'),
          TabData(iconData: MaterialCommunityIcons.settings, title: 'Settings'),
          
        ], 
        onTabChangedListener: (d){
         desision=d;
         controller.add("apashampa");
        }),
          
        

         body:  StreamBuilder<Object>(
           stream: _notify,
           builder: (context, snapshot) {
             
             if(desision==0)
            { return FutureBuilder(
                   future:_settingthedata() ,
                   builder: (context,snapsnap){
                     return SingleChildScrollView(
                       child:
                       Column(children: <Widget>[
                          Row(children: <Widget>[
                     
                   Padding(
                     padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                     child: Center(
                      child: Text("MOBILE",
                      style: GoogleFonts.pTSans(
                        fontSize:30,
                        fontWeight: FontWeight.w600
                      ),
                      )
                     ),
                   ),
                   Icon(MaterialIcons.phone_android)

                  ],),
                         Padding(
                           padding: const EdgeInsets.only(top:10),
                             
                               child: Container(
                               child: CarouselSlider(
                                 items:mobilemainui.map((e){
                                  return GestureDetector(
                                    onTap: (){Navigator.of(context).push(_createroute(e.imggg,e.gametitle.toString(),widget._username.toString()));},
                                   child: Wrap(
                                      children: <Widget>[
                                        Center(
                                          child: Text(e.gametitle.toString(),
                                             style: GoogleFonts.pTSans(
                                                fontSize:20,
                                                  fontWeight: FontWeight.w800
                                                        ),
                                                ),
                                        ),
                                        Hero(
                                          tag:"hero1",
                                            child: Container(
                                            width: MediaQuery.of(context).size.width/1.01,
                                             child: Card(
                                               elevation: 100,
                                               child: Image.memory(e.imggg,fit: BoxFit.cover,)),
                                           ),
                                        ),
                                      ],
                                    ),
                                  );
                                 }).toList(),
                                  options: CarouselOptions(
                                         autoPlay:true,
                                            autoPlayInterval:Duration(seconds:5),
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            viewportFraction: 1.0
                                      ),),
                             ),
                           
                         ),


                                                 Row(children: <Widget>[
                   
                                               Padding(
                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                               child: Center(child: Text("Windows/Pc",
                                                        style: GoogleFonts.pTSans(
                                                   fontSize:30,
                                               fontWeight: FontWeight.w600
                                                        ),
                                                     ),
                                              
                                                    ),
                                                  ),
                                                     Icon(Icons.computer)
                                                       ],),
 
                                 




                          Padding(
                           padding: const EdgeInsets.only(top:10),
                             
                               child: Container(
                               child: CarouselSlider(
                                 items:pcmainui.map((e){
                                  return GestureDetector(
                                    onTap: (){Navigator.of(context).push(_createroute(e.imggg,e.gametitle.toString(),widget._username.toString()));},
                                   child: Wrap(
                                      children: <Widget>[
                                        Center(
                                          child: Text(e.gametitle.toString(),
                                             style: GoogleFonts.pTSans(
                                                fontSize:20,
                                                  fontWeight: FontWeight.w800
                                                        ),
                                                ),
                                        ),
                                        Hero(
                                          tag:"hero2",
                                            child: Container(
                                            width: MediaQuery.of(context).size.width/1.01,
                                             child: Card(
                                               elevation: 100,
                                               child: Image.memory(e.imggg,fit: BoxFit.cover,)),
                                           ),
                                        ),
                                      ],
                                    ),
                                  );
                                 }).toList(),
                                  options: CarouselOptions(
                                         autoPlay:true,
                                            autoPlayInterval:Duration(seconds:5),
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            viewportFraction: 1.0
                                      ),),
                             ),
                           
                         ),




                         Row(children: <Widget>[
                     
                   Padding(
                     padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
                     child: Center(
                      child: Text("Xbox:One",
                      style: GoogleFonts.pTSans(
                        fontSize:30,
                        fontWeight: FontWeight.w600
                      ),
                      )
                     ),
                   ),
                   Icon(MaterialIcons.gamepad)

                  ],),












                         Padding(
                           padding: const EdgeInsets.only(top:10),
                             
                               child: Container(
                               child: CarouselSlider(
                                 items:xboxmainui.map((e){
                                  return GestureDetector(
                                    onTap: (){Navigator.of(context).push(_createroute(e.imggg,e.gametitle.toString(),widget._username.toString()));},
                                   child: Wrap(
                                      children: <Widget>[
                                        Center(
                                          child: Text(e.gametitle.toString(),
                                             style: GoogleFonts.pTSans(
                                                fontSize:20,
                                                  fontWeight: FontWeight.w800
                                                        ),
                                                ),
                                        ),
                                        Hero(
                                          tag:"hero3",
                                            child: Container(
                                            width: MediaQuery.of(context).size.width/1.01,
                                             child: Card(
                                               elevation: 100,
                                               child: Image.memory(e.imggg,fit: BoxFit.cover,)),
                                           ),
                                        ),
                                      ],
                                    ),
                                  );
                                 }).toList(),
                                  options: CarouselOptions(
                                         autoPlay:true,
                                            autoPlayInterval:Duration(seconds:5),
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            viewportFraction: 1.0
                                      ),),
                             ),
                           
                         ),
                         
                         
                                    ],)
                                  );
                             });
                             
                             
                             }




                    if(desision==1)
                    {
                      final double wid=MediaQuery.of(context).size.width;
                      return  Column(
           children: <Widget>[
             Padding(
               padding: const EdgeInsets.only(top:30,bottom:20),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Padding(
                     padding: const EdgeInsets.only(left:30),
                     child: Align(
                       alignment: Alignment.center,
                                        child: Text("UTS CHAT",
           style: GoogleFonts.pTSans(
               fontSize:20,
               fontWeight:FontWeight.w700
           ),
           ),
                     ),
                   ),



                   Padding(
                     padding: const EdgeInsets.only(right:30),
                     child: Row(
                       children: <Widget>[
                         Align(
                           alignment: Alignment.centerRight,
                                            
                            
                             child: StreamBuilder(
                               stream:  FirebaseDatabase.instance.reference().child("users/userdetails/"+widget._username.toString()+"/friendrequest").onValue,

                               builder: (context, snap) {
                                
                                 if(snap.hasData && !snap.hasError && snap.data.snapshot.value != null)
                                 {
                                   Icon _icn=Icon(MaterialCommunityIcons.bell_alert,color: Colors.redAccent[700],);
                                  return NootifyIcon(widget._username.toString(),_icn);
                                 }
                                  Icon _icn=Icon(MaterialCommunityIcons.bell,color: Color.fromRGBO(39, 47, 55,1),);
                                 return NootifyIcon(widget._username.toString(),_icn);
                               }
                             ),
                           
                         ),
                         Align(
                           alignment: Alignment.centerRight,
                                          
                             
                             child: AddFriend(widget._username.toString()),
                           
                         ),
                       ],
                     ),
                   )
                 ],
               ),
             ),
             Chatui(widget._username)
           ],
         );
                    }

             if(desision==2)
             {
               return Settings();
             }


           }
           
           
         )
           
        





    
    );
  }      
       /*if(index==1)
       {
         return Scaffold(
      backgroundColor: Color.fromRGBO(248,220,4,1),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Color.fromRGBO(39, 47, 55,1),
        circleColor: Colors.white,
        textColor: Colors.white,
        inactiveIconColor: Colors.white,
        initialSelection: index,
        activeIconColor: Colors.black,
        //initialSelection: 3,
        tabs: [
          TabData(iconData: MaterialCommunityIcons.home,title: 'Home'),
          TabData(iconData: MaterialCommunityIcons.chat,title: 'Chat'),
          TabData(iconData: MaterialCommunityIcons.trophy_award, title: 'Progress'),
          TabData(iconData: MaterialCommunityIcons.settings, title: 'Settings'),
          
        ], 
        onTabChangedListener: (d){
          print(d.toString());
          setState(() {
            index=d;
          });
        }),
         
         appBar: AppBar(
           backgroundColor:Color.fromRGBO(39, 47, 55,1),
           title: Text("UTS CHAT",
           style: GoogleFonts.pTSans(
             fontSize:20,
             fontWeight:FontWeight.w700
           ),
           ),
           actions: <Widget>[
             NootifyIcon(widget._username.toString())
           ],
         ),
         


         body: Column(
           children: <Widget>[
             SizedBox(height:40 ,),
             Chatui(widget._username)
           ],
         )

    );
       }
       if(index==2)
       {
         return Scaffold(
           
      backgroundColor: Color.fromRGBO(248,220,4,1),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Color.fromRGBO(39, 47, 55,1),
        circleColor: Colors.white,
        textColor: Colors.white,
        inactiveIconColor: Colors.white,
        initialSelection: index,
        activeIconColor: Colors.black,
        //initialSelection: 3,
        tabs: [
          TabData(iconData: MaterialCommunityIcons.home,title: 'Home'),
          TabData(iconData: MaterialCommunityIcons.chat,title: 'Chat'),
          TabData(iconData: MaterialCommunityIcons.trophy_award, title: 'Progress'),
          TabData(iconData: MaterialCommunityIcons.settings, title: 'Settings'),
          
        ], 
        onTabChangedListener: (d){
          print(d.toString());
          setState(() {
            index=d;
          });
        }),



         body: Container(
           child:Text(index.toString())
         )

    );
       }
       if(index==3)
       {
         return Scaffold(
      backgroundColor: Color.fromRGBO(248,220,4,1),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Color.fromRGBO(39, 47, 55,1),
        circleColor: Colors.white,
        textColor: Colors.white,
        inactiveIconColor: Colors.white,
        initialSelection: index,
        activeIconColor: Colors.black,
        //initialSelection: 3,
        tabs: [
          TabData(iconData: MaterialCommunityIcons.home,title: 'Home'),
          TabData(iconData: MaterialCommunityIcons.chat,title: 'Chat'),
          TabData(iconData: MaterialCommunityIcons.trophy_award, title: 'Progress'),
          TabData(iconData: MaterialCommunityIcons.settings, title: 'Settings'),
          
        ], 
        onTabChangedListener: (d){
          print(d.toString());
          setState(() {
            index=d;
          });
        }),



         body: Container(
           child:Text(index.toString())
         )

    );
       }
        


    
    
  }*/
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Route _createroute(Uint8List img,String ss,String _username)
{
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation)=>Dummy(img,ss.toString(),_username.toString()),
     transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return new ScaleTransition(
            scale: new Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Interval(
                    0.00,
                    0.50,
                    curve: Curves.linear,
                  ),
                ),
              ),
            child: ScaleTransition(
                     scale: Tween<double>(
                       begin: 1.5,
                       end: 1.0,
                     ).animate(
                       CurvedAnimation(
                         parent: animation,
                         curve: Interval(
                           0.50,
                           1.00,
                           curve: Curves.linear,
                         ),
                       ),
                     ),
                     child: child,
                   ),
           );
         }
  );
}