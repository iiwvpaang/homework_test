import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/title_bar.dart';

class RecommendProduct extends StatefulWidget {
  const RecommendProduct({super.key});

  @override
  State<RecommendProduct> createState() => _RecommendProductState();
}

class _RecommendProductState extends State<RecommendProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleBar(titleName: 'Recommend Product'),
      ],
    );
  }
}
