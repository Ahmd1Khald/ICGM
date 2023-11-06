import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/constance/my_colors.dart';

class HigherStateWidget extends StatelessWidget {
  const HigherStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: MyColors.darkBrown,
      highlightColor: Colors.yellow,
      child: const Text(
        "HIGHER STATE",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: MyColors.darkBrown,
          fontSize: 26,
        ),
      ),
    );
  }
}
