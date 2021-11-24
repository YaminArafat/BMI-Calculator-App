// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  /*const ReusableCard({
    Key? key,
  }) : super(key: key);*/

  final Color color;
  final Widget? cardChild;

  final Function()? onPress;

  ReusableCard({required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: color,
        ),
        /*height: height / 3 - 40,
        width: .5 * width - 30,*/
      ),
    );
  }
}
