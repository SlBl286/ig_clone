import 'package:flutter/material.dart';
import 'package:ig_clone/app/networking/dio/base_api_service.dart';
import 'package:ig_clone/app/networking/dio/interceptors/logging_interceptor.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| ApiService
| -------------------------------------------------------------------------
| Define your API endpoints
| Learn more https://nylo.dev/docs/3.x/networking
|--------------------------------------------------------------------------
*/

class ApiService extends BaseApiService {
  ApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  @override
  final interceptors = {LoggingInterceptor: LoggingInterceptor()};

  
}
