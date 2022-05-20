import 'package:ig_clone/app/networking/user_api_service.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class FeedsController extends Controller {
  late UserApiService _userApiService = UserApiService();
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<dynamic> getUser() async {
    var res = await _userApiService.me();
    print(res);
    return res;
  }
}
