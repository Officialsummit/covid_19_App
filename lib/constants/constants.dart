import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  TextStyle kHeaderText = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  TextStyle kMidWidgetText = TextStyle(
    fontFamily: 'Raleway',
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  TextStyle kInfectedText = GoogleFonts.roboto(
    fontSize: 40.0,
    color: Colors.red,
  );
  TextStyle kAllButtonText = GoogleFonts.roboto(
    fontSize: 20,
    color: Colors.white,
  );

  InputDecoration kTextFieldDecoration = InputDecoration(
    filled: true,
    suffixIcon: Icon(
      FontAwesomeIcons.searchLocation,
      color: Colors.black26,
    ),
    fillColor: Color.fromRGBO(237, 241, 245, 1),
    hintText: 'search your country... ',
  );

  Color kButtonColor = Color(0xFF193EA7);
}
