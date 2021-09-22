import 'package:flutter/material.dart';
import 'constants.dart';

class gendereuse extends StatelessWidget {
  gendereuse({@required this.gendericon, @required this.gendertext,@required this.genderColor});
  final IconData gendericon;
  final String gendertext;
  final Color genderColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gendericon,
          size: 80.0,
          color: genderColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(gendertext,
          style: kGendertextstyle,
        ),

      ],
    );
  }
}