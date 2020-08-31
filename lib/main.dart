import 'package:flutter/material.dart';
import 'screen/HomeScr.dart';

void main() {
  runApp(AppInfluencer());
}
class AppInfluencer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
