import 'package:flutter/material.dart';
import 'package:icgm/Features/home/presentation/views/widgets/wating_widget.dart';

import 'backgroud_image.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          const WaitingWidget(
            visible: true,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          const BackgroundImage(),
        ],
      ),
    );
  }
}
