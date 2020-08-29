import 'package:covid_19/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WorldDataWidget extends StatelessWidget {
  final Map worldData;

  WorldDataWidget({@required this.worldData});
  @override
  Widget build(BuildContext context) {
    Constants constants = new Constants();
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.virus,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              worldData['cases'].toString(),
              style: constants.kInfectedText,
            ),
            Text(
              'Infected',
              style: constants.kInfectedText.copyWith(
                fontSize: 30.0,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomDataCard(
                  icon: FontAwesomeIcons.skullCrossbones,
                  color: Colors.red,
                  count: worldData['deaths'].toString(),
                  textStyle: constants.kInfectedText.copyWith(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                  text: 'Deaths',
                ),
                BottomDataCard(
                  icon: FontAwesomeIcons.userInjured,
                  color: Colors.green,
                  count: worldData['recovered'].toString(),
                  textStyle: constants.kInfectedText
                      .copyWith(fontSize: 20.0, color: Colors.green),
                  text: 'Recovered',
                ),
                BottomDataCard(
                  icon: FontAwesomeIcons.procedures,
                  color: Colors.blueGrey,
                  count: worldData['critical'].toString(),
                  textStyle: constants.kInfectedText
                      .copyWith(fontSize: 20.0, color: Colors.blueGrey),
                  text: 'Critical',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BottomDataCard extends StatelessWidget {
  final String count;
  final IconData icon;
  final Color color;
  final String text;
  final TextStyle textStyle;
  BottomDataCard(
      {this.icon, this.text, this.count, this.color, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: color,
          size: 20.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          count,
          style: textStyle,
        ),
        Text(
          text,
          style: textStyle,
        )
      ],
    );
  }
}
