import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'Gender_reuse.dart';
import 'constants.dart';
import 'Results_page.dart';
import 'Bottombutton.dart';
import 'RoundIconButton.dart';
import 'CalculatorBrain.dart';


enum gendertype {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gendertype gender;
  int height = 180;
  int weight=65;
  int age=25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator", textAlign: TextAlign.center)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(
                child: reusablecard(
                  onPress: (){
                    setState(() {
                      gender=gendertype.male;
                    });
                  },
                    colour: gender==gendertype.male ? kCardcontainercolor : kInactivecardcolor,
                    cardchild: gendereuse(gendericon: FontAwesomeIcons.mars,gendertext :"Male",genderColor: Color(0xFF3941FE),),
                ),
              ),
              Expanded(
                child: reusablecard(
                  onPress: (){
                    setState(() {
                      gender=gendertype.female;
                    });
                  },
                    colour: gender==gendertype.female ? kCardcontainercolor : kInactivecardcolor,
                    cardchild: gendereuse(gendericon :FontAwesomeIcons.venus, gendertext: "Female",genderColor: Color(0xFFF50D56),),
                ),
              ),
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(
                child: reusablecard(
                    colour: kCardcontainercolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('HEIGHT',
                        style: kGendertextstyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                             style: kNumberTextStyle,
                            ),
                            Text('cm',
                              style: kGendertextstyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            inactiveTrackColor: Colors.grey,
                            activeTrackColor: Colors.white,
                            thumbColor: Color(0xFF0BC3A3),
                            overlayColor: Color(0x790BC3A3),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 100,
                            max: 250,
                            onChanged: (double newvalue){
                              setState(() {
                                height=newvalue.round();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(
                child: reusablecard(
                    colour: kCardcontainercolor,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',style: kGendertextstyle,),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onpressed: (){
                                setState(() {
                                  weight--;

                                });
                              },
                            ),
                            SizedBox(width: 15.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
              ),
              Expanded(
                child: reusablecard(
                    colour: kCardcontainercolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE',style: kGendertextstyle,),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: (){
                              setState(() {
                                age--;

                              });
                            },
                          ),
                          SizedBox(width: 15.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: (){
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

              ),
              ),
            ],
          ),
    ),
          Bottombutton(
            ontap: (){
              CalculatorBrain calc= CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiresult: calc.calculateBMI(),
                resulttext: calc.getResult(),
                interpretation: calc.getInterpretation(),
              ),),);
            },
            buttonTitle: 'Calculate',
          ),
        ],
      ),
    );
  }
}




