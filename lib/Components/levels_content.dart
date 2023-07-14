import 'package:flutter/material.dart';
import 'package:quaiz_app/Components/hexagon_shape.dart';
import 'package:quaiz_app/Services/Sp_Services/cashe_helper.dart';
class LevelsContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return
Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: MediaQuery.of(context).size.width*0.073,),
  HexagonShape(color: Color.fromARGB(255, 133, 89, 209),text: "01",notopend:false,leveNum: 1, previousScore: SharedPreferencesHelper.getData(key: '1'), ),
  SizedBox(width: MediaQuery.of(context).size.width*0.13,),
   HexagonShape(color: Color.fromARGB(255, 60, 91, 249),text: "02",notopend:true,leveNum: 2,previousScore: SharedPreferencesHelper.getData(key: '1') ),
  ],
);
  }
}

