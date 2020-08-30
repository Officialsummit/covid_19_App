import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryWiseData extends StatelessWidget {
  final Map countrywiseData;
  CountryWiseData({@required this.countrywiseData});
  @override
  Widget build(BuildContext context) => countrywiseData.containsKey('updated')
      ? Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    countrywiseData['country'],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '(${countrywiseData['continent']})',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.network(
                    countrywiseData['countryInfo']['flag'],
                    height: 140,
                    width: 100,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  StatsDataCard(data: countrywiseData),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        )
      : Container(
          padding: const EdgeInsets.all(2),
          child: Row(
            children: [
              Icon(FontAwesomeIcons.sadTear),
              SizedBox(
                width: 10,
              ),
              Text(countrywiseData['message']),
            ],
          ),
        );
}

class StatsDataCard extends StatelessWidget {
  final Map data;

  StatsDataCard({
    @required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20.0,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: Colors.black54,
              child: Text(
                'Tests Done : ${data['tests'].toString()}',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Total Deaths : ${data['deaths'].toString()}",
              style: TextStyle(fontSize: 13, color: Colors.red),
            ),
            Text(
              "Today's Deaths : ${data['recovered'].toString()}",
              style: TextStyle(fontSize: 13, color: Colors.red),
            ),
            Text(
              'Total Cases : ${data['cases'].toString()}',
              style: TextStyle(fontSize: 13, color: Colors.blueAccent),
            ),
            Text(
              "Today's cases: ${data['todayCases'].toString()}",
              style: TextStyle(fontSize: 13, color: Colors.blueAccent),
            ),
            Text(
              'Total Recovered : ${data['recovered'].toString()}',
              style: TextStyle(fontSize: 13, color: Colors.green),
            ),
            Text(
              'Active : ${data['active'].toString()}',
              style: TextStyle(
                fontSize: 13,
                color: Colors.red[200],
              ),
            ),
            Text(
              'Critical : ${data['critical'].toString()}',
              style: TextStyle(
                fontSize: 13,
                color: Colors.red[200],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
