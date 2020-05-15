import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainLogoPage extends StatefulWidget {
  @override
  _MainLogoPageState createState() => _MainLogoPageState();
}

class _MainLogoPageState extends State<MainLogoPage>{

/*static int loggedin=0;
void login_checkup()async
{
  SharedPreferences pre= await SharedPreferences.getInstance();
  if(pre.containsKey('logged_in_as')){
    setState(() {
      loggedin=1;
    });
  }
}

void reseting()async
{
    SharedPreferences pre= await SharedPreferences.getInstance();
  setState(() {
    pre.remove('logged_in_as');
  });
}*/



  @override
  Widget build(BuildContext context) {
     if(true)
    {
      return  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      
          
          
                      child: Stack(
              children: <Widget>[
                Align(
                  //top: MediaQuery.of(context).size.height-450,
                  alignment: Alignment(1.05, -0.4),
                  child: Image.asset('images/1.png',
                  filterQuality: FilterQuality.high,
                  width: MediaQuery.of(context).size.width-((50/100)*MediaQuery.of(context).size.width),
                  height: MediaQuery.of(context).size.height-((50/100)*MediaQuery.of(context).size.height),
                  )
                  ),
                   
                  Align(
                    alignment: Alignment(0.8, 0),
                    child: Text('YOU BECOME',
                      style: TextStyle(color:Colors.black,
                      fontSize:20,
                      fontStyle:FontStyle.italic,
                      fontWeight: FontWeight.w800
                      )
                    
                    )
                    ),
                   
                   Align(
                    alignment: Alignment(0.8, 0.1),
                    child: Text('WHAT YOU BELIVE',
                    style: TextStyle(color:Colors.black,
                      fontSize:15,
                      fontStyle:FontStyle.italic,
                      fontWeight: FontWeight.w800
                    ),
                    )
                    ),
                   
                 /* Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CupertinoPopupSurface(
                                              child: Container(
                          height: MediaQuery.of(context).size.height-((70/100)*MediaQuery.of(context).size.height),
                          width: MediaQuery.of(context).size.width,
                          
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              
                              CupertinoButton(child: Text('LOGIN'), onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                               // login_checkup();
                                
                              },
                              color: Colors.blue,
                              
                              ),
                              Row(// crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Not a User?:',),
                                  FlatButton(child: Text('Register'),onPressed: (){},)
                                ],
                              ) 
                            ],
                          ),
                        ),
                      ),
                    ],
                  )*/
                   
              ],
            ),
         );
    }else{
      return Scaffold(
        appBar: AppBar(),
        body: FlatButton(onPressed: (){}, child: Text('RESET')),
      );
    }
  }
}