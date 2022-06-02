import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ig_clone/app/models/dto/user_update_dto.dart';
import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/app/networking/dio/base_api_service.dart';
import 'package:ig_clone/app/networking/dio/interceptors/bearer_auth_interceptor.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';

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
    // var stream =
    // new http.ByteStream(Stream.castFrom(file.openRead()));
    final random = Random();
    final name = '${random.nextInt(1000000)}';
    final url = 'users/avatar';
    var mediaType = file.path.split(".").last == "jpeg"
        ? MediaType('image', 'jpeg')
        : MediaType('image', 'png');
    final formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(file.path,
          filename: name, contentType: mediaType),
    });
    return await network<User>(
      request: (request) => request.post(url, data: formData),
    ).catchError((error) {
      print(error);
    });
  }
}
