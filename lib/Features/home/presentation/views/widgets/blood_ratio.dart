import 'package:flutter/material.dart';

import '../../../../../Core/constance/my_colors.dart';

class SugarLevel extends StatelessWidget {
  const SugarLevel({Key? key, required this.ratio, required this.visible})
      : super(key: key);

  final String ratio;
  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Text(
        ratio,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: MyColors.darkBrown,
          fontSize: 64,
        ),
      ),
    );
  }
}
