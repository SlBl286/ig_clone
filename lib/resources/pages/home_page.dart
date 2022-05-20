import 'package:flutter/material.dart';
import 'package:ig_clone/app/controllers/home_controller.dart';
import 'package:ig_clone/resources/pages/feeds_page.dart';
import 'package:ig_clone/resources/pages/notification_page.dart';
import 'package:ig_clone/resources/pages/post_page.dart';
import 'package:ig_clone/resources/pages/profile_page.dart';
import 'package:ig_clone/resources/pages/search_page.dart';
import 'package:ig_clone/resources/widgets/bottom_navbar_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
      body: SafeArea(child: _buildBody(_selectedIndex)),
      bottomNavigationBar: BottomNavBarWidget(
        items: [
          BottomNavBarItem(index: 0, icon: MdiIcons.homeOutline),
          BottomNavBarItem(index: 1, icon: Icons.search),
          // BottomNavBarItem(index: 3, icon: Icons.play_circle_outline),
          BottomNavBarItem(index: 3, icon: MdiIcons.heartOutline),
          BottomNavBarItem(index: 4, icon: Icons.person_outline_outlined),
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
