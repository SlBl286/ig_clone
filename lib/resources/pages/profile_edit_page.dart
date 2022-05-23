import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone/app/models/dto/user_update_dto.dart';
import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/resources/pages/custom_image_picker_page.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/profile_edit_controller.dart';

class ProfileEditPage extends NyStatefulWidget {
  static const route = 'profile_edit_page';
  final ProfileEditController controller = ProfileEditController();

  ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends NyState<ProfileEditPage> {
  String? _name;
  String? _nickName;
  String? _website;
  String? _bio;
  User? _user;
  @override
  init() async {
    _user = await widget.controller.getUser();
    setState(() {
      _name = _user?.name;
      _nickName = _user?.nickname;
      _website = _user?.website;
      _bio = _user?.bio;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  showAvatarPickerDialog(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      context: context,
      backgroundColor: Theme.of(context).backgroundColor,
      builder: (BuildContext context) {
        return Container(
          height: 280,
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
                    FocusScope.of(context).unfocus();
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "Chỉnh sửa trang cá nhân",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      var res = await widget.controller.updateUser(
                          UserUpdateDto.fromJson({
                        "name": _name,
                        "nickName": _nickName,
                        "bio": _bio,
                        "website": _website
                      }));
                      if (res != null) {
                        pop();
                      }
                    },
                    icon: Icon(
                      Icons.done,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Container(
                child: Column(children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(
                      getImageAsset("icons/man_no_avatar.png"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      showAvatarPickerDialog(context);
                    },
                    child: Text(
                      "Đổi ảnh đại diện",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller:
                            TextEditingController(text: _user?.name ?? ""),
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _name = null;
                            _name = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Tên",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withAlpha(150)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller:
                            TextEditingController(text: _user?.nickname ?? ""),
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _nickName = null;
                            _nickName = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Tên người dùng",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withAlpha(150)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller:
                            TextEditingController(text: _user?.website ?? ""),
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _website = null;
                            _website = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Trang web",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withAlpha(150)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        controller:
                            TextEditingController(text: _user?.bio ?? ""),
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _bio = null;
                            _bio = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Tiểu sử",
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withAlpha(150)),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        style: TextStyle(color: Theme.of(context).primaryColor),
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
