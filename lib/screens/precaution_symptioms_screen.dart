import 'package:covid_19/constants/constants.dart';
import 'package:covid_19/screens/tips_screen.dart';
import 'package:covid_19/widgets/header_widget.dart';
import 'package:flutter/material.dart';

class PrecautionSymptomsPage extends StatelessWidget {
  final Constants _constants = Constants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              titleText: Text(
                ' ',
                textAlign: TextAlign.start,
                style: _constants.kHeaderText,
              ),
              image: Image.asset('images/doc_standing_new.png'),
              headerText: "Let's Beat It !",
              onTapped: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text('Symptoms', style: _constants.kMidWidgetText),
            ),
            SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SymptomsCard(
                    img: 'images/cough',
                    symptomName: 'Cough',
                  ),
                  SymptomsCard(
                    img: 'images/fever',
                    symptomName: 'Fever',
                  ),
                  SymptomsCard(
                    img: 'images/headache',
                    symptomName: 'Headache',
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text('Preventions', style: _constants.kMidWidgetText),
            ),
            SizedBox(height: 10.0),
            PreventionCard(
              preventionName: 'Wear face mask',
              image: 'images/wear_mask',
              description:
                  'Wearing face masks\nensures safety of everyone.\nAnyone caught without\none riska becoming\na social pariah.',
            ),
            PreventionCard(
              preventionName: 'Maintain Social \n Distance',
              image: 'images/social_distance',
              description:
                  ' By minimizing the amount \n of close contact \n with others, we reduce \n our chances of \n catching the virus \n and spreading \n it to our loved ones and within \n our community.',
            ),
            PreventionCard(
              preventionName: 'Wash Hands Frequently',
              image: 'images/wash_hands',
              description:
                  'Our hands can spread \n virus to other surfaces \n and/or to your mouth,\n nose or eyes if you \n touch them. So wash \n them frequently',
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => QuarantineTipsPage(),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color(0xFF193EA7),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Show me tips',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            )
          ],
        ),
      ),
    );
  }
}

class SymptomsCard extends StatelessWidget {
  final String symptomName;
  final String img;
  SymptomsCard({this.symptomName, this.img});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img,
            height: 100,
            width: 100,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            symptomName,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String preventionName;
  final String image;
  final String description;
  PreventionCard({this.preventionName, this.image, this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      width: double.infinity,
      height: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            image,
            width: 150,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                preventionName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Expanded(child: Text(description)),
            ],
          )
        ],
      ),
    );
  }
}
