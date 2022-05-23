import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
  }

  showFolderPicker(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      backgroundColor: Theme.of(context).backgroundColor,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              Container(
                child: SvgPicture.asset(getImageAsset('icons/minus.svg'),
                    color: Theme.of(context).primaryColor, width: 40),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: Text(
                  "Đổi ảnh đại diện",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    routeTo(CustomImagePickerPage.route);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Ảnh đại diện mới",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Lấy ảnh từ facebook",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Gỡ ảnh đại diện",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  pop();
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
                            "Thư viện",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () async {},
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
        ]),
      )),
    );
  }
}
