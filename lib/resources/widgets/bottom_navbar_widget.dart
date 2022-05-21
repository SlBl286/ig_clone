import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';

class BottomNavBarWidget extends StatefulWidget {
  int startIndex;
  final List<BottomNavBarItem> items;
  final Function(int) onIndexChange;
  BottomNavBarWidget(
      {required this.startIndex,
      required this.items,
      required this.onIndexChange});
  @override
  _BottomNavBarWidgetState createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final int selectedOpacity = 255;
  final int unselectedOpacity = 150;
  final double iconSize = 27;
  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _index = widget.startIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.items
                .map((e) => GestureDetector(
                      onTap: (() async {
                        setState(() {
                          _index = e.index;
                          widget.startIndex = e.index;
                        });
                        widget.onIndexChange(e.index);
                      }),
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: _index == e.index
                            ? Image.asset((e.selectedImage),
                                width: iconSize,
                                color: Theme.of(context).primaryColor)
                            : Image.asset((e.unselectedImage),
                                width: iconSize,
                                color: Theme.of(context).primaryColor),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

class BottomNavBarItem {
  final int index;

  String unselectedImage;
  String selectedImage;
  BottomNavBarItem({
    required this.index,
    required this.selectedImage,
    required this.unselectedImage,
  });
}
