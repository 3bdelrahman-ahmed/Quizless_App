import 'package:flutter/material.dart';

class FirstPasrt extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipPath(
        clipper: Cirves(),
        child:              Container(
                alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.65,
            color: const Color.fromARGB(255, 24, 3, 54),
            child: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.00001,left: MediaQuery.of(context).size.width*0.079,bottom: MediaQuery.of(context).size.height*0.05),
          width: MediaQuery.of(context).size.width*0.41,
          height: MediaQuery.of(context).size.height*0.25,
          child: const Image(image: AssetImage("assets/logo.png",),
          fit: BoxFit.fill,
          ),
         ),
    )
    );
  }
}

class Cirves extends CustomClipper<Path>{
  @override
  Path getClip (Size size){
    double w=size.width;
    double h=size.height;
    final path=Path();
    //path.moveTo(w*0.5, h);
   // path.moveTo(h, w*0.5);
  path.lineTo(0, h);
 path.quadraticBezierTo(w*0.2, h-90, w, h);
// path.lineTo(w*0.2, h);
 path.lineTo(w, 0);
         return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}