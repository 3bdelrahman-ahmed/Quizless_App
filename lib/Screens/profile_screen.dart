import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quaiz_app/Components/hexagon_shape.dart';
import 'package:quaiz_app/Services/Sp_Services/cashe_helper.dart';
import 'package:quaiz_app/Services/Sp_Services/cashe_keys.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<_LevelsStats> data = [
    _LevelsStats(levelNum: 1, levelScore: 10),
    _LevelsStats(levelNum: 2, levelScore: 20),
    _LevelsStats(levelNum: 3, levelScore: 30),
    _LevelsStats(levelNum: 4, levelScore: 20),
    _LevelsStats(levelNum: 5, levelScore: 10),
    _LevelsStats(levelNum: 6, levelScore: 30)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: GoogleFonts.aBeeZee(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 24, 3, 54),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,
            color: Colors.white,
            )),
      ),
      backgroundColor: Color.fromARGB(255, 24, 3, 54),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(8),
                width: 370,
                height: 250,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 193, 192, 192),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30), right: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
                        Text("Welcom ${SharedPreferencesHelper.getData(key: 'k')}",
                        style: GoogleFonts.aBeeZee(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
                        ),
                       const  CircleAvatar(
                          radius:70 , // Adjust the radius as needed
                          backgroundImage: AssetImage(
                              'assets/avatar.png'), // Provide your image asset
                                             ),
                       ],
                     ),
                     Text('Levels Solved : ${levelsSolved}',
                     style: GoogleFonts.aBeeZee(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
                     )
                  ],
                )),
          ),
          Container(
            height: 250,
            width: 370,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 193, 192, 192),
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20))),
            child: SfCartesianChart(
              title: const ChartTitle(text: "Score Statistics"),
              primaryXAxis: const CategoryAxis(
                title: AxisTitle(text: "Level Numer"),
              ),
              primaryYAxis: const NumericAxis(
                minimum: 0,
                maximum: 60,
                interval: 5,
                title: AxisTitle(text: "Levels Score"),
              ),
              series: <CartesianSeries<_LevelsStats, int>>[
                AreaSeries<_LevelsStats, int>(
                  dataSource: data,
                  xValueMapper: (_LevelsStats level, _) => level.levelNum,
                  yValueMapper: (_LevelsStats level, _) => level.levelScore,
                  name: "Levels",
                  color: Colors.green.withOpacity(0.6),
                  animationDuration: 1500,
                  isVisibleInLegend: true,
                  borderColor: Colors.green,
                )
              ],
              tooltipBehavior: TooltipBehavior(enable: true),
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelsStats {
  final int levelNum;
  final double levelScore;

  _LevelsStats({required this.levelNum, required this.levelScore});
}
