import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:icgm/Core/constance/app_function.dart';
import 'package:icgm/Core/constance/assets_manager.dart';
import 'package:icgm/Features/home/presentation/views/widgets/backgroud_image.dart';
import 'package:icgm/Features/home/presentation/views/widgets/blood_ratio.dart';
import 'package:icgm/Features/home/presentation/views/widgets/danger_state_widget.dart';
import 'package:icgm/Features/home/presentation/views/widgets/higher_state_widget.dart';
import 'package:icgm/Features/home/presentation/views/widgets/no_data_widget.dart';
import 'package:icgm/Features/home/presentation/views/widgets/normal_state_widget.dart';

import '../../../../Core/constance/my_colors.dart';
import '../../../../Core/servises/firebase_servise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showCheckButton = true;
  final databaseReference =
      FirebaseDatabase.instance.ref('Embedded/Action needed/value');

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
              if (snapshot.data!.child('current').child('Condition').value ==
                  "Danger") {
                AppFunctions.sendAlertMessage(
                    ratio: snapshot.data!
                        .child('current')
                        .child('Reading')
                        .value
                        .toString(),
                    state: snapshot.data!
                        .child('current')
                        .child('Condition')
                        .value
                        .toString());
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    const Text(
                      'Your sugar level',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: MyColors.darkBrown,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
                    SugarLevel(
                      ratio: snapshot.data!
                          .child('current')
                          .child('Reading')
                          .value
                          .toString(),
                      visible: true,
                    ),
                    if (snapshot.data!
                            .child('current')
                            .child('Condition')
                            .value ==
                        "Danger")
                      const DangerStateWidget(),
                    if (snapshot.data!
                            .child('current')
                            .child('Condition')
                            .value ==
                        "Normal")
                      const NormalStateWidget(),
                    if (snapshot.data!
                            .child('current')
                            .child('Condition')
                            .value ==
                        "Higher")
                      const HigherStateWidget(),
                    if (snapshot.data!
                            .child('Action needed')
                            .child('value')
                            .value ==
                        true)
                      MaterialButton(
                        onPressed: () {
                          AppFunctions.showAlertMessage(
                              func1: () {
                                Navigator.pop(context);
                              },
                              func2: () {
                                databaseReference.set(false).then((value) {
                                  showCheckButton = false;
                                  setState(() {});
                                  Navigator.pop(context);
                                });
                              },
                              context: context);
                        },
                        splashColor: MyColors.darkBrown,
                        color: MyColors.lightBrown,
                        child: const Text(
                          'Check Insulin',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: MyColors.babyBrown,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                    ),
                    const BackgroundImage(),
                  ],
                ),
              );
            } else {
              return const NoDataWidget();
            }
          } else {
            return const NoDataWidget();
          }
        },
      ),
    );
  }
}
