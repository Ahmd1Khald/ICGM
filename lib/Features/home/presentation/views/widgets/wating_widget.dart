import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../Core/constance/my_colors.dart';

class WaitingWidget extends StatelessWidget {
  const WaitingWidget({Key? key, required this.visible}) : super(key: key);

  final bool visible;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: const Column(
        children: [
          Text(
            "Please wait until the blood sugar level is measured",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: MyColors.darkBrown,
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SpinKitPouringHourGlassRefined(
            color: MyColors.darkBrown,
            duration: Duration(
              milliseconds: 1500,
            ),
          ),
        ],
      ),
    );
  }
}
