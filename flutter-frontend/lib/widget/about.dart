import 'package:flutter/material.dart';

class About extends StatelessWidget {
  About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'About us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 45,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'This is a project made for the course DevOps and Cloud-based Software which is part of the \n master Software Engineering. This website can be used to show users all there investments in an easy and clear way. \n We hope you enjoy using it as much as we enjoyed making it.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
