import 'package:flutter/material.dart';
import 'constants.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton({@required this.ontap,@required this.buttonTitle});

  final Function ontap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(child: Text(buttonTitle, style: klargeButtonTextStyle,)),
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: kBottomcontainercolor,
            borderRadius: BorderRadius.circular(10.0)
        ),
        width: 100.0,
        height: kBottomcontainerheight,

      ),
    );
  }
}
