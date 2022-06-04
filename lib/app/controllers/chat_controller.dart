import 'package:nylo_framework/nylo_framework.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class ChatController extends Controller {
  Socket socket = io(getEnv('API_BASE_URL')); 
  construct(BuildContext context) {
    super.construct(context);
    socket.onConnect((data) {
      print('connected');
    });
    socket.onDisconnect((data) => print('disconnected'));
    socket.on('message', (data) => print(data));
    socket.on('users', (data) => print(data));
    
  }

} 
