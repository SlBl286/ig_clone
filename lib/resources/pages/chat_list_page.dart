import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
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
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
        child: Text("chat list page"),
      )),
    );
  }
}
