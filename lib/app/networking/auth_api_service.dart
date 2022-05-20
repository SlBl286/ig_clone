import 'package:flutter/material.dart';
import 'package:ig_clone/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class AuthApiService extends BaseApiService {
  AuthApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<dynamic> sigin(String email, String password) async {
    var res = await network(
      request: (request) => request.post('auth/signin', data: {
        'email': email,
        'password': password,
      }),
    );
    return res;
  }

  Future<String> signup(String email, String password) async {
    return await network(
      request: (request) => request.post('auth/signup', data: {
        'email': email,
        'password': password,
      }),
    );
  }
}
