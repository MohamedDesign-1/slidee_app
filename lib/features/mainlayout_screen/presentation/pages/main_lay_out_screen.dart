import 'package:flutter/material.dart';

class MainLayOutScreen extends StatelessWidget {
  const MainLayOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          children: [
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ]
      ),
    );
  }
}
