import 'dart:math';

import 'package:fire/gamediscription.dart';
import 'package:fire/gamename.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Dummy extends StatelessWidget {
 final Image temp;
 final String _nameofgame;
 final String _currentusername;
 Dummy(this.temp,this._nameofgame,this._currentusername);



 Future<Widget>_load(String s,int i)async
  {
  // print(s);
  // print("$s/"+i.toString()+".jpg");
    Image m;
    await FirebaseStorage.instance.ref().child("$_nameofgame/"+i.toString()+".jpg").getDownloadURL().then((ov){
      m=Image.network(ov.toString(),fit:BoxFit.fitHeight);
      
    });
    return m;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(248,220,4,1),
      body:SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Stack(
          children: <Widget>[
            
            Container(
              child:CarouselSlider(
                           
                   items: [1,2,3,4].map((i) {
                            return Builder(
                       builder: (BuildContext context) {
                          return 
                        FutureBuilder(
                           future: _load(i.toString(),i),
                           builder: (context,snapshot){
                             if(snapshot.connectionState==ConnectionState.waiting)
                             {
                               return LinearProgressIndicator(
                                 backgroundColor: Colors.transparent,
                                 value: 0.0,
                               );
                             }
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              child:snapshot.data
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
            ),






            Padding(
              padding: EdgeInsets.fromLTRB(10, 100, 0, 0),
              child: Align(
          alignment: Alignment.topLeft,
          child:Hero(
              tag:"hero1",
               
                child:Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  height: MediaQuery.of(context).size.height/4.5,
                  
                    //color: Colors.white ,
                    child: temp,
                 
                )
              
          )
        ),
            ),



             




        ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GameName(_nameofgame.toString().toUpperCase()),
          )
          ),
          Padding(
            padding: const EdgeInsets.only(top:30),
            child: FutureBuilder(
              future: null,
              builder: (context,snap){
              return GameDiscreption(_currentusername.toString());
            }
            
            ),
          )

          ],
        ),
      )
    );
    
  }
}