import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:socket_io_client/socket_io_client.dart';
import '../../app/controllers/chat_list_controller.dart';

class ChatListPage extends NyStatefulWidget {
  static const String route = '/chat_list_page';
  final ChatListController controller = ChatListController();

  ChatListPage({Key? key}) : super(key: key);

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends NyState<ChatListPage> {
  
  @override
  init() async {
    super.init();
   
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
        behavior: MaterialScrollBehavior(
            androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Text(
                '',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              actions: [],
            ),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
              ),
            )
          ],
        ));
  }
}
