import 'package:flutter/material.dart';
import 'package:icgm/Core/constance/app_function.dart';
import 'package:icgm/Features/home/presentation/views/widgets/backgroud_image.dart';
import 'package:icgm/Features/home/presentation/views/widgets/blood_ratio.dart';
import 'package:icgm/Features/home/presentation/views/widgets/wating_widget.dart';

import '../../../../Core/constance/my_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool measured = false;
  sendAlertMessage() {
    AppFunctions.shareDuaa(textToShare: 'the blood sugar ratio is 120');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.creamColor,
      appBar: AppBar(
        backgroundColor: MyColors.lightBrown,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            BloodSugarRatio(
              ratio: '120',
              visible: measured,
            ),
            WaitingWidget(
              visible: measured,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
            const BackgroundImage(),
          ],
        ),
      ),
    );
  }
}
