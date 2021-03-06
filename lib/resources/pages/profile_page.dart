import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone/app/models/user.dart';
import 'package:ig_clone/resources/pages/profile_edit_page.dart';
import 'package:ig_clone/resources/pages/setting_page.dart';
import 'package:ig_clone/resources/widgets/loading_spinner_widget.dart';
import 'package:ig_clone/resources/widgets/story_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import '../../app/controllers/profile_controller.dart';

class ProfilePage extends NyStatefulWidget {
  final ProfileController controller = ProfileController();

  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends NyState<ProfilePage>
    with TickerProviderStateMixin {
  User? _user;
  String? _userToken = "";
  late TabController _tabController;
  bool? _onPopReload;
  @override
  init() async {
    _tabController = TabController(length: 3, vsync: this);
    _user = await NyStorage.read('user', model: new User());
    _userToken = await NyStorage.read('user_token');
    setState(() {});
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _onRefresh() async {
    _user = await widget.controller.getUser();
    imageCache.clear();
    imageCache.clearLiveImages();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Theme(
        data: ThemeData(
          useMaterial3: true,
          primaryColor: Theme.of(context).primaryColor,
          appBarTheme: Theme.of(context).appBarTheme,
        ),
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: SvgPicture.asset(
                        getImageAsset(
                          'icons/lock.svg',
                        ),
                        width: 15,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      _user != null
                          ? _user!.nickname != null
                              ? _user!.nickname!
                              : 'Nickname'
                          : 'Nickname',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            context: context,
                            builder: (context) => Container(
                                  color: Theme.of(context).backgroundColor,
                                  height: 300,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: SvgPicture.asset(
                                            getImageAsset('icons/minus.svg'),
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 40),
                                      ),
                                      Container(
                                        child: Text(
                                          "T???o",
                                          style: TextStyle(
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Divider(),
                                      InkWell(
                                        onTap: () async {
                                          pop();
                                          Future.delayed(
                                              Duration(milliseconds: 500), () {
                                            routeTo(SettingPage.route);
                                          });
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(children: [
                                            SvgPicture.asset(
                                                getImageAsset(
                                                    'icons/gallery.svg'),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                height: 25),
                                            SizedBox(width: 15),
                                            Text(
                                              'b??i vi???t',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(children: [
                                            SvgPicture.asset(
                                                getImageAsset(
                                                    'icons/short_video.svg'),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                height: 25),
                                            SizedBox(width: 15),
                                            Text(
                                              'Th?????c film',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(children: [
                                            Image.asset(
                                                getImageAsset(
                                                    'icons/story.png'),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                height: 25),
                                            SizedBox(width: 15),
                                            Text(
                                              'Tin',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(children: [
                                            SvgPicture.asset(
                                                getImageAsset('icons/book.svg'),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                height: 25),
                                            SizedBox(width: 15),
                                            Text(
                                              'H?????ng d???n',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                      },
                      child: SvgPicture.asset(
                        getImageAsset(
                          'icons/add.svg',
                        ),
                        width: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            context: context,
                            builder: (context) => Container(
                                  color: Theme.of(context).backgroundColor,
                                  height: 220,
                                  child: Column(
                                    children: [
                                      Container(
                                        child: SvgPicture.asset(
                                            getImageAsset('icons/minus.svg'),
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 40),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          pop();
                                          Future.delayed(
                                              Duration(milliseconds: 500), () {
                                            routeTo(SettingPage.route);
                                          });
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(children: [
                                            SvgPicture.asset(
                                                getImageAsset(
                                                    'icons/settings.svg'),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                height: 25),
                                            SizedBox(width: 15),
                                            Text(
                                              'C??i ?????t',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(children: [
                                            SvgPicture.asset(
                                                getImageAsset(
                                                    'icons/story_save.svg'),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                height: 25),
                                            SizedBox(width: 15),
                                            Text(
                                              'L??u tr???',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(children: [
                                            SvgPicture.asset(
                                                getImageAsset(
                                                    'icons/bookmark.svg'),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                height: 25),
                                            SizedBox(width: 15),
                                            Text(
                                              '???? l??u',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                          child: Row(children: [
                                            SvgPicture.asset(
                                                getImageAsset('icons/star.svg'),
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                height: 25),
                                            SizedBox(width: 15),
                                            Text(
                                              'Y??u th??ch',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ));
                      },
                      child: SvgPicture.asset(
                        getImageAsset(
                          'icons/more_line.svg',
                        ),
                        width: 28,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
                backgroundColor: Theme.of(context).backgroundColor,
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.only(right: 25),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: _user != null
                                  ? _user!.avatar != null
                                      ? Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  getEnv("API_BASE_URL") +
                                                      "cdn/" +
                                                      _user!.avatar!,
                                                  headers: {
                                                    'Authorization':
                                                        'Bearer ' + _userToken!,
                                                  }),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      : Image.asset(
                                          getImageAsset(
                                              'icons/man_no_avatar.png'),
                                        )
                                  : Container(
                                      child: LoadingSpinner(
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 80,
                                  child: Column(children: [
                                    Text(
                                      _user != null
                                          ? _user!.followers!.length.toString()
                                          : "10",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "B??i vi???t",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Text(
                                        _user != null
                                            ? _user!.followers!.length
                                                .toString()
                                            : "10k",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Ng?????i theo d??i",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  child: Column(children: [
                                    Text(
                                      _user != null
                                          ? _user!.followers!.length.toString()
                                          : "1",
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "??ang theo d??i",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _user != null
                            ? _user!.name != null
                                ? _user!.name!
                                : "Name"
                            : "Name",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        _user != null
                            ? _user!.bio != null
                                ? _user!.bio!
                                : "bio"
                            : "bio",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              _onPopReload =
                                  await routeTo(ProfileEditPage.route);

                              setState(() {
                                _onPopReload = true;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 100,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: Text(
                                "Ch???nh s???a trang c?? nh??n",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 45,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              child: SvgPicture.asset(
                                  getImageAsset('icons/more_user.svg'),
                                  width: 20,
                                  height: 15,
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: SingleChildScrollView(
                          child: Row(
                        children: [
                          Story(
                            isAddButton: true,
                          )
                        ],
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          TabBar(
                            indicatorColor: Theme.of(context).primaryColor,
                            controller: _tabController,
                            tabs: [
                              Tab(
                                child: SvgPicture.asset(
                                  getImageAsset('icons/gallery.svg'),
                                  color: Theme.of(context).primaryColor,
                                  width: 25,
                                ),
                              ),
                              Tab(
                                child: SvgPicture.asset(
                                  getImageAsset('icons/short_video.svg'),
                                  color: Theme.of(context).primaryColor,
                                  width: 25,
                                ),
                              ),
                              Tab(
                                child: SvgPicture.asset(
                                  getImageAsset('icons/tag.svg'),
                                  color: Theme.of(context).primaryColor,
                                  width: 25,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                Container(
                                  child: GridView.count(
                                    primary: false,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2,
                                    crossAxisCount: 3,
                                    clipBehavior: Clip.antiAlias,
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          getImageAsset('1308931.jpg'),
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                          getImageAsset('1308931.jpg'),
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                          getImageAsset('1308931.jpg'),
                                        ),
                                      ),
                                      Container(
                                        child: Image.asset(
                                          getImageAsset('1308931.jpg'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: SvgPicture.asset(
                                    getImageAsset('icons/short_video.svg'),
                                    width: 100,
                                  ),
                                ),
                                Center(
                                  child: SvgPicture.asset(
                                    getImageAsset('icons/tag.svg'),
                                    width: 100,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
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
