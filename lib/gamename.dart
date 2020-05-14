import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameName extends StatefulWidget {
  final String _gamename;
  GameName(this._gamename);
  @override
  _GameNameState createState() => _GameNameState();
}

class _GameNameState extends State<GameName> with SingleTickerProviderStateMixin {

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

  @override
 /* void dispose() {
    animController.reset();
    animController.stop();
    super.dispose();
  }*/






  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: animController.value,
      duration: Duration(seconds: 1),
      curve: Curves.easeInQuint,
      child: Text(widget._gamename,
                  style: GoogleFonts.pTSans(
                    fontSize:30,
                    fontWeight: FontWeight.w600
                  ),
                  )

    );
  }
}