import 'package:flutter/material.dart';
import 'package:swipe_words/constants.dart';

class HomeScreen extends StatelessWidget {
  final items = List<String>.generate(10000, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Swipe Cards"),
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              child: ListTile(
                title: Text(items[index]),
                trailing: Icon(Icons.arrow_right),
              ),
              margin: EdgeInsets.fromLTRB(16, 8, 16, 0),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: kPrimaryColor, width: 1)),
            );
          },
        ),
      ),
    );
  }
}
