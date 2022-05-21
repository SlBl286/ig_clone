import 'package:ig_clone/app/models/dto/user_update_dto.dart';
import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/app/networking/user_api_service.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class ProfileEditController extends Controller {
  UserApiService _userApiService = UserApiService();
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<User?> updateUser(UserUpdateDto dto) async {
    var res = await _userApiService.updateMe(dto);
    return res;
  }
}
