import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PurpleButton extends StatelessWidget {
  const PurpleButton(
      {super.key,
      required this.width,
      required this.label,
      required this.onPressed});
  final double width;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF65558F),
        borderRadius: BorderRadius.all(Radius.circular(36)),
      ),
      child: TextButton(
        onPressed: () {
          onPressed;
        },
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
