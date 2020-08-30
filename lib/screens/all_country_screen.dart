import 'dart:convert';
import 'dart:ui';

import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/widgets/countrywise_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ///First show the image in background
          Container(
            height: 350,
            width: double.infinity,
            color: Colors.red,
            child: Image.asset(
              'images/country_page_cover.png',
              fit: BoxFit.fill,
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
                      countryData != null
                          ? CountryWiseData(countrywiseData: countryData)
                          : Container(),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              userInput != null
                                  ? getCountryData()
                                  : Container();
                            });
                          },
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
                              color: constants.kButtonColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'images/thankyou.jpg',
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      FooterButtonWidget(
                        buttonText: 'Q&A on Covid-19',
                        url:
                            'https://www.who.int/news-room/q-a-detail/q-a-coronaviruses',
                      ),
                      SizedBox(height: 10),
                      FooterButtonWidget(
                        buttonText: 'Covid-19 Myths',
                        url:
                            'https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public/myth-busters',
                      ),
                      SizedBox(
                        height: 10.0,
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
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class FooterButtonWidget extends StatelessWidget {
  final Constants _constants = Constants();
  final String buttonText;
  final String url;

  FooterButtonWidget({this.buttonText, this.url});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          launch(url);
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: _constants.kAllButtonText,
          ),
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: _constants.kButtonColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
      ),
    );
  }
}
