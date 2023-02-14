import 'package:flutter/material.dart';
import './passenger/explore.dart';

void main() {
  runApp(const MyApp());
}
//TODO implement pagecontroller/pageview to navigate to pages 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Explore(),
    );
  }
}

