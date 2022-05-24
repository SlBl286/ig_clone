import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone/bootstrap/helpers.dart';
import 'package:ig_clone/config/theme.dart';
import 'package:ig_clone/resources/themes/styles/dark_theme_colors.dart';
import 'package:ig_clone/resources/widgets/short_video_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:video_player/video_player.dart';
import '../../app/controllers/post_controller.dart';

class PostPage extends NyStatefulWidget {
  final PostController controller = PostController();

  PostPage({Key? key}) : super(key: key);

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends NyState<PostPage> {
  @override
  init() async {
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: ThemeConfig.dark().colors.background,
      body: SafeArea(
        child: Container(
          child: PageView(
            scrollDirection: Axis.vertical,
            children: [
              ShortVideo(
                  videoUrl: getEnv("API_BASE_URL") + "cdn/file?mediaId=12"),
              ShortVideo(
                  videoUrl: getEnv("API_BASE_URL") + "cdn/file?mediaId=13"),
              ShortVideo(
                  videoUrl: getEnv("API_BASE_URL") + "cdn/file?mediaId=14"),
            ],
          ),
        ),
      ),
    );
  }
}
