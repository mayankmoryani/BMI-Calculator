import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';
import 'Bottombutton.dart';
class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiresult,@required this.resulttext, @required this.interpretation});

  final String bmiresult;
  final String resulttext;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kTitleTextStyle,
            ),
          ),
          ),
          Expanded(
            flex: 4,
              child: reusablecard(
                colour: kCardcontainercolor,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resulttext.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiresult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      style: kCommentTextStyle,
                      textAlign: TextAlign.center,
                    ),

                  ],
                ),
              ),
          ),
          Bottombutton(
              ontap: (){Navigator.pop(context);},
              buttonTitle: 'Re-Calculate'),
        ],
      ),

    );

  }
}
