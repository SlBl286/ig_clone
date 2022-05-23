import 'package:flutter/material.dart';
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
  String _videoUrl = "http://192.168.1.40:2202/cdn/file?mediaId=13";
  late VideoPlayerController _videoController;
  @override
  init() async {
    _videoController = VideoPlayerController.network(_videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) {
        print(_videoController.value.aspectRatio);
        _videoController.play();
      });
    super.init();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GestureDetector(
          onVerticalDragEnd: ((details) {
            setState(() {
              _videoUrl = "http://192.168.1.40:2202/cdn/file?mediaId=12";
            });
          }),
          child: Container(
            height: _videoController.value.size.height,
            width: _videoController.value.size.width,
            alignment: Alignment.topCenter,
            child: _videoController != null &&
                    _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Container(
                    child: Text(
                      'loading',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
          ),
        ),
      )),
    );
  }
}
