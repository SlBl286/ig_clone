import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ig_clone/app/models/dto/user_update_dto.dart';
import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/app/networking/dio/base_api_service.dart';
import 'package:ig_clone/app/networking/dio/interceptors/bearer_auth_interceptor.dart';
import 'package:nylo_framework/nylo_framework.dart';

class UserApiService extends BaseApiService {
  UserApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  final interceptors = {BearerAuthInterceptor: BearerAuthInterceptor()};
  Future<User?> me() async {
    return await network<User>(
      request: (request) => request.get("/users/me"),
      handleFailure: (error) {
        print(error);
      },
    );
  }

  Future<User?> updateMe(UserUpdateDto dto) async {
    return await network<User>(
        request: (request) => request.put("/users/me", data: dto.toJson()));
  }

  Future updateAvatar(File file) async {
    final random = Random();
    final name = '${random.nextInt(1000000)}';
    final path = 'avatars/$name';
    final url = 'users/avatar';
    final formData = FormData.fromMap({
      'media': await MultipartFile.fromFile(file.path, filename: name),
    });
    return await network<User>(
      request: (request) => request.put(url, data: formData),
    );
  }
}
