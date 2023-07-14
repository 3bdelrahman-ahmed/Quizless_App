import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quaiz_app/Services/Sp_Services/cashe_helper.dart';

import 'levels_screen.dart';

class ScoreScreen extends StatefulWidget{
  final int levelNum;
  ScoreScreen(this.levelNum, {super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color.fromARGB(255, 24, 7, 54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
               GestureDetector(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>LevelsScreen()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05),
                        alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width*0.07,
                      height: MediaQuery.of(context).size.height*0.05,
                      decoration:const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(200))
                      ),
                      child:const Icon(Icons.arrow_back,
                      color: Colors.white,
                      ),
                      ),
                    ),
                    SizedBox(width: 108,),
                    DefaultTextStyle(style: GoogleFonts.aBeeZee(
                      fontSize: MediaQuery.of(context).size.width*0.09,
                      color: const Color.fromARGB(255, 37, 101, 39),
                      fontWeight: FontWeight.bold,
                    ), child: Text('Results'))
            ],
          ),
          SizedBox(height: 25,),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.045),
            child: DefaultTextStyle(style: GoogleFonts.aBeeZee(
              fontSize: MediaQuery.of(context).size.width*0.055,
            ), child: Text("total correct answers")),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.045),
            child: DefaultTextStyle(style: GoogleFonts.aBeeZee(
              fontSize: MediaQuery.of(context).size.width*0.05,
              color: const Color.fromARGB(255, 37, 101, 39),
            ), child: Text("${SharedPreferencesHelper.getData(key: widget.levelNum.toString())/10} out of ${3}")),
          ),
          Container(
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.12,top: MediaQuery.of(context).size.width*0.07),
            width: MediaQuery.of(context).size.width*0.75,
            height: MediaQuery.of(context).size.height*0.57,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(50),right: Radius.circular(50)),
              color: Colors.deepPurple
            ),
            alignment: Alignment.topCenter,
            child: Column(children: [
                Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.07),
            child: DefaultTextStyle(style: GoogleFonts.aBeeZee(
              fontSize: MediaQuery.of(context).size.width*0.06,
              fontWeight: FontWeight.bold,
            ), child: Text("Your final score is")),
          ),
          SizedBox(height: 50,),
          Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: MediaQuery.of(context).size.height*0.3,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(300)),
              color: Colors.amber,
            ),
            alignment: Alignment.center,
            child: DefaultTextStyle(style: GoogleFonts.aBeeZee(
              fontSize: MediaQuery.of(context).size.width*0.2,
              fontWeight: FontWeight.bold,
            ), child: Text(SharedPreferencesHelper.getData(key: widget.levelNum.toString()).toString())),
          )
            ]
            ),
          )
        ],
      ),
    );
  }
}