import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipe_words/constants.dart';

class SwipeWords extends StatefulWidget {
  SwipeWords({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SwipeWords> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine _matchEngine;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: kPrimaryLightColor),
          likeAction: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            _scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: kPrimaryColor,
        ),
        body: Container(
            child: Column(children: [createCard(), createButtons()])));
  }

  Expanded createButtons() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: createNoButton()),
            SizedBox(width: 16),
            Expanded(child: createMasteredButton()),
            SizedBox(width: 16),
            Expanded(child: createYesButton()),
          ],
        ),
      ),
    );
  }

  Expanded createCard() {
    return Expanded(
      flex: 8,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Container(
          child: SwipeCards(
            matchEngine: _matchEngine,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: _swipeItems[index].content.color,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text("Abate",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28, 
                            fontFamily: 'Philosopher', 
                            fontStyle: FontStyle.italic, 
                            fontWeight: FontWeight.bold
                            ),
                        ),
                        SizedBox(height: 10),
                        Text("Become less intense or widespread.\nRemove or reduce law.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 22, 
                            fontFamily: 'Philosopher',
                            fontWeight: FontWeight.w500
                            ),
                        ),
                        SizedBox(height: 10),
                        Text("The storm suddenly abated.\nThis action would not have been sufficient to abate the odour nuisance.",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18, fontFamily: 'Philosopher'),
                        ),
                        SizedBox(height: 10),
                        Text("Subside, Lessen, Decrease, Diminish, Reduce, Ease",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, fontFamily: 'Philosopher'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            onStackFinished: () {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Stack Finished"),
                duration: Duration(milliseconds: 500),
              ));
            },
            itemChanged: (SwipeItem item, int index) {
              print("item: ${item.content.text}, index: $index");
            },
            upSwipeAllowed: true,
            fillSpace: true,
          ),
        ),
      ),
    );
  }

  ElevatedButton createYesButton() {
    return ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)))),
        onPressed: () {
          _matchEngine.currentItem.like();
        },
        child: Text("Known"));
  }

  ElevatedButton createMasteredButton() {
    return ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)))),
        onPressed: () {
          _matchEngine.currentItem.superLike();
        },
        child: Text("Mastered"));
  }

  ElevatedButton createNoButton() {
    return ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)))),
        onPressed: () {
          _matchEngine.currentItem.nope();
        },
        child: Text("Unknown"));
  }
}

class Content {
  final String text;
  final Color color;

  Content({this.text, this.color});
}
