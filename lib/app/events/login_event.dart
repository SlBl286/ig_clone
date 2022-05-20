import 'package:ig_clone/app/models/user.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoginEvent implements NyEvent {
  final listeners = {
    DefaultListener: DefaultListener(),
  };
}

class DefaultListener extends NyListener {
  handle(dynamic event) async {
    String user_token = event['user_token'];
    await NyStorage.store('user_token', user_token);
    await NyStorage.store('key_expire_day',
        DateTime.now().add(Duration(days: 7)).toIso8601String());
  }
}
