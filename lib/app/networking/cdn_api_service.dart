import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ig_clone/app/networking/dio/base_api_service.dart';
import 'package:nylo_framework/nylo_framework.dart';

class CdnApiService extends BaseApiService {
  CdnApiService({BuildContext? buildContext}) : super(buildContext);

  @override
  String get baseUrl => getEnv('API_BASE_URL');

  Future<dynamic> upload(File file) async {
    return await network(
      request: (request) => request.post('cdn/uplaod'),
    );
  }
}
