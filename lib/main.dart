import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;
import 'package:youtube_bar/Home.dart';

void main() async {
  await DotEnv.load(fileName: '.env');
  runApp(MaterialApp(
    title: 'Youtube bar',
    debugShowCheckedModeBanner: false,
    home: Home()
  ));
}

