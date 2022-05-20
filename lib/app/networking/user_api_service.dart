import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ig_clone/app/networking/dio/base_api_service.dart';
import 'package:ig_clone/app/networking/dio/interceptors/bearer_auth_interceptor.dart';
import 'package:nylo_framework/nylo_framework.dart';

class UserApiService extends BaseApiService {
  UserApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  final interceptors = {BearerAuthInterceptor: BearerAuthInterceptor()};
  Future<dynamic> me() async {
    return await network<dynamic>(
      request: (request) => request.get("/users/me"),
      handleFailure: (error) {
        print(error);
      },
    );
  }
}
