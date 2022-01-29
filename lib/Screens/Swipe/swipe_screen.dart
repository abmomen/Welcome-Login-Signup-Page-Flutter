import 'package:flutter/material.dart';
import 'package:swipe_words/constants.dart';

class SwipeWords extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe Words"),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(child: Text("Swipe")),
    );
  }
}