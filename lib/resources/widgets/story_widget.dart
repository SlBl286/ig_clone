import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'dart:math';

class Story extends StatefulWidget {
  final bool isAddButton;
  Story({Key? key, this.isAddButton = false}) : super(key: key);

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends NyState<Story> {
  var rng = Random();
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.cyan,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.amber,
    Colors.deepOrange,
    Colors.brown,
    Colors.grey,
    Colors.indigoAccent,
    Colors.blueAccent,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.yellowAccent,
    Colors.orangeAccent,
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.cyanAccent,
    Colors.tealAccent,
    Colors.limeAccent,
    Colors.indigoAccent,
    Colors.lightBlueAccent,
    Colors.lightGreenAccent,
    Colors.amberAccent,
    Colors.deepOrangeAccent,
  ];
  @override
  Widget build(BuildContext context) {
    return !widget.isAddButton
        ? Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 90,
            height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 85,
                  height: 85,
                  decoration: BoxDecoration(
                    color: colors[rng.nextInt(colors.length)],
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 16,
                  child: Text(
                    "Name ${rng.nextInt(100)}",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            width: 90,
            height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 85,
                  height: 85,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    getImageAsset("icons/story.png"),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 16,
                  child: Text(
                    "Tin của bạn",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
