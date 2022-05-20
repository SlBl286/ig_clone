import 'package:nylo_framework/nylo_framework.dart';

class LogoutEvent implements NyEvent {
  final listeners = {DefaultListener: DefaultListener()};
}

class DefaultListener extends NyListener {
  handle(dynamic event) async {
    await NyStorage.delete('user_token');
    await NyStorage.delete('key_expire_day');
  }
}
