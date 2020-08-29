import 'dart:convert';

import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/screens/all_country_screen.dart';
import 'package:covid_19/widgets/header_widget.dart';
import 'package:covid_19/widgets/worldDataWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
              image: Image.asset("images/doc_sitting_new.png"),
              headerText: "STAY HOME \n     STAY SAFE",
              onTapped: () {
                print(worldData['deaths']);
                //TODO Go to Precaution Symptomp page
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
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.redAccent,
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
                  width: 250,
                  child: Text(
                    'All Country Details',
                    textAlign: TextAlign.center,
                    style: constants.kAllCountryText,
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
