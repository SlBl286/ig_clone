import 'package:flutter/material.dart';
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
  late Socket _socket;
  @override
  init() async {
    await initSocket();
    super.init();
  }

  Future<void> initSocket() async {
    try {
      _socket = io(
          "http://192.168.1.40:2203",
          OptionBuilder()
              .setTransports(['websocket'])
              .disableAutoConnect()
              .build());
      _socket.connect().onConnectError((data) => print(data));
      _socket.onConnect((data) {
        print('connected');
      });
      _socket.on('message', (data) {
        print(data);
      });
      _socket.onDisconnect((data) => print("disconnected"));
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        useMaterial3: true,
      ),
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
            actions: [
              IconButton(
                icon: Icon(Icons.textsms_sharp),
                onPressed: () {
                  _socket
                      .emit('message', {"massage": "test", "haveLink": false});
                },
              ),
            ],
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
