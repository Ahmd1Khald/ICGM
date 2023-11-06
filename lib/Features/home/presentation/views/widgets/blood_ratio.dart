import 'package:flutter/material.dart';

import '../../../../../Core/constance/my_colors.dart';

class BloodSugarRatio extends StatelessWidget {
  const BloodSugarRatio({Key? key, required this.ratio, required this.visible})
      : super(key: key);

  final String ratio;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: const Text(
        "356",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: MyColors.darkBrown,
          fontSize: 64,
        ),
      ),
    );
  }
}
