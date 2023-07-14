import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quaiz_app/Components/questions&ansers.dart';
import 'package:quaiz_app/Screens/first_screen.dart';
import 'package:quaiz_app/Screens/questions_screen.dart';
import 'package:quaiz_app/Services/Sp_Services/cashe_helper.dart';

class HexagonShape extends StatelessWidget{
    final Color color ;
  final bool notopend;
  final String text;
  final int leveNum;
  final int previousScore;
   HexagonShape({super.key, required this.color, required this.notopend,  required this.text, required this.leveNum, required this.previousScore});
   
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        GestureDetector(
          onTap: () {
            if(previousScore>10||leveNum==1)
            Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionsScreen(leveNum)));
          },
          child: ClipPath(
          clipper: Hexagon(),
          child: Container(
            width: MediaQuery.of(context).size.width*0.32,
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration(
              color:  notopend?color.withOpacity(0.75):color
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment(0, -0.2),
                  child: DefaultTextStyle(style: GoogleFonts.aBeeZee(
                    fontSize: MediaQuery.of(context).size.width*0.12,
                    color: previousScore>=10||leveNum==1?Colors.white:Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ), child:Text(text),),
                ),
                if(previousScore<=((answer.length/2))*10&&leveNum>1)
                Align(
                  alignment: Alignment(0, -0.1),
                  child: Icon(
                    Icons.lock,
                    color: Colors.amber.withOpacity(0.6),
                    size: MediaQuery.of(context).size.width*0.15,
                
                  ),
                ),
                Align(
                  alignment: Alignment(0.4, -0.75),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.019,
                    height: MediaQuery.of(context).size.height*0.019,
                    child: CustomPaint(foregroundPainter: Circless())),
                ),
                Align(
                  alignment: Alignment(-0.35, 0.43),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.025,
                    height: MediaQuery.of(context).size.height*0.025,
                    child: CustomPaint(foregroundPainter: Circless())),
                ),
              ],
            ),
          ),
           ),
        ),
        SizedBox(height: 10,),
        if(previousScore>10||leveNum==1)
        DefaultTextStyle(child: Text("Score in this level : "+SharedPreferencesHelper.getData(key: leveNum.toString()).toString()),
        style: GoogleFonts.aBeeZee(
          fontSize: MediaQuery.of(context).size.width*0.038,
          fontWeight: FontWeight.bold,
          color: Colors.amber
        ),
        )
      ],
    );
  }
}

class Hexagon extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    final path =Path();
    path.lineTo(size.width*0.25, 0);
    path.lineTo(size.width*0.75, 0);
    path.lineTo(size.width, size.height*sqrt(3)/4);
    path.lineTo(size.width*0.75, size.height*sqrt(3)/2);
    path.lineTo(size.width*0.25, size.height*sqrt(3)/2);
    path.lineTo(0, size.height*sqrt(3)/4);
    path.lineTo(size.width*0.25,0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
class Circless extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    final center =Offset(size.width/2,size.height/2 );
    final paint =Paint()
    ..color=Color.fromARGB(255, 220, 203, 203).withOpacity(0.2)
    ..strokeWidth=100
    ..style=PaintingStyle.stroke;
    canvas.drawCircle(center,size.width*0.25 , paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}