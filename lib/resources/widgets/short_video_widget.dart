import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone/config/theme.dart';
import 'package:ig_clone/resources/widgets/loading_spinner_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:video_player/video_player.dart';

class ShortVideo extends StatefulWidget {
  final String videoUrl;
  ShortVideo({Key? key, required this.videoUrl}) : super(key: key);
  @override
  _ShortVideoState createState() => _ShortVideoState();
}

class _ShortVideoState extends NyState<ShortVideo>
    with TickerProviderStateMixin {
  late VideoPlayerController _videoController;
  double _videoLength = 0;
  double _videoPosition = 0;
  bool _isLiked = false;
  @override
  init() async {
    _videoController = VideoPlayerController.network(widget.videoUrl)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          _videoLength = _videoController.value.duration.inSeconds.toDouble();
        });
        _videoController.play();
      });
    super.init();
  }

  showLikeAnimation() async {
    var controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    var curve =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart);
    var renderBox = context.findRenderObject() as RenderBox;
    var center = renderBox.localToGlobal(
        Offset(renderBox.size.width / 2, renderBox.size.height / 2));
    var heart = SvgPicture.asset(
      getImageAsset("icons/heart_selected.svg"),
      width: 100,
      height: 100,
      color: Colors.white,
    );

    var heartSize = Tween(begin: 0.0, end: 1.0).animate(curve);
    Overlay.of(context)!.insert(
      OverlayEntry(
        builder: (context) => Positioned(
          top: center.dy - 50,
          left: center.dx - 50,
          child: ScaleTransition(
            scale: heartSize,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.transparent),
              child: Center(
                child: heart,
              ),
            ),
          ),
        ),
      ),
    );
    setState(() {
      _isLiked = true;
    });
    controller.forward();
    await Future.delayed(Duration(milliseconds: 500));
    controller.reset();
  }

  volumnToggle() async {
    var controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    var curve = CurvedAnimation(parent: controller, curve: Curves.linear);
    var renderBox = context.findRenderObject() as RenderBox;
    var center = renderBox.localToGlobal(
        Offset(renderBox.size.width / 2, renderBox.size.height / 2));
    var heart = Icon(Icons.volume_mute_rounded, size: 40, color: Colors.white);
    if (_videoController.value.volume == 0) {
      _videoController.setVolume(1);
      heart = Icon(Icons.volume_up_rounded, size: 35, color: Colors.white);
    } else {
      _videoController.setVolume(0);
      heart = Icon(Icons.volume_off_rounded, size: 35, color: Colors.white);
    }
    var heartSize = Tween(begin: 0.0, end: 1.0).animate(curve);
    Overlay.of(context)!.insert(
      OverlayEntry(
        builder: (context) => Positioned(
          top: center.dy - 30,
          left: center.dx - 30,
          child: ScaleTransition(
            scale: heartSize,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black.withAlpha(100)),
              child: Center(
                child: heart,
              ),
            ),
          ),
        ),
      ),
    );

    controller.forward();
    await Future.delayed(Duration(milliseconds: 800));
    controller.reset();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConfig.dark().colors.background,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 65,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    volumnToggle();
                  },
                  child: _videoController != null &&
                          _videoController.value.isInitialized
                      ? GestureDetector(
                          onDoubleTap: (() => showLikeAnimation()),
                          child: Center(
                            child: AspectRatio(
                                aspectRatio: _videoController.value.aspectRatio,
                                child: VideoPlayer(_videoController)),
                          ),
                        )
                      : LoadingSpinner(),
                ),
              ),
              Positioned(
                top: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Short Video',
                        style: TextStyle(
                            color: ThemeConfig.dark().colors.primaryContent,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(
                          getImageAsset(
                            "icons/camera.svg",
                          ),
                          color: ThemeConfig.dark().colors.primaryContent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 65 + 10,
                right: 10,
                child: Container(
                  width: 70,
                  child: Column(
                    verticalDirection: VerticalDirection.up,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              getImageAsset("icons/more_dot.svg"),
                              color: ThemeConfig.dark().colors.primaryContent,
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              getImageAsset("icons/comment.svg"),
                              color: ThemeConfig.dark().colors.primaryContent,
                              height: 25,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("269",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: ThemeConfig.dark()
                                        .colors
                                        .primaryContent,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_isLiked) {
                            setState(() {
                              _isLiked = false;
                            });
                          } else {
                            showLikeAnimation();
                          }
                        },
                        child: Container(
                          child: Column(
                            children: [
                              _isLiked
                                  ? SvgPicture.asset(
                                      getImageAsset("icons/heart_selected.svg"),
                                      color: Colors.red,
                                    )
                                  : SvgPicture.asset(
                                      getImageAsset("icons/heart.svg"),
                                      color: ThemeConfig.dark()
                                          .colors
                                          .primaryContent,
                                      height: 25,
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              Text("86,9 nghìn",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: ThemeConfig.dark()
                                          .colors
                                          .primaryContent,
                                      fontSize: 12)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 60,
                left: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            child: Image.asset(
                                getImageAsset("icons/man_no_avatar.png")),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              "xinhhonmoingay_",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      ThemeConfig.dark().colors.primaryContent),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "Theo dõi",
                              style: TextStyle(
                                  color:
                                      ThemeConfig.dark().colors.primaryContent,
                                  fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 6 * 4.5,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                          "đây là phần caption của video dài quá xem sao",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: ThemeConfig.dark().colors.primaryContent,
                              fontSize: 15)),
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 28,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(
                      right: _videoController.value.isInitialized
                          ? (MediaQuery.of(context).size.width /
                              _videoLength *
                              (_videoLength -
                                  _videoController.value.position.inSeconds))
                          : MediaQuery.of(context).size.width),
                  height: 2,
                  decoration: BoxDecoration(
                      color: ThemeConfig.dark()
                          .colors
                          .primaryContent
                          .withAlpha(100)),
                  child: Container(
                    height: 30,
                    color: ThemeConfig.dark().colors.primaryContent,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
