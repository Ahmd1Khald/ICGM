import 'package:flutter/material.dart';

import '../../../../../Core/constance/assets_manager.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
