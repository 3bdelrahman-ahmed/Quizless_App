import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quaiz_app/Screens/first_screen.dart';
import 'package:quaiz_app/Screens/levels_screen.dart';
import 'package:quaiz_app/Screens/validation_screen.dart';
import 'package:quaiz_app/Services/Sp_Services/cashe_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPart extends StatefulWidget{
  @override
  State<SecondPart> createState() => _SecondPartState();
}

class _SecondPartState extends State<SecondPart> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height*0.43,
    color: Color.fromARGB(255, 29, 16, 53),
    child: Column(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
            child: Text('Lets Play!',
            style: GoogleFonts.aBeeZee(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            )),
            const SizedBox  (height:   10,),
            Container(
            child: Text('Play Now and level UP :)',
            style: GoogleFonts.aBeeZee(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            )),
            GestureDetector(
             onTap: () {
              if(SharedPreferencesHelper.getData(key: 'k')[0]!=null)
               Navigator.push(context, MaterialPageRoute(builder: (context)=>LevelsScreen()));
               else
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ValidationScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03,left: MediaQuery.of(context).size.width*0.055),
                 width: MediaQuery.of(context).size.width*0.7,
              height: MediaQuery.of(context).size.height*0.08,
              decoration:  BoxDecoration(
                color: Colors.deepPurple,
                border: Border.all(color: Colors.deepPurple,width: 0.23),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)),
              
              ),
              alignment: Alignment.center,
              child: Text("Play Now",
              style: GoogleFonts.aBeeZee(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Null;
              },
              child: Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03,left: MediaQuery.of(context).size.width*0.055),
                 width: MediaQuery.of(context).size.width*0.7,
              height: MediaQuery.of(context).size.height*0.08,
              decoration:  BoxDecoration(
                color: Color.fromARGB(255, 29, 16, 53),
                border: Border.all(color: Colors.deepPurple,width: 0.8),
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)),
              
              ),
              alignment: Alignment.center,
              child: Text("About Us",
              style: GoogleFonts.aBeeZee(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              ),
              ),
            )
      ],
    ),
   );
  }
}

