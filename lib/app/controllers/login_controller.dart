import 'package:ig_clone/app/networking/auth_api_service.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class LoginController extends Controller {
  late AuthApiService _authApiService;
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
}
