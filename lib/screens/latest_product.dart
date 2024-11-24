import 'package:flutter/cupertino.dart';

import '../widgets/title_bar.dart';

class LatestProduct extends StatefulWidget {
  const LatestProduct({super.key});

  @override
  State<LatestProduct> createState() => _LatestProductState();
}

class _LatestProductState extends State<LatestProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBar(titleName: 'Latest Products'),
      ],
    );
  }
}
