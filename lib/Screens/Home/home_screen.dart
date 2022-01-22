import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe Cards"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(10,10,10,0),
          height: 220,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
          ),
        ),
      ),
    );
  }
}