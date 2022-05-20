import 'package:flutter/material.dart';

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
  final double selectedIconSize = 40;
  final double unselectedIconSize = 30;
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
      margin: EdgeInsets.only(bottom: 15, right: 15, left: 15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 65,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(30)),
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
                        child: Icon(
                          e.icon,
                          size: _index == e.index
                              ? selectedIconSize
                              : unselectedIconSize,
                          color: Theme.of(context).backgroundColor.withAlpha(
                              _index == e.index
                                  ? selectedOpacity
                                  : unselectedOpacity),
                        ),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

class BottomNavBarItem {
  final int index;
  final IconData icon;
  BottomNavBarItem({
    required this.index,
    required this.icon,
  });
}
