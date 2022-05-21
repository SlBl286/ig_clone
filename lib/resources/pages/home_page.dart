import 'package:flutter/material.dart';

import 'package:ig_clone/app/controllers/home_controller.dart';
import 'package:ig_clone/resources/pages/feeds_page.dart';
import 'package:ig_clone/resources/pages/notification_page.dart';
import 'package:ig_clone/resources/pages/post_page.dart';
import 'package:ig_clone/resources/pages/profile_page.dart';
import 'package:ig_clone/resources/pages/search_page.dart';
import 'package:ig_clone/resources/widgets/bottom_navbar_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MyHomePage extends NyStatefulWidget {
  static const String route = "/home";
  final HomeController controller = HomeController();

  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends NyState<MyHomePage> {
  bool _darkMode = false;
  int _selectedIndex = 0;
  @override
  init() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _buildBody(_selectedIndex),
          ),
        ],
      ),
      bottomSheet: BottomNavBarWidget(
        items: [
          BottomNavBarItem(
            index: 0,
            unselectedImage: getImageAsset("icons/home.png"),
            selectedImage: getImageAsset("icons/home_fill.png"),
          ),
          BottomNavBarItem(
            index: 1,
            unselectedImage: getImageAsset("icons/search.png"),
            selectedImage: getImageAsset("icons/search_selected.png"),
          ),
          BottomNavBarItem(
            index: 2,
            unselectedImage: getImageAsset("icons/video.png"),
            selectedImage: getImageAsset("icons/video_selected.png"),
          ),
          BottomNavBarItem(
            index: 3,
            unselectedImage: getImageAsset("icons/heart.png"),
            selectedImage: getImageAsset("icons/heart_fill.png"),
          ),
          BottomNavBarItem(
            index: 4,
            unselectedImage: getImageAsset("icons/story.png"),
            selectedImage: getImageAsset("icons/story.png"),
          ),
        ],
        startIndex: _selectedIndex,
        onIndexChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return FeedsPage();
      case 1:
        return SearchPage();
      case 2:
        return PostPage();
      case 3:
        return NotificationPage();
      case 4:
        return ProfilePage();
      default:
        return FeedsPage();
    }
  }
}
