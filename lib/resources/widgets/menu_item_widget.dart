import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final String svgAsset;
  final Function onTap;

  const MenuItem(
      {Key? key,
      required this.title,
      required this.svgAsset,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(children: [
          SvgPicture.asset(svgAsset,
              color: Theme.of(context).primaryColor, height: 25),
          SizedBox(width: 15),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
            ),
          ),
        ]),
      ),
    );
  }
}
