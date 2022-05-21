import 'package:flutter/material.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/chat_controller.dart';

class ChatPage extends NyStatefulWidget {
  final ChatController controller = ChatController();
  
  ChatPage({Key? key}) : super(key: key);
  
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends NyState<ChatPage> {

  @override
  init() async {
  
  }
  
  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: SafeArea(
        child: Container()
      ),
    );
  }
}
