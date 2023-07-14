import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quaiz_app/Screens/levels_screen.dart';

import '../Services/Sp_Services/cashe_helper.dart';

class ValidationScreen extends StatefulWidget{
  @override
  State<ValidationScreen> createState() => _ValidationScreenState();
}

class _ValidationScreenState extends State<ValidationScreen> {
  final formKey =  GlobalKey<FormState>();
  final textinput= TextEditingController();
  TextEditingController t=TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 24, 3, 54),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                padding: EdgeInsets.only(bottom: 1),
                  child: Container(
                    child:  Icon(Icons.star,
                    size: MediaQuery.of(context).size.width*0.1,
                    color: Colors.yellow,
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10,bottom: 50),
                child:  Container(
              child:  Icon(Icons.star,
              size: MediaQuery.of(context).size.width*0.1,
              color: Colors.yellow,
              ),
            ),
                ),
                  Padding(padding: EdgeInsets.only(left: 10,top: 5),
                child:  Container(
              child:  Icon(Icons.star,
              size: MediaQuery.of(context).size.width*0.1,
              color: Colors.yellow,
              ),
            ),
                )
              ],
            ),
            
            Container(
              width: MediaQuery.of(context).size.width*0.75,
              height: MediaQuery.of(context).size.height*0.5,
              decoration: BoxDecoration(
                borderRadius:const BorderRadius.all(Radius.elliptical(20, 20)),
                color: Colors.deepPurple,
                border: Border.all(width: 0.9)
              ),
              child: Column(
                children: [
                 const SizedBox(height: 20,),
                 DefaultTextStyle(style: GoogleFonts.aBeeZee(
                    fontSize: MediaQuery.of(context).size.width*0.059,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ), child: const Text('enter your Email')) ,
                  Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                    child: Form(
                      key: formKey,
                      child:      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: textinput,
              keyboardAppearance: Brightness.light,
      validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
      },
    ),
  const  SizedBox(height: 100,),
      ElevatedButton(
  onPressed: () {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),

      );
      SharedPreferencesHelper.saveData(key: 'k', value: textinput.text);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LevelsScreen()));
      SharedPreferencesHelper.getData(key: 'k')[0]=null;

    }
  },
  child: const Text('Submit'),
),
    ],
    ) ,
    
                    ),
                  )   
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}