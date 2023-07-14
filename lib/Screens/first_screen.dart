import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quaiz_app/Components/circles.dart';
import 'package:quaiz_app/Components/firstpart_first.dart';
import 'package:quaiz_app/Components/secondpart_first.dart';


class FirstScreen extends StatelessWidget{
  @override
  
  Widget build(BuildContext context) {
    final Circless c=Circless();
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Stack(
            children: [
                        Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.57),
            child: SecondPart()),
              FirstPasrt(),
        for(Widget x in c.l)
           x, 
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,left: MediaQuery.of(context).size.width*0.35),
            child: Text('Quizles',
            style: GoogleFonts.aBeeZee(
              fontSize: 40,
              color: Colors.green[700],
              fontWeight: FontWeight.bold
            )
            ),
          ),

            ],
          ),
        ],
      ),
    );
  }
}