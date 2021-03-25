import 'package:flutter/material.dart';
import 'Api.dart';

class Initial extends StatefulWidget {
  @override
  _InitialState createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  Widget build(BuildContext context) {
    Api api = Api();
    api.search("");

    return Container(
      child: Center(
        child: Text('Initial')
      )
    );
  }
}
