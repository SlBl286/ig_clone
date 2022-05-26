import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone/resources/widgets/loading_spinner_widget.dart';
import 'package:ig_clone/resources/widgets/square_hole.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/custom_image_picker_controller.dart';

class CustomImagePickerPage extends NyStatefulWidget {
  static const String route = '/custom_image_picker_page';
  final CustomImagePickerController controller = CustomImagePickerController();

  CustomImagePickerPage({Key? key}) : super(key: key);

  @override
  _CustomImagePickerPageState createState() => _CustomImagePickerPageState();
}

class _CustomImagePickerPageState extends NyState<CustomImagePickerPage> {
  File? _image;
  bool _uploading = false;
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  Future<File?> pickImage({
    required bool isGallery,
    required Future<File?> Function(File) crop,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) {
      return null;
    }
    if (crop == null)
      return File(pickedFile.path);
    else {
      final file = File(pickedFile.path);
      return crop(file);
    }
  }

  Future<File?> crop(File file) async {
    var croppedImage = await ImageCropper().cropImage(
      sourcePath: file.path,
      aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    );
    return File(croppedImage!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      pop();
                    },
                    icon: Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                "Chọn ảnh",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _uploading
                            ? Container(
                                padding: EdgeInsets.all(10),
                                child: LoadingSpinner(
                                  color: Colors.blue,
                                  size: 30,
                                ),
                              )
                            : IconButton(
                                onPressed: () async {
                                  setState(() {
                                    _uploading = true;
                                  });
                                  if (_image != null) {
                                    var user = await widget.controller
                                        .updateAvatar(_image!);
                                    if (user != null) {
                                      pop();
                                    }
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  _image != null
                      ? Image.file(
                          _image!,
                          fit: BoxFit.contain,
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            getImageAsset('icons/man_no_avatar.png'),
                          ),
                        ),
                  CustomPaint(
                    painter:
                        HolePainter(width: MediaQuery.of(context).size.width),
                    child: Container(),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () async {
                        _image = await pickImage(isGallery: true, crop: crop);
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 20,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withAlpha(100),
                        ),
                        child: Text("Chọn ảnh từ thư viện"),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        _image = await pickImage(isGallery: false, crop: crop);
                        setState(() {});
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width - 20,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.withAlpha(100),
                        ),
                        child: Text("Chụp ảnh mới"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
