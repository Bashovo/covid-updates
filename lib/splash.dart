import 'dart:async';

import 'package:covid19/world.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => World())));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.1,
                right: MediaQuery.of(context).size.width * 0.1,
                top: MediaQuery.of(context).size.height * 0.23),
            child: Image.asset(
              'assets/images/bacteria.png',
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.40),
            child: Center(
                child: Text(
              "Covid-19 updates",
              style: TextStyle(fontSize: 25, color: Color(0xff46b29d)),
            )),
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.80),
            child: Center(
                child: Text(
              "Stay safe and always wear your mask",
              style: TextStyle(fontSize: 12),
            )),
          ),
        ],
      ),
    );
  }
}
