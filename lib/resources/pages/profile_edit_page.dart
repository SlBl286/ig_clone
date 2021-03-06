import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone/app/models/dto/user_update_dto.dart';
import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/resources/pages/custom_image_picker_page.dart';
import 'package:ig_clone/resources/widgets/loading_spinner_widget.dart';
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
  TextEditingController? _nameController;
  TextEditingController? _nickNameController;
  TextEditingController? _websiteController;
  TextEditingController? _bioController;
  bool _updating = false;
  @override
  init() async {
    _user = await widget.controller.getUser();
    setState(() {
      _name = _user?.name;
      _nickName = _user?.nickname;
      _website = _user?.website;
      _bio = _user?.bio;
      _nameController = TextEditingController(text: _name);
      _nickNameController = TextEditingController(text: _nickName);
      _websiteController = TextEditingController(text: _website);
      _bioController = TextEditingController(text: _bio);
    });

    super.init();
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
                  "?????i ???nh ?????i di???n",
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
                    pop();
                    routeTo(CustomImagePickerPage.route, data: _user!.avatar);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "???nh ?????i di???n m???i",
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
                      "L???y ???nh t??? facebook",
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
                      "G??? ???nh ?????i di???n",
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
                    "Ch???nh s???a trang c?? nh??n",
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      setState(() {
                        _updating = true;
                      });
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
                    icon: _updating
                        ? LoadingSpinner(
                            color: Colors.blue,
                          )
                        : Icon(
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
                      "?????i ???nh ?????i di???n",
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
                        controller: _nameController,
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _name = null;
                            _name = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "T??n",
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
                        controller: _nickNameController,
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty) _nickName = null;
                            _nickName = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "T??n ng?????i d??ng",
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
                        controller: _websiteController,
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
                        controller: _bioController,
                        onChanged: (text) {
                          setState(() {
                            if (text.isEmpty)
                              _bio = null;
                            else
                              _bio = text;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Ti???u s???",
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
