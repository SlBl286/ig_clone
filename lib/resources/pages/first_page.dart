import 'package:flutter/material.dart';
import 'package:ig_clone/app/events/logout_event.dart';
import 'package:ig_clone/bootstrap/helpers.dart';
import 'package:ig_clone/resources/pages/home_page.dart';
import 'package:ig_clone/resources/pages/login_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/first_controller.dart';

class FirstPage extends NyStatefulWidget {
  final FirstController controller = FirstController();

  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends NyState<FirstPage> {
  @override
  init() async {
    await super.init();
    String? keyExpireDay = await NyStorage.read("key_expire_day");
    if (keyExpireDay != null) {
      if (DateTime.parse(keyExpireDay).isAfter(DateTime.now())) {
        routeTo(MyHomePage.route, navigationType: NavigationType.pushReplace);
      } else {
        event<LogoutEvent>();
            routeTo(LoginPage.route, navigationType: NavigationType.pushReplace);
      }}
      else{
            routeTo(LoginPage.route, navigationType: NavigationType.pushReplace);
      }
    

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Container()),
    );
  }
}
