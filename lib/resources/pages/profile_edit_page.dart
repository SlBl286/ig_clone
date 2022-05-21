import 'package:flutter/material.dart';
import 'package:ig_clone/app/models/dto/user_update_dto.dart';
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
  @override
  init() async {}

  @override
  void dispose() {
    super.dispose();
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
                      if (res != null) pop();
                      
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
                      color: Colors.red,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Đổi ảnh đại diện",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ]),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _name = null;
                            _name = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Tên",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _nickName = null;
                            _nickName = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Tên người dùng",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _website = null;
                            _website = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Trang web",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _bio = null;
                            _bio = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Tiểu sử",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                        style: TextStyle(color: Colors.white),
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
