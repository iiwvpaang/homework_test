import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework_test/screens/latest_product.dart';
import 'package:homework_test/screens/recommend_product.dart';

class Shopping extends StatefulWidget {
  const Shopping({super.key});

  @override
  State<Shopping> createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(10.0),
        child: AppBar(
          forceMaterialTransparency: true,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          RecommendProduct(),
          LatestProduct(),
        ],
      ),
    );
  }
}
