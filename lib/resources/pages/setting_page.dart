
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone/app/events/logout_event.dart';
import 'package:ig_clone/bootstrap/helpers.dart';
import 'package:ig_clone/resources/pages/login_page.dart';
import 'package:ig_clone/resources/widgets/menu_item_widget.dart'
    as menu_item_widget;
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/setting_controller.dart';

class SettingPage extends NyStatefulWidget {
  static const String route = '/setting';
  final SettingController controller = SettingController();

  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends NyState<SettingPage> {
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ScrollConfiguration(
        behavior: const MaterialScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(
                'Cài đặt',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              pinned: true,
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Theme.of(context).backgroundColor,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withAlpha(100)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: SvgPicture.asset(
                              getImageAsset('icons/search.svg'),
                              height: 15,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          Text(
                            "Tìm kiếm",
                            style: TextStyle(
                              fontSize: 16,
                              color:
                                  Theme.of(context).primaryColor.withAlpha(150),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          menu_item_widget.MenuItem(
                            title: 'Thông báo',
                            svgAsset: getImageAsset('icons/bell.svg'),
                            onTap: () {},
                          ),
                          menu_item_widget.MenuItem(
                            title: 'Quyền riêng tư',
                            svgAsset: getImageAsset('icons/lock.svg'),
                            onTap: () {},
                          ),
                          menu_item_widget.MenuItem(
                            title: 'Bảo mật',
                            svgAsset: getImageAsset('icons/security.svg'),
                            onTap: () {},
                          ),
                          menu_item_widget.MenuItem(
                            title: 'Tài khoản',
                            svgAsset: getImageAsset('icons/user.svg'),
                            onTap: () {},
                          ),
                          menu_item_widget.MenuItem(
                            title: 'Giới thiệu',
                            svgAsset: getImageAsset('icons/info.svg'),
                            onTap: () {},
                          ),
                          menu_item_widget.MenuItem(
                            title: 'Chủ đề',
                            svgAsset: getImageAsset('icons/theme.svg'),
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Đăng nhập",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 25),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                "Thêm hoặc chuyển tài khoản",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => Dialog(
                                        backgroundColor:
                                            Theme.of(context).backgroundColor,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        child: Container(
                                          width: 150,
                                          height: 120,
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                "Đăng xuất khỏi ig_clone?",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              )),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    FlatButton(
                                                      onPressed: () {
                                                        pop();
                                                      },
                                                      child: Text(
                                                        "Hủy",
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                    ),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        pop();
                                                        pop();
                                                        routeTo(LoginPage.route,
                                                            navigationType:
                                                                NavigationType
                                                                    .pushReplace);
                                                        event<LogoutEvent>();
                                                      },
                                                      child: Text(
                                                        "Đồng ý",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                              // routeTo(LoginPage.route);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                "Đăng xuất ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,
                              height: 30,
                              child: Text(
                                "Đăng xuất tất cả các tài khoản",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
