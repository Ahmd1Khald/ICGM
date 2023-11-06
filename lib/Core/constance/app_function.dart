import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'assets_manager.dart';
import 'my_colors.dart';

class AppFunctions {
  static Future<void> showAlertMessage({
    required VoidCallback func1,
    required VoidCallback func2,
    required context,
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

  static void sendAlertMessage({required String ratio, required String state}) {
    Share.share(
      'Your state is $state and the sugar level is $ratio\n form ICGM app',
      subject: '',
    );
  }
}
