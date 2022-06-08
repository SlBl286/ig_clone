import 'package:ig_clone/app/models/user.dart';
import 'package:nylo_framework/nylo_framework.dart';

class SaveUserEvent implements NyEvent {
  final listeners = {
    DefaultListener: DefaultListener(),
  };
}

class DefaultListener extends NyListener {
  handle(dynamic event) async {
    if (event['user'] is User) {
      User user = event['user'] as User;
      user.save('user');
      User test = await NyStorage.read('user', model: new User());
      print(test.name);
    }
  }
}
