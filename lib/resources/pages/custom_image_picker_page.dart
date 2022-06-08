import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ig_clone/app/utils/folder.dart';
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
  late String _folderName;
  dynamic _imageWidget;
  // late Future<List<File>> _fileFuture;
  @override
  init() async {
    _userToken = await NyStorage.read('user_token');
    _initImagePath = await widget.data();
    _folderName = "Thư viện";
    // _fileFuture = Future.value([]);
    var a = Image.file(_image!);
    var byteData =
        await rootBundle.load(getImageAsset("icons/man_no_avatar.png"));
    Uint8List lst = new Uint8List.view(byteData.buffer);
    var codec =
        await instantiateImageCodec(lst, targetHeight: 512, targetWidth: 512);
    var nextFrame = await codec.getNextFrame();
    _imageWidget = nextFrame.image;
    var b = await ImageCropper.platform.cropImage(
        sourcePath: _image!.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        maxWidth: 512,
        maxHeight: 512,
        compressFormat: ImageCompressFormat.png);

    File(b!.path);
    setState(() {});
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // _reloadFile() async {
  //   if (_folderName == "Thư viện") {
  //     var dir = await ExternalPath.getExternalStoragePublicDirectory(
  //         ExternalPath.DIRECTORY_DCIM);
  //     setState(() {
  //       _fileFuture =
  //           Directory(dir).list(recursive: true).toList() as Future<List<File>>;
  //     });
  //   }
  //   var isFolderExist = await Directory(_folderName).exists();
  //   if (isFolderExist) {
  //     setState(() {
  //       _fileFuture = Directory(_folderName).list(recursive: false).toList()
  //           as Future<List<File>>;
  //     });
  //   }
  // }

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
                                builder: (context) => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1.2,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: FutureBuilder<List<String>>(
                                    future: FolderUtils.getFolderList(),
                                    builder: ((context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: snapshot.data!
                                              .map((e) => GestureDetector(
                                                    behavior: HitTestBehavior
                                                        .translucent,
                                                    onTap: () {
                                                      setState(() {
                                                        _folderName = e;
                                                      });
                                                    },
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 20),
                                                      child: Text(
                                                        e,
                                                        style: TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        );
                                      } else {
                                        return LoadingSpinner();
                                      }
                                    }),
                                  ),
                                ),
                              );
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
                  // child: FutureBuilder<List<File>>(
                  //   future: _fileFuture,
                  //   initialData: [],
                  //   builder: (context, snapshot) {
                  //     return Container();
                  //   },
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}