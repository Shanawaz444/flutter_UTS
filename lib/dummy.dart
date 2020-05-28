import 'dart:math';
import 'dart:typed_data';
import 'package:fire/gamename.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Dummy extends StatelessWidget {
 final Uint8List temp;
 final String _nameofgame;
 final String _currentusername;
 Dummy(this.temp,this._nameofgame,this._currentusername);

final List<Image>imgs=[];

 Future<List<Image>>_load()async
  {
  // print(s);
  // print("$s/"+i.toString()+".jpg");
    for(int i=1;i<=4;i++)
    {
    Image m;
    await FirebaseStorage.instance.ref().child("$_nameofgame/"+i.toString()+".jpg").getDownloadURL().then((ov){
      m=Image.network(ov.toString(),fit:BoxFit.fitHeight);
      imgs.add(m); 
      //print("done");
    });
    }
    return imgs;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(248,220,4,1),
      body:
              Column(
          children: <Widget>[
            Stack(
          children: <Widget>[
            FutureBuilder(
                           future: _load(),
                           builder: (context,snapshot){
                             if(snapshot.connectionState==ConnectionState.waiting)
                             {
                               return LinearProgressIndicator(
                                 backgroundColor: Colors.transparent,
                                 value: 0.0,
                               );
                             }
                            return Container(
              child:CarouselSlider(
                           
                   items: imgs.map((i) {
                            return Builder(
                       builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              child:i
                            );
                        
                       
                  },
               );
                  }).toList(),
                  //a list to the builder
                  
                  options: CarouselOptions(
                      autoPlay:true,
                      autoPlayInterval:Duration(seconds:Random(6).nextInt(10)),
                      autoPlayCurve: Curves.easeInCirc,
                   // height: MediaQuery.of(context).size.height/3,
                      viewportFraction: 1.0
                  ),
               ), 
            );
                       }
                       
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
                    child: Image.memory(temp,fit: BoxFit.fitHeight,),
                 
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
         Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 47, 55,1),
                  borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
                
                ),
                
                child:StreamBuilder(builder:(context,snap){
                  return Center(child: Text("Sorry no one is active on \n this Game right now!",style: TextStyle(color:Colors.white),));
                },
              ),)
         ),
         Container(
           color: Color.fromRGBO(39, 47, 55,1),
           child: Center(
             child: FlatButton(
               color: Color.fromRGBO(248,220,4,1),
               onPressed: (){}, child: Text("Sorry in build process",style: TextStyle(color:Color.fromRGBO(39, 47, 55,1)))
               ),
           ),
         )

          ],
        ),
      
    );
    
  }
}