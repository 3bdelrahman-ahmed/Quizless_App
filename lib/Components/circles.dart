// import 'dart:js';

import 'package:flutter/material.dart';


class CirclesContainers extends StatelessWidget{
   CirclesContainers({super.key, required this.he_ci, required this.wid_ci, required this.mar, required this.mar2});
    final double he_ci;
    final double wid_ci;
    final double mar;
    final double mar2;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top:MediaQuery.of(context).size.width*mar,left:MediaQuery.of(context).size.width*mar2 ),
      width: MediaQuery.of(context).size.width*wid_ci,
      height: MediaQuery.of(context).size.height*he_ci,
      child: CustomPaint(foregroundPainter: Circles()),
      
    );
    
  }
} 
class Circles extends CustomPainter{
  @override
  void paint(Canvas canvas,Size size){
    final center =Offset(size.width/2,size.height/2 );
    final paint =Paint()
    ..color=Color.fromARGB(255, 182, 53, 191).withOpacity(0.1)
    ..strokeWidth=100;
    canvas.drawCircle(center,size.width*0.25 , paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
}


class Circless {
  List <Widget>l=[CirclesContainers(he_ci: 0.09, wid_ci: 0.09, mar: 0.42,mar2:0.1,),
    CirclesContainers(he_ci: 0.07, wid_ci: 0.07, mar: 0.49,mar2: 0.8,),
    CirclesContainers(he_ci: 0.1, wid_ci: 0.1, mar: 0.26,mar2: 0.7,),
    CirclesContainers(he_ci: 0.13, wid_ci: 0.13, mar: 0.19,mar2: 0.22,),
    CirclesContainers(he_ci: 0.06, wid_ci: 0.06, mar: 0.6,mar2: 0.2,),
    CirclesContainers(he_ci: 0.085, wid_ci: 0.085, mar: 0.07,mar2: 0.11,),
    CirclesContainers(he_ci: 0.15, wid_ci: 0.15, mar: 0.03,mar2: 0.82,),
    CirclesContainers(he_ci: 0.11, wid_ci: 0.11, mar: 0.68,mar2: 0.75,),
    CirclesContainers(he_ci: 0.11, wid_ci: 0.11, mar: 0.6,mar2: 0.34,),
    CirclesContainers(he_ci: 0.11, wid_ci: 0.11, mar: 0.05,mar2: 0.42,),
    CirclesContainers(he_ci: 0.097, wid_ci: 0.097, mar: 0.9,mar2: 0.87,),
    CirclesContainers(he_ci: 0.08, wid_ci: 0.08, mar: 0.88,mar2: 0.1,),
    ];
}