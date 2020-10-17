import 'package:fire/login_animation.dart';
import 'package:fire/loginui.dart';
import 'package:fire/mainhomepage.dart';
import 'package:fire/registeranimation.dart';
import 'package:fire/registerui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
class InheritingBegin extends StatefulWidget
{
  @override
  _InheritingBeginState createState() => _InheritingBeginState();
}

class _InheritingBeginState extends State<InheritingBegin> with SingleTickerProviderStateMixin{
 
  

  AnimationController animController1;


  static int r=238,b=6,g=6;
  Animation<double> animation1;
  
String errorMessage;
void initState() {
  super.initState();
 _con();
  errorMessage=null;
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
 
 Future<void>_con()async
 {
 SharedPreferences _inst = await SharedPreferences.getInstance();
  if(_inst.containsKey("username")==true)
  {
     Navigator.pushAndRemoveUntil(
                                                    context,
                                                     MaterialPageRoute(builder: (context) => HomePage(_inst.get("username").toString())),
                                                    (Route<dynamic> route) => false,
                                                   );
  }
 }

















 


  @override
  Widget build(BuildContext context) {
      
        return Scaffold(
      backgroundColor:Color.fromRGBO(39, 47, 55,1),
      body:DecoratedBox(
        position: DecorationPosition.background,
        
        decoration: BoxDecoration(

          image: DecorationImage(image: AssetImage('images/bkgrnd.png'),
          fit: BoxFit.fill
          )

        
      ),

      child:
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            
            Card(
              elevation: 10,
              shape: CircleBorder(
              ),
              color:Color.fromRGBO(r, g, b, 1),
              child:Container(
                width: MediaQuery.of(context).size.width+(5*MediaQuery.of(context).size.width/100),
                height: MediaQuery.of(context).size.height-(70*MediaQuery.of(context).size.height/100),
              
                  
                 child: Container(
                   width: MediaQuery.of(context).size.width-(5*MediaQuery.of(context).size.width/100),
                height: MediaQuery.of(context).size.height-(70*MediaQuery.of(context).size.height/100),
                   child: Card(
                     shape: CircleBorder(),
                     color: Color.fromRGBO(39, 47, 55, 1),
                                        child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         //removed the text "already user"
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Container(
                           color: Color.fromRGBO(39, 47, 55, 1),
                           child: FlatButton(
                             shape:RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
 
),
                             color: Color.fromRGBO(248,220,4,1),
                             onPressed: (){
                               Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Loginui();
          }),
        );
                           }, child:Text("Login",
                           
                           style: GoogleFonts.pTSans(
                                              
                                              fontSize: 15
                                            ),)))
                       ),
                        //removed the text no not a problem
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                           color: Color.fromRGBO(39, 47, 55, 1),
                           child: FlatButton(
                             shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(18.0),
  
),
                             color: Color.fromRGBO(248,220,4,1),
                             onPressed: (){
                               Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Regui();
          }),
        );
                           }, child:Text("Register",
                           
                           style: GoogleFonts.pTSans(
                                              
                                              fontSize: 15
                                            ),)))
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


/*_buildBuyTicketButton() {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8),
      child: BuyButton(),
    );
  }
}*/



}