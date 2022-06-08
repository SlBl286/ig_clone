import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/app/networking/user_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class ProfileController extends Controller {
  User? user;
  UserApiService _userApiService = UserApiService();
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<User?> getUser() async {
    var res = await NyStorage.read('user');
    user = User.fromJson(res);
    print(user!.toJson());
    return user;
  }
}
