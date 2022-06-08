import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/app/networking/auth_api_service.dart';
import 'package:ig_clone/app/networking/user_api_service.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class LoginController extends Controller {
  late AuthApiService _authApiService;
  User? user;
  UserApiService _userApiService = UserApiService();
  construct(BuildContext context) {
    super.construct(context);

    _authApiService = AuthApiService(buildContext: context);
  }

  Future<String> login(String email, String password) async {
    var res = await _authApiService.sigin(email, password).catchError((e) {
      print(e);
    });
    print(res);
    return res['access_token'];
  }

  Future<User?> getUser() async {
    user = await _userApiService.me();
    print(user!.toJson());
    return user;
  }
}
