import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nylo_framework/nylo_framework.dart';

class LoadingSpinner extends StatefulWidget {
  final bool stop;
  LoadingSpinner({this.stop = false});
  @override
  _LoadingSpinnerState createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends NyState<LoadingSpinner>
    with TickerProviderStateMixin {
  late AnimationController loadingController;
  late Animation<double> loadingAnimation;
  late CurvedAnimation curve;
  @override
  init() async {
    loadingController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    curve = CurvedAnimation(parent: loadingController, curve: Curves.easeInOut);
    loadingAnimation = Tween<double>(begin: 0, end: 1).animate(curve);
    loadingController.repeat();

    super.init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: loadingAnimation,
        child: SvgPicture.asset(
          getImageAsset('icons/spinner.svg'),
          height: 50,
          color: Colors.white.withAlpha(100),
        ),
      ),
    );
  }
}
