import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:icgm/Core/constance/app_function.dart';
import 'package:icgm/Core/constance/assets_manager.dart';
import 'package:icgm/Features/home/presentation/views/widgets/backgroud_image.dart';
import 'package:icgm/Features/home/presentation/views/widgets/blood_ratio.dart';
import 'package:icgm/Features/home/presentation/views/widgets/wating_widget.dart';

import '../../../../Core/constance/my_colors.dart';
import '../../../../Core/servises/firebase_servise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseReference = FirebaseDatabase.instance.reference();
  void sendAlertMessage() {
    AppFunctions.shareDuaa(textToShare: 'the blood sugar ratio is 120');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.creamColor,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "ICGM",
              style: TextStyle(
                color: MyColors.darkBrown,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Image.asset(
              AssetsManager.appImage2,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ],
        ),
        backgroundColor: MyColors.lightBrown,
        elevation: 0,
      ),
      body: StreamBuilder<DataSnapshot>(
        stream: FirebaseDataService().dataStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            DataSnapshot? data = snapshot.data;
            if (data!.value != null) {
              // Handle the data from the snapshot
              print(data.value);
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    BloodSugarRatio(
                      ratio: data.children.first.toString(),
                      visible: true,
                    ),
                    const WaitingWidget(
                      visible: false,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    const BackgroundImage(),
                  ],
                ),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    const BloodSugarRatio(
                      ratio: '120',
                      visible: false,
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
          } else if (snapshot.hasError) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  const BloodSugarRatio(
                    ratio: '120',
                    visible: false,
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
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  const BloodSugarRatio(
                    ratio: '120',
                    visible: false,
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
        },
      ),
    );
  }
}
