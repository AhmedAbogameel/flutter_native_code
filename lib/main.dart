import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyView(),
    );
  }
}

class MyView extends StatefulWidget {
  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {

  String batteryLevel = '';

  @override
  void initState() {
    getBattery();
    super.initState();
  }

  static const channel = MethodChannel('battery');

  Future<void> getBattery() async {
    final battery = await channel.invokeMethod('getBattery');
    batteryLevel = battery.toString();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Battery Level is : ' + batteryLevel),
      ),
    );
  }
}

