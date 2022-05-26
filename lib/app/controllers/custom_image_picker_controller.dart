import 'dart:io';

import 'package:ig_clone/app/models/files.dart';
import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/app/networking/user_api_service.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class CustomImagePickerController extends Controller {
  UserApiService _userApiService = UserApiService();
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<Files> getFiles() async {
    return await Files.fromJson({});
  }

  Future<User?> updateAvatar(File media) async {
    var updatedUser = await _userApiService.updateAvatar(media);
    return updatedUser;
  }
}
