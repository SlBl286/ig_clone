import 'package:flutter/material.dart';

import 'package:ig_clone/app/controllers/home_controller.dart';
import 'package:ig_clone/config/theme.dart';
import 'package:ig_clone/resources/pages/chat_list_page.dart';
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
            child: PageView(
              children: [
                _buildBody(_selectedIndex),
                if (_selectedIndex == 0) ChatListPage(),
              ],
            ),
          ),
        ],
      ),
      bottomSheet: Theme(
        data: Theme.of(context).copyWith(
          backgroundColor: _selectedIndex == 2
              ? ThemeConfig.dark().colors.background
              : Theme.of(context).backgroundColor,
          primaryColor: _selectedIndex == 2
              ? ThemeConfig.dark().colors.primaryContent
              : Theme.of(context).primaryColor,
        ),
        child: BottomNavBarWidget(
          items: [
            BottomNavBarItem(
              index: 0,
              unselectedImage: getImageAsset("icons/home.svg"),
              selectedImage: getImageAsset("icons/home_selected.svg"),
            ),
            BottomNavBarItem(
              index: 1,
              unselectedImage: getImageAsset("icons/search.svg"),
              selectedImage: getImageAsset("icons/search_selected.svg"),
            ),
            BottomNavBarItem(
              index: 2,
              unselectedImage: getImageAsset("icons/short_video.svg"),
              selectedImage: getImageAsset("icons/short_video_selected.svg"),
            ),
            BottomNavBarItem(
              index: 3,
              unselectedImage: getImageAsset("icons/heart.svg"),
              selectedImage: getImageAsset("icons/heart_selected.svg"),
            ),
            BottomNavBarItem(
              isImage: true,
              index: 4,
              unselectedImage: getImageAsset("icons/man_no_avatar.png"),
              selectedImage: getImageAsset("icons/man_no_avatar.png"),
            ),
          ],
          startIndex: _selectedIndex,
          onIndexChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
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
