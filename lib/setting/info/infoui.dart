import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class InfoUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248,220,4,1),
        title:Text("About",
        style: GoogleFonts.pTSans(
                                      //fontSize:10,
                                      fontWeight: FontWeight.w600,
                                          color:Colors.black87
                                       ),
        )
      ),
      backgroundColor: Color.fromRGBO(39, 47, 55,1),
      body: SingleChildScrollView(
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:20),
                child: Text("UTS",
                style: GoogleFonts.pTSans(
                                            fontSize:30,
                                            fontWeight: FontWeight.w600,
                                                color:Colors.white70
                                             ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("Unite Through e-Sports",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("This app is made inorder to make people ",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
            Text("connect throughout the world through",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("e-Sports",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("Know the people who are playing",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
            Text("your desire game and simply chat",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("with them share your game details",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("so that you can connect in game",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("and enjoy.",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("your personal details like your",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
            Text("email,phone-no,password will not ",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("shown",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("Support",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
            Text("any querys contact:",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("Email : shanawaz0891@gmail.com",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("Whatsapp:7780328593",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("Info",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10),
              child: Text("About",
              style: GoogleFonts.pTSans(
                                          //fontSize:10,
                                          fontWeight: FontWeight.w600,
                                              color:Colors.white70
                                           ),
              ),
            ),
            Text("Dev - M.A.Shanawaz",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
            Text("Made with Flutter",
            style: GoogleFonts.pTSans(
                                        //fontSize:10,
                                        fontWeight: FontWeight.w600,
                                            color:Colors.white70
                                         ),
            ),
          ],
        ),
      )
    );
  }
}