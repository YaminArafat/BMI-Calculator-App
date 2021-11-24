// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:your_bmi/models/bottom_button.dart';
import 'package:your_bmi/models/constants.dart';
import 'package:your_bmi/models/reuseable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.result, required this.bmiScore, required this.feedback});
  final String result;
  final String bmiScore;
  final String feedback;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: deactiveColor,
        title: Text('BMI Calculator'),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          fontFamily: 'Ubuntu',
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'Your Results',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      result.toUpperCase(),
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      bmiScore,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      feedback,
                      style: labelTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          BottomButton(
              buttonText: 'RE-CALCULATE',
              onPressed: () {
                Navigator.pop(context);
              }),
          /*GestureDetector(
            child: Container(
              color: bottomContainerColor,
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),*/
        ],
      ),
      /*Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 40,
          ),
          Center(
            child: Text(
              'Your Results',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu',
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Expanded(
            //flex: 5,
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ),

              */ /*shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
              ), */ /*
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: activeColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Text(
                      'feedBack',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      score.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'motivation',
                      style: labelTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            color: bottomContainerColor,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),*/
    );
  }
}
