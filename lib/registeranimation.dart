import 'package:fire/registerui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginui.dart';
class Registerbutton extends StatefulWidget {
  @override
  _RegisterbuttonState createState() => _RegisterbuttonState();
}

class _RegisterbuttonState extends State<Registerbutton> with TickerProviderStateMixin {
  String _buttonText = 'REGISTER';

  AnimationController _controller;
  Animation _roundnessAnimation;
  Animation _widthAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    )..addListener(() {
        setState(() {});
      });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _buttonText="REGISTER";
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Regui();
          }),
        );
      }
    });

    _roundnessAnimation = Tween(begin: 20.0, end: 25.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));

    _widthAnimation = Tween(begin: 100.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromRGBO(39, 47, 55, 1),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonText = '';
            //Starts animation
            _controller.forward();
          });
        },
        child: Hero(
          tag: 'RegisterBox',
          flightShuttleBuilder: (
            BuildContext flightContext,
            Animation<double> animation,
            HeroFlightDirection flightDirection,
            BuildContext fromHeroContext,
            BuildContext toHeroContext,
          ) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(248,220,4,1),
                shape: BoxShape.circle,
              ),
            );
          },
          child: Container(
            width: _widthAnimation.value,
            decoration: BoxDecoration(
              color: Color.fromRGBO(248,220,4,1),
              borderRadius: BorderRadius.circular(_roundnessAnimation.value),
            ),
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              _buttonText,
              textAlign: TextAlign.center,
              style: GoogleFonts.pTSans(
                                            
                                              fontSize: 15,
                                              
                                            ),
             // style: kStyle,
            ),
          ),
        ),
      ),
    );
  }
}