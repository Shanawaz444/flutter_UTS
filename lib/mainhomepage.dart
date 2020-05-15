import 'dart:math';
import 'package:fire/chatui/chatui.dart';
import 'package:fire/dummy.dart';
import 'package:fire/notificationsui/notificationiconfunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  final String _username;
  const HomePage(this._username);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   static int index;
  TextEditingController _searchGame;
  List<dynamic>_list;
  List<dynamic>_winlist;
  List<dynamic>_xbox;
  void initState()
  {
  super.initState();
  _searchGame=new TextEditingController();
  index=0;
  print(widget._username);
  }
  Future<List> hfhfh(String s)async
  {
     await FirebaseDatabase.instance.reference().child(s).once().then((oo){
       _list=oo.value;
   print(oo.value);
 });
 return _list;
  }
  Future<List> hfhffh(String s)async
  {
     await FirebaseDatabase.instance.reference().child(s).once().then((oo){
       _winlist=oo.value;
  // print(oo.value);
 });
 return _winlist;
  }
  Future<List> _xbob_fun(String s)async
  {
     await FirebaseDatabase.instance.reference().child(s).once().then((oo){
       _xbox=oo.value;
  // print(oo.value);
 });
 return _xbox;
  }
  Future<List> winimages()async
  {
     await FirebaseDatabase.instance.reference().child("users/mainmenuimageswindows").once().then((oo){
       _winlist=oo.value;
  // print(oo.value);
 });
 return _winlist.toList();
  }
  Future<Widget>_load(String s,int i)async
  {
  // print(s);
  // print("$s/"+i.toString()+".jpg");
    Image m;
    await FirebaseStorage.instance.ref().child("$s/"+i.toString()+".jpg").getDownloadURL().then((ov){
      m=Image.network(ov.toString(),fit:BoxFit.fitHeight);
      
    });
    return m;
  }
  @override
  Widget build(BuildContext context) {
       if(index==0)
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



         body: SingleChildScrollView(
            
          child:Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child:
                   Card(
                     color:Color.fromRGBO(39, 47, 55,1) ,
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                       child: TextFormField(
                         controller: _searchGame,
                         decoration: InputDecoration(
                           labelText:"Search",
                           labelStyle:TextStyle(color:Color.fromRGBO(248,220,4,1),)
                         ),
                         style:TextStyle(color: Colors.white)
                       ),
                     ),
                   )
                ),
              ),

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

               
               FutureBuilder(
                 future:hfhfh("mobilegames"),
                 builder: (context,snp){
                   if(snp.connectionState==ConnectionState.waiting)
                   {
                     return Center(child:Container(
                       height: 101,
                       width: 101,
                       child: Image.asset("images/loding.gif")));
                   }
                     return 
                       
                  Container(
                    //height: MediaQuery.of(context).size.height/1.0,
                    child: CarouselSlider(
                         
                 items: _list.map((i) {
                          return Builder(
                     builder: (BuildContext context) {
                        return 
                      FutureBuilder(
                         future: _load(i.toString(),1),
                         builder: (context,snapshot){
                           if(snapshot.connectionState==ConnectionState.waiting)
                           {
                             return LinearProgressIndicator(
                               backgroundColor: Colors.transparent,
                               value: 0.0,
                             );
                           }
                          return GestureDetector(
                            onTap: (){
                              print(i);
                              Navigator.of(context).push(_createroute(snapshot.data,i,widget._username.toString()));
                             
                            },
                                    child: Container(
                              
                                    child:Wrap(
                                    children:<Widget>[
                                         Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                   child: Text(i.toString(),
                   style: GoogleFonts.pTSans(
                      fontSize:20,
                      fontWeight: FontWeight.w400
                    ),
                   ),
                 ),
               ),
                                        Hero(
                                          tag:"hero1",
                                          child: snapshot.data,
                                          )
                                      ]
                                    )
                                 
                            ),
                          );
                     }
                     
                     );
                     
                },
             );
                }).toList(),
                //a list to the builder
                
                options: CarouselOptions(
                   // autoPlay:true,
                    autoPlayInterval:Duration(seconds:Random(6).nextInt(10)),
                    autoPlayCurve: Curves.easeInCirc,
                 // height: MediaQuery.of(context).size.height/3,
                    viewportFraction: 1.0
                ),
             ),
                  );
               
               }),
            

           /*Center(child: FlatButton(onPressed:(){hfhfh();}, child: Text("sasasas")))*/

             Padding(
               padding: const EdgeInsets.only(top:20),
               child: Divider(),
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




         FutureBuilder(
                 future:hfhffh("pcgames"),
                 builder: (context,snp){
                   if(snp.connectionState==ConnectionState.waiting)
                   {
                     return Center(child: CircularProgressIndicator());
                   }
                     return 
                       
                  Container(
                    //height: MediaQuery.of(context).size.height/1.0,
                    child: CarouselSlider(
                         
                 items: _winlist.map((i) {
                          return Builder(
                     builder: (BuildContext context) {
                        return 
                      FutureBuilder(
                         future: _load(i.toString(),1),
                         builder: (context,snapshot){
                           if(snapshot.connectionState==ConnectionState.waiting)
                           {
                             return LinearProgressIndicator(
                               backgroundColor: Colors.transparent,
                               value: 0.0,
                             );
                           }
                          return GestureDetector(
                            onTap: (){
                              print(i);
                               Navigator.of(context).push(_createroute(snapshot.data,i,widget._username.toString()));
                            },
                                    child: Container(
                              
                                    child:Wrap(
                                    children:<Widget>[
                                         Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                   child: Text(i.toString(),
                   style: GoogleFonts.pTSans(
                      fontSize:20,
                      fontWeight: FontWeight.w400
                    ),
                   ),
                 ),
               ),
                                       
                                  Hero(
                                    tag:"slideimagebgn",
                                    child: snapshot.data,
                                    ),
                                      ]
                                    )
                                 
                            ),
                          );
                     }
                     
                     );
                     
                },
             );
                }).toList(),
                //a list to the builder
                
                options: CarouselOptions(
                    //autoPlay:true,
                    autoPlayInterval:Duration(seconds:Random(6).nextInt(10)),
                    autoPlayCurve: Curves.easeInCirc,
                 // height: MediaQuery.of(context).size.height/3,
                    viewportFraction: 1.0
                ),
             ),
                  );
               
               }),
               
                 FlatButton(color: Colors.black,onPressed: (){setState(() {
                   
                 });}, child:Text("dsdsdsd")),
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
              FutureBuilder(
                 future:_xbob_fun("xbox"),
                 builder: (context,snp){
                   if(snp.connectionState==ConnectionState.waiting)
                   {
                     return Center(child: CircularProgressIndicator());
                   }
                     return 
                       
                  Container(
                    //height: MediaQuery.of(context).size.height/1.0,
                    child: CarouselSlider(
                         
                 items: _xbox.map((i) {
                          return Builder(
                     builder: (BuildContext context) {
                        return 
                      FutureBuilder(
                         future: _load(i.toString(),1),
                         builder: (context,snapshot){
                           if(snapshot.connectionState==ConnectionState.waiting)
                           {
                             return LinearProgressIndicator(
                               backgroundColor: Colors.transparent,
                               value: 0.0,
                             );
                           }
                          return GestureDetector(
                            onTap: (){
                              print(i);
                               Navigator.of(context).push(_createroute(snapshot.data,i,widget._username.toString()));
                            },
                                    child: Container(
                              
                                    child:Wrap(
                                    children:<Widget>[
                                         Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                   child: Text(i.toString(),
                   style: GoogleFonts.pTSans(
                      fontSize:20,
                      fontWeight: FontWeight.w400
                    ),
                   ),
                 ),
               ),
                                       
                                        snapshot.data,
                                      ]
                                    )
                                 
                            ),
                          );
                     }
                     
                     );
                     
                },
             );
                }).toList(),
                //a list to the builder
                
                options: CarouselOptions(
                   // autoPlay:true,
                    autoPlayInterval:Duration(seconds:Random(6).nextInt(10)),
                    autoPlayCurve: Curves.easeInCirc,
                 // height: MediaQuery.of(context).size.height/3,
                    viewportFraction: 1.0
                ),
             ),
                  );
               
               }),
               

          /* Card(
                 color: Color.fromRGBO(248,220,4,1),
                 child:Column(
                   children:<Widget>[
                     Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("PUBG(player unknown battlegrounds)"),
               ),

                CarouselSlider(
                     
                 items: [1,2,3,4,5].map((i) {
                      return Builder(
                   builder: (BuildContext context) {
                    return Container(
                     width: MediaQuery.of(context).size.width,
                     margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                       color: Colors.amber
                  ),
             child: Image.asset("images/bkgrnd.png",fit: BoxFit.cover,)
                   );
                },
             );
                }).toList(),
                //a list to the builder
                
                options: CarouselOptions(
                  autoPlay:true,
                  autoPlayInterval:Duration(seconds:3),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
             ),
                   ]
                 )
               ),*/



          ],
          )
                 ),
        





    
    );
       }
       if(index==1)
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
        


    
    
  }
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Route _createroute(Image img,String ss,String _username)
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