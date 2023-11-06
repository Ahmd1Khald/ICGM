import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../Core/constance/my_colors.dart';

class NormalStateWidget extends StatelessWidget {
  const NormalStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 2),
      baseColor: MyColors.darkBrown,
      highlightColor: Colors.green,
      child: const Text(
        "NORMAL STATE",
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
