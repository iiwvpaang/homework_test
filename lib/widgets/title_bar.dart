import 'package:flutter/cupertino.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.titleName});
  final String titleName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(titleName),
      ),
    );
  }
}
