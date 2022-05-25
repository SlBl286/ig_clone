import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/chat_controller.dart';

class ChatPage extends NyStatefulWidget {
  static const String route = '/chat_page';
  final ChatController controller = ChatController();

  ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends NyState<ChatPage> {
  var rnd = Random();
  var size = 10;
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  List<bool> _getRandomList(int length) {
    return List<bool>.generate(length, (index) => rnd.nextBool());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.width + 40,
              color: Colors.grey,
              child: Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 3)),
              )),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            child: _buildRect(
              context,
              size,
              _getRandomList(size * (size + 1) * 2),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildRect(
  BuildContext context,
  int size,
  List<bool> border,
) {
  double boxSize = (MediaQuery.of(context).size.width - 20) / size;
  bool isRow = true;
  int currentPosition = 0;
  List<Widget> item = [];
  List<Widget> result = [];
  for (var i = 0; i <= size + size; i++) {
    if (isRow) {
      for (var j = 0; j < size; j++) {
        if (border[currentPosition]) {
          if (j == 0) {
            item.add(
              Container(
                color: Colors.black,
                width: boxSize,
                height: 3,
              ),
            );
          } else
            item.add(
              Container(
                color: Colors.black,
                width: boxSize - 3,
                height: 3,
              ),
            );
        } else {
          if (j == 0)
            item.add(
              Container(
                color: Colors.transparent,
                width: boxSize,
                height: 3,
              ),
            );
          else
            item.add(
              Container(
                color: Colors.transparent,
                width: boxSize - 3,
                height: 3,
              ),
            );
        }

        currentPosition += 1;
      }
    } else {
      for (var j = 0; j <= size; j++) {
        if (border[currentPosition]) {
          if (j == size)
            item.add(
              Container(
                color: Colors.black,
                width: 3,
                height: boxSize - 6,
              ),
            );
          if (j == 0) {
            item.add(
              Container(
                margin: EdgeInsets.only(right: boxSize - 6),
                color: Colors.black,
                width: 3,
                height: boxSize - 6,
              ),
            );
          } else
            item.add(
              Container(
                margin: EdgeInsets.only(right: boxSize - 6),
                color: Colors.black,
                width: 3,
                height: boxSize - 6,
              ),
            );
        } else {
          if (j == size)
            item.add(
              Container(
                color: Colors.transparent,
                width: 3,
                height: boxSize - 6,
              ),
            );
          if (j == 0) {
            item.add(
              Container(
                margin: EdgeInsets.only(right: boxSize - 6),
                color: Colors.black,
                width: 3,
                height: boxSize,
              ),
            );
          } else
            item.add(
              Container(
                margin: EdgeInsets.only(right: boxSize - 6),
                color: Colors.transparent,
                width: 3,
                height: boxSize,
              ),
            );
        }
        currentPosition += 1;
      }
    }

    result.add(
      Row(
        children: item,
      ),
    );
    isRow = !isRow;
    item = [];
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: result,
  );
}
