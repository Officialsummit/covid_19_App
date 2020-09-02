import 'dart:convert';

import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/screens/all_country_screen.dart';
import 'package:covid_19/screens/list_country_page.dart';
import 'package:covid_19/screens/precaution_symptioms_screen.dart';
import 'package:covid_19/widgets/header_widget.dart';
import 'package:covid_19/widgets/worldDataWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as https;

Map worldData;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Constants constants = Constants();
  getWorldData() async {
    var response = await https.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = jsonDecode(response.body);
    });
    //print(worldData['todayDeaths']);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getWorldData();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              titleText: Text(
                'The COVID-19 App',
                style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              image: Image.asset("images/doc_sitting_new.png"),
              headerText: "STAY HOME \n     STAY SAFE",
              onTapped: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrecautionSymptomsPage()));
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "World Update",
                    style: constants.kMidWidgetText,
                  ),
                  IconButton(
                      icon: Icon(
                        FontAwesomeIcons.sync,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          getWorldData();
                        });
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            worldData != null
                ? WorldDataWidget(
                    worldData: worldData,
                  )
                : Center(
                    child: SpinKitWave(
                      color: constants.kButtonColor,
                      size: 30,
                    ),
                  ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 170.0,
              width: double.infinity,
              child: Image.asset('images/world_map'),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllCountryDetailScreen()));
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  height: 50,
                  width: 200,
                  child: Text(
                    'Search Your Country',
                    textAlign: TextAlign.center,
                    style: constants.kAllButtonText,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF193EA7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    //todo nav to all country details list
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CountryListPage()));
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    'All Country Details',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                    color: constants.kButtonColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrecautionSymptomsPage()));
              },
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  height: 50,
                  width: 250,
                  child: Text(
                    'How to Avoid Covid ?',
                    textAlign: TextAlign.center,
                    style: constants.kAllButtonText,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF193EA7),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text(
                'TOGETHER WE CAN BEAT IT',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
