import 'package:flutter/material.dart';

import 'mainLOGOPAGE.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:InheritingBegin(),
    );
  }
}
class InheritingBegin extends StatefulWidget
{
  @override
  _InheritingBeginState createState() => _InheritingBeginState();
}

class _InheritingBeginState extends State<InheritingBegin> with SingleTickerProviderStateMixin{
  AnimationController animController1;


  static int r=238,b=6,g=6;
  Animation<double> animation1;
  

void initState() {
  super.initState();
  animController1 = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  );

    Tween<double>(
    begin: 0,
    end: 9999 ,
  ).animate(animController1)
    ..addListener(() {
      // Empty setState because the updated value is already in the animation field
      setState(() {
        if(r==238&&b<238&&g==6)
        {
          b=b+2;
        }else
        {
          if(r>6&&b>=238&&g==6)
        {
          r=r-2;
        }
        else{
          if(r<=6&&b>=238&&g<=238)
        {
          g=g+2;
        }
        else{
          r=238;
          b=6;
          g=6;
        }
        }
        }
      });
    })
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
        /*if(r==238&&b<238&&g==6)
        {
          b=b+100;
        }else
        {
          if(r>6&&b>=238&&g==6)
        {
          r=r-100;
        }
        else{
          if(r<=6&&b>=238&&g<=238)
        {
          g=g+100;
        }
        else{
          r=238;
          b=6;
          g=6;
        }
        }
        }*/
     });
      
      /*i=i+1;
      if(i==2)
      {
        animController.dispose();
      }*/
      animController1.repeat();
      } else if (status == AnimationStatus.dismissed) {
        animController1.forward();
      }
    });
    
  animController1.forward();
}
  @override
  void dispose() {
    animController1.reset();
    animController1.stop();
    super.dispose();
  }





















 
  @override
  Widget build(BuildContext context) {

      return Scaffold(
      backgroundColor:Color.fromRGBO(r, g, b, 1),
      body:DecoratedBox(
        position: DecorationPosition.background,
        
        decoration: BoxDecoration(

          image: DecorationImage(image: AssetImage('images/fitness.png'),
          fit: BoxFit.fill
          )

        
      ),

      child:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Card(
              color:Color.fromRGBO(r, g, b, 1),
              child:Container(
                width: MediaQuery.of(context).size.width-(5*MediaQuery.of(context).size.width/100),
                height: MediaQuery.of(context).size.height-(75*MediaQuery.of(context).size.height/100),
              
                  
                 child: Container(
                   width: MediaQuery.of(context).size.width-(5*MediaQuery.of(context).size.width/100),
                height: MediaQuery.of(context).size.height-(75*MediaQuery.of(context).size.height/100),
                   child: Card(
                     color: Color.fromRGBO(39, 47, 55, 1),
                                        child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(2.0),
                         child: Center(child: Text("AlREADY A USER")),
                       ),
                       FlatButton(onPressed: (){}, child: Text("LOGIN"),shape:RoundedRectangleBorder(
                         borderRadius:BorderRadius.circular(20)
                       
                       ),
                       color: Colors.yellow,
                       ),
                        Padding(
                         padding: const EdgeInsets.all(2.0),
                         child: Center(child: Text("NO! not a problem")),
                       ),
                        FlatButton(onPressed: (){}, child: Text("Regester"),shape:RoundedRectangleBorder(
                         borderRadius:BorderRadius.circular(20)
                         
                       ),
                       color: Colors.yellow,
                       ),

                      ],),
                   ),
                 )
                
              )
            )
        ],),
      ), 
      
      )
      
      
    );
    
   
}
}