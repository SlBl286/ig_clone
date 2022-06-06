import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
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
  String? _initImagePath;
  String? _userToken;
  List<File?> _test = [];
  @override
  init() async {
    _userToken = await NyStorage.read('user_token');
    _initImagePath = await widget.data();
    await getPath_2();
    setState(() {});

    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getPath_2() async {
    var path = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DCIM);
    print(path);
    var picDir = Directory(path);

    var picDirItems = await picDir.list(recursive: true).toList();

    for (var element in picDirItems) {
      if (element is File) {
        var file = File(element.path);

        file.path.contains('.png') || file.path.contains('.jpg')
            ? _test.add(file)
            : null;
      }
    }
  }

  Future<File?> pickImage({
    required bool isGallery,
    required Future<File?> Function(File) crop,
  }) async {
    final source = isGallery ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );

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
          child: SingleChildScrollView(
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
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container());
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Thư viện",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: Theme.of(context).primaryColor,
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
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            child: Image.file(
                              _image!,
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            child: _initImagePath != null
                                ? Image.network(
                                    getEnv("API_BASE_URL") +
                                        "cdn/" +
                                        _initImagePath!,
                                    fit: BoxFit.fitWidth,
                                    headers: {
                                        'Authorization':
                                            'Bearer ' + _userToken!,
                                      })
                                : Image.asset(
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
                  height: MediaQuery.of(context).size.height,
                  child: _test.length > 0
                      ? GridView.count(
                          crossAxisCount: 3,
                          mainAxisSpacing: 3,
                          crossAxisSpacing: 3,
                          children: _test
                              .map(
                                (e) => Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.width,
                                    child: Image.file(
                                      e!,
                                      fit: BoxFit.fitWidth,
                                    )),
                              )
                              .toList(),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
