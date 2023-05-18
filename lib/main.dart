import 'package:api_starting_flutter/example_five.dart';
import 'package:api_starting_flutter/example_three.dart';
import 'package:api_starting_flutter/example_two.dart';
import 'package:api_starting_flutter/exapmple_four.dart';
import 'package:api_starting_flutter/home_screen.dart';
import 'package:api_starting_flutter/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // posts api with PostsModel class
      // home: HomeScreen(),

      // photos api
      home: ExampleFive(),

    );
  }
}
