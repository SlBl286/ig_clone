import 'package:ig_clone/app/models/files.dart';

import 'controller.dart';
import 'package:flutter/widgets.dart';

class CustomImagePickerController extends Controller {
  construct(BuildContext context) {
    super.construct(context);
  }

  Future<Files> getFiles() async {
    return await Files.fromJson({});
  }
}
