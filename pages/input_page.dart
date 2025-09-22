import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/utils/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import "../components/icon_content.dart";
import '../components/reusable_card.dart';
import "../components/round_icon_button.dart";
import '../constants/constants.dart';
import '../components/bottom_button.dart';


enum Gender {
  male,
  female
}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  void updateGender (Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 800.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: ReusableCard(
                        color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                        onTap: () => updateGender(Gender.male),
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: "MALE",
                        )
                      )
                    ),
                    Expanded(child: ReusableCard(
                        color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                        onTap: () => updateGender(Gender.female),
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE",
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Expanded(child: ReusableCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "HEIGHT",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: contentTextStyle,
                        ),
                        Text(
                          "cm",
                          style: labelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: actionComponentColor,
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        inactiveTrackColor: Colors.white
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 250.0,
                          onChanged: (double newVal) {
                            setState(() {
                              height = newVal.round();
                            });
                          }
                      ),
                    )
                  ],
                ),
              )),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: ReusableCard(
                        color: activeCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "WEIGHT",
                              style: labelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: contentTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: Icon(FontAwesomeIcons.minus, color: Colors.white),
                                  onPress: () => {
                                    setState(() {
                                      weight--;
                                    })
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: Icon(FontAwesomeIcons.plus, color: Colors.white),
                                  onPress: () => {
                                    setState(() {
                                      weight++;
                                    })
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                    )),
                    Expanded(child: ReusableCard(
                      color: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: contentTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.minus, color: Colors.white),
                                onPress: () => {
                                  setState(() {
                                    age--;
                                  })
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: Icon(FontAwesomeIcons.plus, color: Colors.white),
                                onPress: () => {
                                  setState(() {
                                    age++;
                                  })
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                  ],
                )
              ),
              BottomButton(
                buttonText: "Calculate",
                onTap: () {
                  if (selectedGender == null) return;
                  CalculatorBrain calc = CalculatorBrain(
                    gender: selectedGender!,
                    height: height,
                    weight: weight,
                    age: age,
                  );
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: calc.getBmiResult(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),
                      )
                  ));
                },
              )
            ],
          )
        )
      ),
    );
  }
}
