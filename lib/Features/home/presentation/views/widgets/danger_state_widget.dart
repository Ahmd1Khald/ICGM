import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/constance/my_colors.dart';

class DangerStateWidget extends StatelessWidget {
  const DangerStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: MyColors.lightBrown,
      highlightColor: Colors.red,
      child: const Text(
        "DANGER STATE",
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
