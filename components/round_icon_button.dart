import 'package:bmi_calculator/constants/constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {

  final Icon icon;
  final VoidCallback? onPress;

  RoundIconButton({required this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0
      ),
        onPressed: onPress,
        shape: CircleBorder(),
        fillColor: darkGray,
      child: icon,
    );
  }
}
