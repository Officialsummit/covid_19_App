import 'dart:convert';

import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class CountryListPage extends StatefulWidget {
  @override
  _CountryListPageState createState() => _CountryListPageState();
}

List countryData;
Constants _constants = new Constants();

class _CountryListPageState extends State<CountryListPage> {
  getCountryListData() async {
    var response = await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = jsonDecode(response.body);
    });
    print(countryData.length);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryListData();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              HeaderWidget(
                onTapped: () {
                  Navigator.pop(context);
                },
                headerText: "Let's Fight Together",
                image: Image.asset(
                  'images/world_map',
                  width: 250,
                  color: Colors.white,
                ),
                titleText: Text(' '),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    "List of Countries",
                    style: _constants.kMidWidgetText,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      icon: Icon(FontAwesomeIcons.sync),
                      onPressed: () {
                        setState(() {
                          getCountryListData();
                        });
                      })
                ],
              ),
            ],
          ),
          countryData != null
              ? DataCardWidget(screenSize: screenSize)
              : Container(
                  padding: const EdgeInsets.all(60),
                  child: Center(
                    child: SpinKitChasingDots(
                      color: Color(0xFF193EA7),
                      size: 150,
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class DataCardWidget extends StatelessWidget {
  const DataCardWidget({
    Key key,
    @required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        height: screenSize.height / 1.8,
        child: ListView.builder(
          itemCount: countryData.length,
          itemBuilder: (context, index) {
            return Container(
              child: Card(
                color: countryData[index]['cases'] >= 10000
                    ? Colors.red
                    : Colors.green,
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(countryData[index]['countryInfo']['flag']),
                  ),
                  title: Text(
                    countryData[index]['country'].toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      'Cases : ${countryData[index]['cases'].toString()} \nDeaths : ${countryData[index]['deaths'].toString()}'),
                  trailing: Text(countryData[index]['continent']),
                  isThreeLine: true,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
