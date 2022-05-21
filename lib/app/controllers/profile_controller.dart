import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/app/networking/user_api_service.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class ProfileController extends Controller {
  User? user;
  UserApiService _userApiService = UserApiService();
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<User?> getUser() async {
    user = await _userApiService.me();
    print(user!.toJson());
    return user;
  }
}
