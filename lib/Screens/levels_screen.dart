import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quaiz_app/Screens/first_screen.dart';
import 'package:quaiz_app/Services/Sp_Services/cashe_helper.dart';

import '../Components/levels_cotroller.dart';

class LevelsScreen extends StatefulWidget{
  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 27, 11, 54),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.013),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>FirstScreen()));
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
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width*0.25,),
                  Expanded(
                    flex: 5,
                    child: Container(
                      child:  DefaultTextStyle(style: GoogleFonts.aBeeZee(
                        fontSize: MediaQuery.of(context).size.width*0.1,
                        fontWeight: FontWeight.bold,
                        color:const Color.fromARGB(255, 37, 101, 39)
                      ), child: const Text('Levels')) ,
                    ),
                  )
                ],
              ),  
            ),
        
           const SizedBox(height: 20,),
            DefaultTextStyle(style: GoogleFonts.aBeeZee(
              fontSize: MediaQuery.of(context).size.width*0.07,
            ), child: Text("Welcome "+SharedPreferencesHelper.getData(key: 'k'))),
          const SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: 400,
                      height: 550,
                      child: LevelsControllerWidget())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}