// ignore_for_file: use_key_in_widget_constructors, constant_identifier_names, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_bmi/models/bmi_functionality.dart';
import 'package:your_bmi/models/bottom_button.dart';
import 'package:your_bmi/models/constants.dart';
import 'package:your_bmi/models/gender_content.dart';
import 'package:your_bmi/models/reuseable_card.dart';
import 'package:your_bmi/screens/bmi_results.dart';

class BMIcalc extends StatefulWidget {
  @override
  _BMIcalcState createState() => _BMIcalcState();
}

enum GenderType {
  MALE,
  FEMALE,
}
enum CardType {
  Weight,
  Age,
}

class _BMIcalcState extends State<BMIcalc> {
  GenderType? selectedGender;
  int height = 100;
  int weight = 15;
  int age = 10;
  /*Color maleCardColor = deactiveColor;
  Color femaleCardColor = deactiveColor;
  void setTapColor(GenderType genderType) {
    setState(() {
      // genderType == GenderType.MALE ? maleCardColor = activeColor;femaleCardColor = deactiveColor;:femaleCardColor = activeColor;maleCardColor=deactiveColor;
      if (genderType == GenderType.MALE) {
        if (maleCardColor == deactiveColor) {
          maleCardColor = activeColor;
          if (femaleCardColor == activeColor) {
            femaleCardColor = deactiveColor;
          }
        } else
          maleCardColor = deactiveColor;
      } else {
        if (femaleCardColor == deactiveColor) {
          femaleCardColor = activeColor;
          if (maleCardColor == activeColor) {
            maleCardColor = deactiveColor;
          }
        } else {
          femaleCardColor = deactiveColor;
        }
      }
    });
  }*/
  Column weightAgeCard(String text, CardType cardType) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: labelTextStyle,
        ),
        Text(
          cardType == CardType.Weight ? weight.toString() : age.toString(),
          style: TextStyle(
            fontFamily: "Ubuntu",
            fontWeight: FontWeight.bold,
            fontSize: 60,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RawMaterialButton(
              fillColor: deactiveColor,
              constraints: BoxConstraints.tightFor(
                width: 56.0,
                height: 56.0,
              ),
              shape: CircleBorder(),
              onPressed: () {
                setState(() {
                  cardType == CardType.Weight ? weight-- : age--;
                });
              },
              child: Icon(
                FontAwesomeIcons.minus,
                size: 20,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            RawMaterialButton(
              fillColor: deactiveColor,
              constraints: BoxConstraints.tightFor(
                height: 56,
                width: 56,
              ),
              shape: CircleBorder(),
              onPressed: () {
                setState(() {
                  cardType == CardType.Weight ? weight++ : age++;
                });
              },
              child: Icon(
                FontAwesomeIcons.plus,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deactiveColor,
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        if (selectedGender == GenderType.MALE) {
                          selectedGender = null;
                        } else {
                          selectedGender = GenderType.MALE;
                        }
                      });
                    },
                    color: selectedGender == GenderType.MALE
                        ? activeColor
                        : deactiveColor,
                    cardChild: Center(
                      child: GenderContent(
                        fontAwesomeIcons: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        if (selectedGender == GenderType.FEMALE) {
                          selectedGender = null;
                        } else {
                          selectedGender = GenderType.FEMALE;
                        }
                      });
                    },
                    color: selectedGender == GenderType.FEMALE
                        ? activeColor
                        : deactiveColor,
                    cardChild: GenderContent(
                      fontAwesomeIcons: FontAwesomeIcons.venus,
                      label: "Female",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          fontSize: 60,
                        ),
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 50,
                    max: 200,
                    activeColor: bottomContainerColor,
                    inactiveColor: Colors.grey,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                    cardChild: weightAgeCard('Weight', CardType.Weight),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeColor,
                    cardChild: weightAgeCard('Age', CardType.Age),
                  ),
                ),
              ],
            ),
          ),

          ///also doable with wraping the container with Gesture detector//container button
          BottomButton(
            buttonText: 'CALCULATE',
            onPressed: () {
              // Navigator.pushNamed(context, '/results');
              BMIFunctionality output =
                  BMIFunctionality(height: height, weight: weight);
              /*setState(() {
                bmiScore = output.calculateBMI();
                result = output.getResults();
                feedback = output.getFeedback();
              });*/

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            result: output.getResults(output.calculateBMI()),
                            bmiScore: output.calculateBMI(),
                            feedback: output.getFeedback(output.calculateBMI()),
                          )));
            },
          ),
          /*Container(
            color: bottomContainerColor,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: TextButton(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/results');
                  */ /*Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ResultsPage()));*/ /*
                },
              ),
            ),
          ),*/
        ],
      ),
      /*floatingActionButton: Theme(
        data: ThemeData(
          accentColor: Colors.purple,
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),*/
    );
  }
}
