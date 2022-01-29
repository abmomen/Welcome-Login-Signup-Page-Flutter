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
              child: InkWell(
                splashColor: kPrimaryLightColor,
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: Column(
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                        "Word List: " + (index + 1).toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                      ),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                        "7 Mastered out of 10",
                        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                        ),
                      ),
                      margin: EdgeInsets.fromLTRB(16, 10, 16, 0)
                      ),
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          backgroundColor: kPrimaryLightColor,
                          color: kPrimaryColor,
                          value: 0.70,
                          minHeight: 20,
                        ),
                      ),
                      margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    ),
                  ],
                ),
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
