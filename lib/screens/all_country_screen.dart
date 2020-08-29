import 'dart:convert';

import 'package:covid_19/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AllCountryDetailScreen extends StatefulWidget {
  @override
  _AllCountryDetailScreenState createState() => _AllCountryDetailScreenState();
}

var userInput;
Map countryData;

class _AllCountryDetailScreenState extends State<AllCountryDetailScreen> {
  Constants constants = Constants();

  getCountryData() async {
    var response =
        await http.get('https://corona.lmao.ninja/v2/countries/$userInput');
    setState(() {
      countryData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFDFE9F3),
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            ///First show the image in background
            Container(
              padding: EdgeInsets.only(top: 50.0, left: 10.0),
              child: Text(
                'Get details\nabout your\nCOUNTRY🌍',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 45,
                  color: Color.fromRGBO(10, 36, 114, 1),
                ),
              ),
            ),

            DraggableScrollableSheet(
              maxChildSize: 1,
              initialChildSize: 0.6,
              minChildSize: 0.6,
              builder: (context, controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: TextField(
                            onChanged: (value) {
                              userInput = value;
                              print(userInput);
                            },
                            decoration: constants.kTextFieldDecoration,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              'SEARCH',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Color(0xFF193EA7),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'BACK',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Color(0xFF193EA7),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Image.asset('images/thankyou_img.jpg'),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
