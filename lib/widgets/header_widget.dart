import 'package:covid_19/constants/constants.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final Text titleText;
  final String headerText;
  final Image image;
  final Function onTapped;
  HeaderWidget({this.titleText, this.headerText, this.onTapped, this.image});

  @override
  Widget build(BuildContext context) {
    Constants constants = new Constants();
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 50),
      height: 240,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(80),
          bottomLeft: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(40, 100, 190, 1),
            Color.fromRGBO(19, 42, 168, 1),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          image,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText,
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  headerText,
                  style: constants.kHeaderText,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTapped,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20,
            ),
          )
        ],
      ),
    );
  }
}
