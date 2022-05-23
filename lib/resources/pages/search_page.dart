import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/search_controller.dart';

class SearchPage extends NyStatefulWidget {
  static const String route = "/search";
  final SearchController controller = SearchController();

  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends NyState<SearchPage> {
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withAlpha(100)),
                  child: Row(children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                        color: Theme.of(context).primaryColor.withAlpha(150),
                      ),
                    ),
                  ]),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                    crossAxisCount: 3,
                    children: [
                      Container(
                        child: Image.asset(
                          getImageAsset('1308931.jpg'),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          getImageAsset('icons/man_no_avatar.png'),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          getImageAsset('1308931.jpg'),
                        ),
                      ),
                      Container(
                        child: Image.asset(
                          getImageAsset('icons/woman_no_avatar.png'),
                        ),
                      ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
