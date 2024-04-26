import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quaiz_app/Components/hexagon_shape.dart';
import 'package:quaiz_app/Screens/first_screen.dart';
import 'package:quaiz_app/Screens/levels_screen.dart';
import 'package:quaiz_app/Screens/score_screen.dart';
import 'package:quaiz_app/Services/Sp_Services/cashe_helper.dart';
import '../Components/questions&ansers.dart';
class QuestionsScreen extends StatefulWidget{
  int id;
  int looper=0;
  bool correct=false;
  int score=0;
  int size=3;
  QuestionsScreen(this.id, {super.key});
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    
    final questionsListt=questionsList.map((e) {
          return DefaultTextStyle(child: Text(e[widget.looper].question),style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width*0.05,
          ),);
    });
  final answers=answer[widget.looper].map((e){
   return Row(
    mainAxisAlignment: MainAxisAlignment.center,
     children: [
       GestureDetector(
          onTap: () {
            setState(() {
              if(e.correct){
               widget.score++;
               print(widget.score);
              }
            });
          },
         child: Container(
          margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.02),
          width: MediaQuery.of(context).size.width*0.65,
          height: MediaQuery.of(context).size.height*0.13,
          decoration:  const BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(20),right: Radius.circular(20)),
            color: Colors.amber,
          ),
          alignment: Alignment.center,
          child: DefaultTextStyle(
         style: TextStyle(
           fontSize: MediaQuery.of(context).size.width*0.05,
          fontWeight: FontWeight.bold,
         ),
         child:   Text(e.answer.toString(),
         ),
       ) ,
         ),
       ),
     ],
   );
  } 
  ,);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color:  const Color.fromARGB(255, 27, 11, 54),
      child: SingleChildScrollView(
        child: Column(
          children: [
           const SizedBox(height: 30,),
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
                    SizedBox(width: 115,),
                 Align(
                  alignment: Alignment(0.065, 0.2),
                   child: DefaultTextStyle(style: GoogleFonts.aBeeZee(
                    fontSize: MediaQuery.of(context).size.width*0.08,
                    fontWeight: FontWeight.bold,
                    color:  const Color.fromARGB(255, 24, 65, 25),
                   ), child:   Text("Level "+(widget.id).toString())),
                 ),
               ],
             ),
             DefaultTextStyle(style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color:  const Color.fromARGB(255, 24, 65, 25),
             ), child: Text((widget.looper+1).toString()+"/"+(widget.size).toString(),)),
             SizedBox(height: MediaQuery.of(context).size.height*0.05,),
         ...questionsListt,
          SizedBox(height: MediaQuery.of(context).size.height*0.032,),
          ...answers,
          SizedBox(height: MediaQuery.of(context).size.width*0.075,),
          Row(
            children: [
              SizedBox(width: 27,),
                     Align(
            alignment: Alignment(0.75, -0.5),
            child: GestureDetector(
              onTap: () {
               setState(() {
                 while(widget.looper>0){
                    widget.looper--;
                    break;
                 }
               });
              },
              child: Container(alignment: Alignment.center,
              width: MediaQuery.of(context).size.width*0.2,
              height: MediaQuery.of(context).size.height*0.059,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)),
                color: Colors.deepPurple
              ),
              child: DefaultTextStyle(
                child: const Text("Previos"),
                style: GoogleFonts.aBeeZee(
                  fontSize: MediaQuery.of(context).size.width*0.05,
                  fontWeight: FontWeight.bold
                ),
              )
              ,),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.46,),
              Align(
                alignment: Alignment(0.75, -0.8),
                child: GestureDetector(
                  onTap: () {
                    if(widget.looper==2){
                      setState(() {
                        levelsSolved++;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ScoreScreen(widget.id)));
                      SharedPreferencesHelper.saveData(key: widget.id.toString(), value:(widget.score)*10);
                    }
                    else{
                   setState(() {
                     widget.looper++;
                    // print(score);
                   });
                  }
                  },
                  child: Container(alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width*0.2,
                  height: MediaQuery.of(context).size.height*0.059,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(10),right: Radius.circular(10)),
                    color: Colors.deepPurple
                  ),
                  child: DefaultTextStyle(
                    child: const Text("Next"),
                    style: GoogleFonts.aBeeZee(
                      fontSize: MediaQuery.of(context).size.width*0.05,
                      fontWeight: FontWeight.bold
                    ),
                  )
                  ,),
                ),
              ),
        
            ],
          ),
          
          ],
        ),
      ),
    );
  }
}