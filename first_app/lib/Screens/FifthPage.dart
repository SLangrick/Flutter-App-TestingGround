import 'package:first_app/Classes/SwipeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> with TickerProviderStateMixin {
  List<SwipeCard> welcomeImages = [
    new SwipeCard(1, "assets/hills.png", "hill"),
    new SwipeCard(1, "assets/sun.png", "sun"),
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller; //Use this to trigger swap.

    return new Scaffold(
      appBar: AppBar(
          leading: Icon(Icons.ac_unit_rounded), title: Text('Hello World')),
      body: new Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: new TinderSwapCard(
            orientation: AmassOrientation.BOTTOM,
            totalNum: welcomeImages.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 1.5,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 1,
            cardBuilder: (context, index) {
              return Card(
                child: Image.asset('${welcomeImages[index].imageString}'),
              );
            },
            cardController: controller = CardController(),
            swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //print("Card is LEFT swiping");
              } else if (align.x > 0) {
                //print("Card is RIGHT swiping");
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              print(orientation.toString());
              if (orientation == CardSwipeOrientation.LEFT) {
                print("Card is LEFT swiping");
                print(welcomeImages.length.toString() +
                    index.toString() +
                    welcomeImages[index].title);
              } else if (orientation == CardSwipeOrientation.RIGHT) {
                print("Card is RIGHT swiping");
                print(welcomeImages.length);
              }
              if (!(orientation == CardSwipeOrientation.RECOVER) &&
                  welcomeImages.length == index + 1) {
                print('All done');
                setState(() {
                  welcomeImages
                      .add(new SwipeCard(1, "assets/hills.png", "title"));
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
