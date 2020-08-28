import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/header_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Constants constants = Constants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              image: Image.asset("images/doc_sitting_new.png"),
              headerText: "STAY HOME \n     STAY SAFE",
              onTapped: () {
                //TODO Go to Precaution Symptomp page
              },
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "World Update",
                    style: constants.kMidWidgetText,
                  ),
                  Icon(
                    Icons.location_on,
                    color: Color.fromRGBO(19, 42, 168, 1),
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
