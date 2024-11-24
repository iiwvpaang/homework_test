import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_config.dart';

class LoadingBar extends StatelessWidget {
  const LoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConfig.loadingBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 33,
            height: 33,
            child: CircularProgressIndicator(),
          ),
          Text(
            '   Loading..',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
