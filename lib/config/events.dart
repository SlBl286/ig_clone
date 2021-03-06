import 'package:ig_clone/app/events/login_event.dart';
import 'package:ig_clone/app/events/logout_event.dart';
import 'package:ig_clone/app/events/save_user_event.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| Events
| Add your "app/events" here.
| Events can be fired using: event<MyEvent>();
|
| Learn more: https://nylo.dev/docs/3.x/events
|--------------------------------------------------------------------------
*/

final Map<Type, NyEvent> events = {
  LoginEvent: LoginEvent(),
  LogoutEvent: LogoutEvent(),
  SaveUserEvent: SaveUserEvent(),
};
