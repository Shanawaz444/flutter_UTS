import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';


import 'training_progress_list_build.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void hfhfh()
  {
    
  }
  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).orientation==Orientation.portrait){
      double height=MediaQuery.of(context).size.height;
        return Scaffold(
      backgroundColor: Color.fromRGBO(248,220,4,1),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Color.fromRGBO(39, 47, 55,1),
        circleColor: Colors.white,
        textColor: Colors.white,
        inactiveIconColor: Colors.white,
        activeIconColor: Colors.black,
        //initialSelection: 3,
        tabs: [
          TabData(iconData: MaterialCommunityIcons.home,title: 'Home'),
          TabData(iconData: MaterialCommunityIcons.trophy,title: 'Activities'),
          TabData(iconData: MaterialCommunityIcons.bell_alert, title: 'Progress'),
          TabData(iconData: MaterialCommunityIcons.food, title: 'Dite'),
          
        ], 
        onTabChangedListener: (d){}),



         body: SingleChildScrollView(

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            
            Container(
              width: MediaQuery.of(context).size.width,
              height: height-((75/100)*height),
              child: Card(
                color: Color.fromRGBO(39, 47, 55,1),
                    
                           child:Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: ClipOval(
                                      child: Icon(
                                     MaterialCommunityIcons.face_profile,
                                     size: (MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)-((99.97/100)*(MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)),
                                     color: Colors.white,
                                     ),
                                 ),
                               ),
                               IconButton(
                                 icon: Icon(MaterialCommunityIcons.logout,
                               size: (MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)-((99.97/100)*(MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)),
                              color: Colors.white,),
                              onPressed: (){
                                setState(() {
                                Navigator.pop(context);
                                
                                
                                });
                              },
                               ),
                               
                             ],
                           ),
                             
                
              ),
            ),
           

           
           
           
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height:height-((90/100)*height),
            ),
            


            Training_progress_list_build(),

                

                 Container(
                           width: MediaQuery.of(context).size.width,
                           height: height-((70/100)*height),  
                           //color: Colors.black,
                           child: ListView(
                             scrollDirection: Axis.horizontal,
                                       
                              children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),


                              ],

                           ),
                              margin: EdgeInsets.only(bottom:30),

                 ),
                 


                 Container(
                           width: MediaQuery.of(context).size.width,
                           height: height-((70/100)*height),  
                           //color: Colors.black,
                           child: ListView(
                             scrollDirection: Axis.horizontal,
                                       
                              children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),


                              ],

                           ),
                    
                         margin: EdgeInsets.only(bottom:30),
                 ),




                 Container(
                           width: MediaQuery.of(context).size.width,
                           height: height-((70/100)*height),  
                           //color: Colors.black,
                           child: ListView(
                             scrollDirection: Axis.horizontal,
                                       
                              children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-30,
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),


                              ],

                           ),
                    
                   margin: EdgeInsets.only(bottom:30),
                 ),



                  ],
                  )

                 ),
        





    
    );


    }else{
      double height=MediaQuery.of(context).size.height;
       print(MediaQuery.of(context).devicePixelRatio);
       return Scaffold(
      backgroundColor: Color.fromRGBO(248,220 , 4, 1),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Color.fromRGBO(39, 47, 55,1),
        circleColor: Colors.white,
        textColor: Colors.white,
        inactiveIconColor: Colors.white,
        activeIconColor: Colors.black,
        //initialSelection: 3,
        tabs: [
          TabData(iconData: MaterialCommunityIcons.home,title: 'Home'),
          TabData(iconData: MaterialCommunityIcons.dumbbell, title: 'Fitness'),
          TabData(iconData: MaterialCommunityIcons.bell_alert, title: 'Progress'),
          TabData(iconData: MaterialCommunityIcons.food, title: 'Dite'),
          
        ], 
        onTabChangedListener: (d){}),



         body: SingleChildScrollView(

          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            
            Container(
              width: MediaQuery.of(context).size.width,
              height: height-((50/100)*height),
              child: Card(
                color: Color.fromRGBO(39, 47, 55,1),
                    
                           child:Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: <Widget>[
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: ClipOval(
                                      child: Icon(
                                     MaterialCommunityIcons.face_profile,
                                     size: (MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)-((99.97/100)*(MediaQuery.of(context).size.width*MediaQuery.of(context).size.height)),
                                     color: Colors.white,
                                     ),
                                 ),
                               ),
                             ],
                           ),
                             
                
              ),
            ),
           

           
           
           
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height:height-((90/100)*height),
            ),
            


            Training_progress_list_build(),

                

                 Container(
                           width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.height-((40/100)*MediaQuery.of(context).size.height),  
                           //color: Colors.black,
                           child: ListView(
                             scrollDirection: Axis.horizontal,
                                       
                              children: <Widget>[

                              Padding(  
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),


                              ],

                           ),
                              margin: EdgeInsets.only(bottom:30),

                 ),
                 


                 Container(
                           width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.height-((40/100)*MediaQuery.of(context).size.height),  
                           //color: Colors.black,
                           child: ListView(
                             scrollDirection: Axis.horizontal,
                                       
                              children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                           //height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),


                              ],

                           ),
                    
                         margin: EdgeInsets.only(bottom:30),
                 ),




                 Container(
                           width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.height-((40/100)*MediaQuery.of(context).size.height),  
                           //color: Colors.black,
                           child: ListView(
                             scrollDirection: Axis.horizontal,
                                       
                              children: <Widget>[

                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                   
                                   child:  SizedBox(
                                           width:MediaQuery.of(context).size.width-((30/100)*MediaQuery.of(context).size.width),
                                          // height:MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                                           ),
                                   
                                ),
                              ),


                              ],

                           ),
                    
                   margin: EdgeInsets.only(bottom:30),
                 ),



                  ],
                  )

                 ),
        





    
    );



    }
    
  }
}