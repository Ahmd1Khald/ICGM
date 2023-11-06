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
  bool showCheckButton = true;
  void sendAlertMessage() {
    AppFunctions.shareDuaa(textToShare: 'the blood sugar ratio is 120');
  }

  Future<void> showAlertMessage({
    required VoidCallback func1,
    required VoidCallback func2,
  }) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.34,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetsManager.appImage2,
                width: MediaQuery.of(context).size.width * 0.25,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.014,
              ),
              const Text(
                'Did you taken your insulin ratio?',
                style: TextStyle(
                  color: MyColors.darkBrown,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: func1,
                    child: const Text(
                      "Not yet",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: func2,
                    child: const Text(
                      "Yes",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

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

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    const Text(
                      'Your blood ratio',
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
                    BloodSugarRatio(
                      ratio: snapshot.data!
                          .child('current')
                          .child('Reading')
                          .value
                          .toString(),
                      visible: true,
                    ),
                    if (showCheckButton)
                      MaterialButton(
                        onPressed: () {
                          if (snapshot.data!
                                  .child('Action needed')
                                  .child('value')
                                  .value ==
                              true) {
                            showAlertMessage(func1: () {
                              Navigator.pop(context);
                            }, func2: () {
                              databaseReference.set(false).then((value) {
                                showCheckButton = false;
                                setState(() {});
                                Navigator.pop(context);
                              });
                            });
                          }
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
