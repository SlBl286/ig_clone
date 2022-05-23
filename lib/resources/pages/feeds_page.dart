import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone/resources/pages/chat_list_page.dart';
import 'package:ig_clone/resources/widgets/post_widget.dart';
import 'package:ig_clone/resources/widgets/story_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/feeds_controller.dart';

class FeedsPage extends NyStatefulWidget {
  final FeedsController controller = FeedsController();

  FeedsPage({Key? key}) : super(key: key);

  @override
  _FeedsPageState createState() => _FeedsPageState();
}

class _FeedsPageState extends NyState<FeedsPage> {
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(
            'Newsfeed',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                getImageAsset(
                  'icons/add.svg',
                ),
                width: 28,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  routeTo(ChatListPage.route);
                },
                child: SvgPicture.asset(
                  getImageAsset(
                    'icons/chat.svg',
                  ),
                  width: 28,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
          backgroundColor: Theme.of(context).backgroundColor,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Story(
                      isAddButton: true,
                    ),
                    Story(),
                    Story(),
                    Story(),
                    Story(),
                    Story(),
                  ]),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Post(),
                    Post(),
                    Post(),
                    Post(),
                    Post(),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
