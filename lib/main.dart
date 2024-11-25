import 'package:flutter/material.dart';
import 'package:homework_test/widgets/tab_bar_bottom.dart';

void main() {
  runApp(const HomeworkTest());
}

class HomeworkTest extends StatelessWidget {
  const HomeworkTest({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework Test',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFEF7FF),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 22.0),
          bodyMedium: TextStyle(fontSize: 20.0),
          bodySmall: TextStyle(fontSize: 18.0),
        ),
      ),
      home: const TabBarBottom(),
    );
  }
}
